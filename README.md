*Create an application that can read in commands of the following form*

```
PLACE X,Y,FACING
MOVE
LEFT
RIGHT
REPORT
```

- PLACE will put the toy robot on the table in position `X`,`Y` and facing `NORTH`, `SOUTH`, `EAST` or
`WEST`.
- The origin (0,0) can be considered to be the `SOUTH WEST` most corner.
- The first valid command to the robot is a `PLACE` command, after that, any sequence of
commands may be issued, in any order, including another `PLACE` command. The application
should discard all commands in the sequence until a valid `PLACE` command has been
executed.
- `MOVE` will move the toy robot one unit forward in the direction it is currently facing.
- `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing
the position of the robot.
- `REPORT` will announce the `x`,`y` and `facing` of the robot. This can be in any form, but standard
output is sufficient.
- A robot that is not on the table can choose the ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT`
commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

### Constraints:
The toy robot must not fall off the table during movement. This also includes the initial
placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

### Example Input and Output:
- *a)*
```
PLACE 0,0,NORTH
MOVE
REPORT
```
Output: `0,1,NORTH`
- *b)*
```
PLACE 0,0,NORTH
LEFT
REPORT
```
Output: `0,0,WEST`
- *c)*
```
PLACE 1,2,EAS
