alias b := build
alias w := watch

build_dir:
    mkdir -p build

build: build_dir
    typst compile src/main.typ build/thesis.pdf

watch: build_dir
    typst watch src/main.typ build/thesis.pdf
