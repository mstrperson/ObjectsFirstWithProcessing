# Week 1 Notes
## Objects First
Traditional Computer Science education lacks the kind of magical black boxes that students can take apart and put back together the way we do with more hands on STEM electives.  This Objects-First approach provides students with some of those magical black boxes that can be used without requiring that they fully understand what is going on in the background.  The goal is that by the end of the course, students *should* be able to understand those black boxes well enough to modify and manipulate them to serve their purposes.
### Player class
`Player` is where the student should develop their avatar.  They can play with drawing in here and it can be a side burner project to continue developing throught the term as they learn new tricks.  Player is straight forward and only need to know its starting point and how to `drawSprite()`.  In the Week2 example code, the `draw()` method uses `player.keyboardControl()` which encapsulates using the arrow keys to control the character.  Since that isn't the major objective for this week, it can remain in the black box for now.  If there are particularly ambitious students, they might poke around in that code and see what it says.

### Drawing Practice
It is of utmost imporant to reinforce to the students that the `drawSprite()` method needs the student to reference the `x` and `y` coordinate of the `Player`.  To help student do this concretely, try using the graph paper, but a smaller piece that has **(X, Y)** as the center point of the graph instead of **(0, 0)** in the upper left corner.
