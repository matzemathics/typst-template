// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  short: "",
  author: none,
  supervisor: "",
  body) = {
  // Set the document's basic properties.
  set document(author: author.name, title: title)
  set footnote(numbering: "[1]")

  // Save heading and body font families in variables.
  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set page(footer: locate(loc => {
    if loc.page() <= 4 {
      // align(center, counter(page).display("- I -"))
      none
    } else {
      align(center, counter(page).display("- 1 -"))
    }
  }))
  set page(
    header: locate(
      loc => {
        let elems_after = query(selector(heading.where(level: 2)).after(loc), loc)
        let elems_after_h = query(selector(heading.where(level: 1)).after(loc), loc)
        let elems_before = query(selector(heading.where(level: 2)).before(loc), loc)
        let title = smallcaps[
          #short
        ]

        if elems_after != () and elems_after.first().location().page() == loc.page() {
          let body = elems_after.first().body
          title + h(1fr) + emph(body)
        }
        else if elems_after_h != () and elems_after_h.first().location().page() == loc.page() {
          let body = elems_after_h.first().body
          title + h(1fr) + emph(body)
        }
        else if elems_before != () {
          let body = elems_before.last().body
          title + h(1fr) + emph(body)
        }
      },
    ),
  )

  // Set body font family.
  set text(font: body-font, lang: "en")
  show math.equation: set text(weight: 400)
  show heading: set text(font: sans-font)
  set heading(numbering: "1.1", supplement: it => {
    if it.has("level") and it.level == 1 {
      [Chapter]
    }
    else {
      [Section]
    }
  })

  // Set run-in subheadings, starting at level 3.
  show heading: it => {
    if it.level > 2 {
      parbreak()
      text(11pt, style: "italic", weight: "regular", it.body + ".")
    } else if it.level == 1 and it.outlined {
      pagebreak(weak: true)
      it
    } else {
      it
    }
  }

  // Title page.
  [
    #columns(2)[
      #image("assets/tu_logo_crop.svg", width: 70%)
      #colbreak()
      #set align(right)
      #text(1.2em, weight: "semibold")[
        Faculty of Computer Science \
        Knowledge Based Systems
      ]
    ]
    #set align(center)
    #v(1fr)
    #text(1.2em, smallcaps("Bachelor Thesis"))
    #v(1em)
    #block(text(font: sans-font, weight: 700, 2.3em, title))
    #v(1fr)

    // Author information.
    _submitted by_ \
    #v(.5em)
    #text(1.7em)[*#author.name*]
    #parbreak()
    #author.email \
    #author.born.when.display(), #author.born.where

    #v(1fr)
    Supervisor: #supervisor

    #datetime.today().display("[month repr:long] [year]")

    #v(1fr)
  ]

  pagebreak()

  v(10em)
  heading(numbering: none, outlined: false, level: 1)[Abstract]
  box(width: 85%, include "abstract.typ")

  pagebreak()

  v(10em)
  heading(numbering: none, outlined: false, level: 1)[Acknowledgements]
  box(width: 85%)[
    I want to thank my supervisor, #supervisor for guiding
    me through this project.
  ]

  v(1fr)
  heading(numbering: none, outlined: false, level: 1)[
    Declaration of independent work
  ]
  v(1.5em)
  box(width: 85%)[
    I hereby declare that this thesis titled

    "*#title*"

    is a work of my own, and only cited sources have been used.
    I am submitting this thesis for the first time
    as a piece of assessed academic work.
  ]
  v(7em)
  // image("assets/signature.png", width: 35%)
  rect(width: 35%, height: 3em)
  [Dresden, #datetime.today().display("[month repr:long] [day], [year]")]

  pagebreak()

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }
  outline(depth: 2, indent: auto)
  pagebreak()

  // Main body.
  set par(justify: true)
  counter(page).update(1)

  body
}