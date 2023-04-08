--[[ anti-anti-alias. ]]--


-- some first-class game programming tools. 
-- i don't wanna explicitly type these out every time,
-- so i have these handy variable names instead.
    lg      = love.graphics
    bg      = lg.clear
    fg      = lg.setColor
    sin     = math.sin
    cos     = math.cos
    ins     = table.insert
    shade   = lg.setShader
    floor   = math.floor
    abs     = math.abs
    pi      = math.pi
    rem     = table.remove
    sw,sh   = lg.getDimensions()
    sub     = string.sub
    fmt     = string.format
    rect    = lg.rectangle
    random  = love.math.random