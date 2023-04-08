function draw()
    love.graphics.clear(0.8,0.8,0.4)

    love.graphics.setColor(0.4,0.4,0.2)
    love.graphics.setLineWidth(5)

    if t>=0 then
        -- single point
        bezier(dot(200,100))
    end
    if t>=30 then
        -- line
        bezier(dot(100,100),dot(400,400),(t-30)*0.02)
    end
    if t>=30*2 then
        -- curve
        bezier(dot(100,100),dot(400,400),dot(400,100),(t-30*2)*0.02)
    end
    if t>=30*3 then
        -- double curve
        bezier(dot(100,100),dot(400,400),dot(400,100),dot(700,200),(t-30*3)*0.04)
    end
end

love.draw = draw