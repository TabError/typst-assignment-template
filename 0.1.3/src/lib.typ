#let style_exercise_generic(
  // general data
  course: "Metaphysics",
  sheet: "Exercise 99",
  tutor: "David Hilbert",
  authors: ("Kurt Gödel", "Emmy Noether"),
  institution: "University of Oxford", // TODO: add an option to display the institution somewhere
  // exercise numbering
  exercise-heading-prefix: "Exercise",
  exercise-heading-numbering-format: "1",
  subexercise-heading-prefix: "",
  subexercise-heading-numbering-format: "a)",
  subsubexercise-heading-prefix: "",
  subsubexercise-heading-numbering-format: "(i)",
  // feedback
  feedback-color: red, // typst color
  // misc
  lang: "en",
) = {
  // small title function
  let make_title(title: sheet) = align(center, text(weight: "medium", 20pt, title))

  // rules
  let rules(doc) = {
    set text(lang: lang)

    set page(paper: "a4")
    // TODO make two templates with different margins
    // set page(margin: 1.7in) // more like paper style with large margins
    set page(margin: (bottom: 1in, rest: 1.3in)) // default margin is 2.5/21 * page-width("a4") = 2.5cm ~ 1in
    set par(
      leading: 0.55em,
      justify: true,
    )
    set text(font: "New Computer Modern") // the default LaTeX font
    show raw: set text(font: "New Computer Modern Mono")

    set page(
      header: {
        set text(10pt)
        table(
          columns: (1fr, 1fr, 1fr),
          align: (left, center, right),
          stroke: (bottom: 0.5pt, rest: none),
          course, sheet, authors.join(", ") //, last: " and ")
        )
      },
    )

    set page(numbering: "1 / 1")

    // math rules
    set math.equation(numbering: "(1)")
    set math.equation(supplement: [Eq.])

    doc
  }

  // custom exercise headings
  let counter-exercise = counter("counter-exercise")

  let base_exercise_heading(prefix, num-format, level, content) = {
    // options depeding on level
    let w = if level in (1,) { "medium" } else { "regular" }
    let s = if level == 1 { 16pt } else if level == 2 { 14pt } else { 12pt }

    // constructing final content
    counter-exercise.step(level: level)
    let c = context [
      #set text(size: s)
      #set text(weight: w)
      #prefix
      #numbering(num-format, counter-exercise.get().at(level - 1))
      #if content != [] [ \- #content ]
    ]

    // result
    let space-above = (2.2em, 1.6em, 1.3em).at(level - 1)
    block(sticky: true, width: 100%, above: space-above, c)
  }

  let exercise(prefix: none, num-format: none, content) = {
    let level = 1
    if prefix == none { prefix = exercise-heading-prefix }
    if num-format == none { num-format = exercise-heading-numbering-format }
    base_exercise_heading(prefix, num-format, level, content)
  }
  let subexercise(prefix: none, num-format: none, content) = {
    let level = 2
    if prefix == none { prefix = subexercise-heading-prefix }
    if num-format == none { num-format = subexercise-heading-numbering-format }
    base_exercise_heading(prefix, num-format, level, content)
  }
  let subsubexercise(prefix: none, num-format: none, content) = {
    let level = 3
    if prefix == none { prefix = subsubexercise-heading-prefix }
    if num-format == none { num-format = subsubexercise-heading-numbering-format }
    base_exercise_heading(prefix, num-format, level, content)
  }

  let feedback(body) = block(
    width: 100%,
    inset: 4em,
    outset: -2.5em,
    radius: 1em,
    stroke: 2pt + feedback-color,
    fill: feedback-color.transparentize(80%),
  )[
    *Tutor Feedback:*\
    #body
  ]

  return (
    "make_title": make_title,
    "rules": rules,
    "exercise": exercise,
    "subexercise": subexercise,
    "subsubexercise": subsubexercise,
    "feedback": feedback,
  )
}

