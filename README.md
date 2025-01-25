
# Template for Assignments at the university


## Installation

You can clone this repo into `~/.local/share/typst/packages/<namespace>/assignment-template` like this:

```bash
git clone git@github.com:TabError/typst-assignment-template.git ~/.local/share/typst/packages/local/assignment-template
```


## Usage

In your documents you can use the template as following:

```typst
#import "@local/assignment-template:0.1.3": style_exercise_generic

#let (rules: ex_rules, make_title, exercise, subexercise) = style_exercise_generic(
  course: "School of black magic,\nMetaphysics",
  exercise-heading-prefix: "Trial",
)

#set document(title: "Example Exercise") // metadata (often shown as title of the window/tab)


#show: ex_rules

#make_title()

...
```


