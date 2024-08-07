#import "template.typ": *
#import "common.typ": *
#show: thmrules

#show: project.with(
  title: "The title of this Thesis", 
  short: "Short Title",
  author: (
    name: "Your Name",
    email: "your@mailbox.com",
    born: (
      where: "Somewhere",
      when: datetime.today(),
    ),
  ),
  supervisor: "Supervisor Name"
)

// #show emph: it => {text(weight: "bold", it)}

#include "01_intro.typ"
#include "02_background.typ"
#include "03_topic.typ"
#include "04_implementation.typ"
#include "05_discussion.typ"
#include "06_conclusion.typ"

#bibliography("references.bib", style: "association-for-computing-machinery")