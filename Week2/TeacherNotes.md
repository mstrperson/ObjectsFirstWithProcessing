# Week 1 Notes
## Objects First
Traditional Computer Science education lacks the kind of magical black boxes that students can take apart and put back together the way we do with more hands on STEM electives.  This Objects-First approach provides students with some of those magical black boxes that can be used without requiring that they fully understand what is going on in the background.  The goal is that by the end of the course, students *should* be able to understand those black boxes well enough to modify and manipulate them to serve their purposes.
### Sprite class
`Sprite` is the first of these magic black boxes and definitely should not be the *subject* of the first week of class.  It provides a framework that students can build on and use throughtout the course and should eventually be readable by them.  But, for now, it's in the scary zone and should be glossed over beyond it's most basic description.

**A `Sprite` is a thing that has a position and velocity and can be drawn on the screen.**

### Blob class
`Blob` is the first most boring class that the students can directly interact with.  It has the concrete representation as a ball bouncing around the screen.

The `Blob` class also has the *implementation* for the `drawSprite()` method.  This is where students can draw their character.  What is most important here is to reinforce that anything that the student draws in the `drawSprite()` method should reference the coordinates `x` and `y`.
