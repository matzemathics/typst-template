#import "template.typ": *

#show: project.with(
  title: "Typst template document",
  authors: (
    (name: "Matthias Meißner", email: "matthias.meissner2@mailbox.tu-dresden.de"),
  ),
)

= Introduction
#lorem(60)

== In this paper
#lorem(20)

=== Contributions
#lorem(40)

= Related Work
#lorem(500)

#bibliography("references.bib")
