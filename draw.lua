-- change this to paint_with('circles')
-- if you want round endpoints for lines.
    paint_with('circles')

function draw()
    love.graphics.clear(0.8,0.8,0.4)

    love.graphics.setColor(0.4,0.4,0.2)
    love.graphics.setLineWidth(15)

    -- single point
    bezier(dot(200,100))
    -- line
    bezier(dot(100,100),dot(400,400),(t-30*4)*0.02,(t-30)*0.02)
    -- curve
    bezier(dot(100,100),dot(400,400),dot(400,100),(t-30*5)*0.02,(t-30*2)*0.02)
    -- double curve
    bezier(dot(100,100),dot(400,400),dot(400,100),dot(700,200),(t-30*6)*0.04,(t-30*3)*0.04)

    if t>=30*6+30 then t=0 end
end

love.draw = draw

-- TODO: install font(s)