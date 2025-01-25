#import "@<namespace>/assignment-template:0.1.1": style_exercise_generic

#let (rules: ex_rules, make_title, exercise, subexercise) = style_exercise_generic(
  course: "School of black magic,\nMetaphysics",
  exercise-heading-prefix: "Trial",
)

#set document(title: "Example Exercise") // metadata (often shown as title of the window/tab)


#show: ex_rules

#make_title()

#set heading(numbering: "I.")

= Mandatory Exercises

#exercise[]

Here we go. #lorem(30)


#exercise[Binary]

#lorem(50)

#subexercise[]
#lorem(10)

#subexercise[]
#lorem(12)

#exercise[Hexa-decimal]

#lorem(30)


= Elective Compulsory Exercises


#exercise[Foo]

\-

#exercise(num-format: "I")[Roman]
#subexercise[number 9]

The number 9 can be written as IX.

#subexercise[89 and 99]

Number 89 is for example LXXXIX but 99 is just XCIX.

#exercise(prefix: "Final Trial")[#lorem(3)]

#lorem(50). That's all. Trivial.

