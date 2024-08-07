#import "@preview/ctheorems:1.1.0": *

#let dashed = (paint: rgb("202010"), thickness: .5pt, dash: "dashed")
#let nodash = (paint: rgb("202010"), thickness: .5pt)

#let definition = thmbox(
  "definition",
  "Definition",
  base_level: 1,
  stroke: nodash
)

#let lemma = thmbox("lemma", "Lemma", base_level: 1, stroke: dashed)
#let example = thmbox("example", "Example", base_level: 1, stroke: dashed)
#let proof = thmplain(
  "proof",
  "Proof",
  titlefmt: smallcaps,
  bodyfmt: it => par(justify: false)[ #it #h(1fr) $square$ ],
).with(numbering: none)
#let specification = thmbox(
  "specification",
  "Specification",
  base_level: 1,
  stroke: rgb("202010") + .5pt,
)

