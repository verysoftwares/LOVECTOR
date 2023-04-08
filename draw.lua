-- draw setup
    lg.setDefaultFilter('nearest')

function draw()
    bg(0.8,0.8,0.4)

    fg(0.4,0.4,0.2)
    lg.setLineWidth(5)

    if t>=0 then
    bezier(dot(200,100))
    end
    if t>=30 then
    bezier(dot(100,100),dot(400,400),(t-30)*0.02)
    end
    if t>=30*2 then
    bezier(dot(100,100),dot(400,400),dot(400,100),(t-30*2)*0.02)
    end
    if t>=30*3 then
    bezier(dot(100,100),dot(400,400),dot(400,100),dot(700,200),(t-30*3)*0.04)
    end
end

love.draw= draw