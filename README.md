# LÖVECTOR
 a vector graphics library for https://love2d.org

# running
 copy all files to an empty LÖVE project folder. editing draw.lua is a good place to start.

# using
 call the `bezier` function with 1-4 `dot`s as arguments, as well as startpoint and endpoint parameters ranging from 0-1 (used for animating the curves). for example, `bezier(dot(100,100),dot(400,400),dot(400,100),0,1)` will draw a curve from 100,100 to 400,100 via 400,400.
