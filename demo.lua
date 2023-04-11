function demodraw()
    love.graphics.clear(0.4,0.4,0.4)

    love.graphics.setLineWidth(40)

    -- outline
        love.graphics.setColor(0.8,0.8,0.8)
        bezier(dot(200,440+100),dot(200,200+100),dot(440,200+100),(t-50*6)*0.02,t*0.02)
        bezier(dot(440,200+100),dot(440,200-200+100),dot(440+200+200,200-200+100),(t-50*7)*0.02,(t-50)*0.02)
    -- upper
        love.graphics.setColor(0.8,0.4,0.4)
        bezier(dot(440+60,200+100+60),dot(440+60,200-200+100+60),dot(440+200+200+60,200-200+100+60),(t-(50*6+30))*0.02,(t-50*2)*0.02)
        love.graphics.setColor(0.4,0.8,0.4)
        bezier(dot(440+60+60,200+100+60),dot(440+60+60,200-200+100+60+60),dot(440+200+200+60,200-200+100+60+60),(t-(50*6+30))*0.02,(t-50*3)*0.02)
    -- lower
        love.graphics.setColor(0.8,0.8,0.8)
        bezier(dot(440,200+100+5*60-20),dot(440,200-200+100+5*60-20),dot(440+200+200,200-200+100+5*60-20),(t-50*6)*0.02,(t-50*2)*0.02)
        love.graphics.setColor(0.8,0.4,0.4)
        bezier(dot(440+60,200+100+60+5*60-20),dot(440+60,200-200+100+60+5*60-20),dot(440+200+200+60,200-200+100+60+5*60-20),(t-(50*6+30))*0.02,(t-50*3)*0.02)
        love.graphics.setColor(0.4,0.8,0.4)
        bezier(dot(440+60+60,200+100+60+5*60-20),dot(440+60+60,200-200+100+60+60+5*60-20),dot(440+200+200+60,200-200+100+60+60+5*60-20),(t-(50*6+30))*0.02,(t-50*4)*0.02)
    if t>=50*8 then t=0 end
end

function demodraw2()
    love.graphics.clear(0.8,0.8,0.4)

    -- magenta flash
    if t>=50+30 then
    love.graphics.setLineWidth(60)

    love.graphics.setColor(0.8,0.4,0.8,1-(t-50)*0.02)
    bezier(dot(240+40+140,40),dot(240+40+140,40+240),dot(240+240+240+140,640-240),dot(240+240+240+140,640))
    bezier(dot(240+240+240+140,40),dot(240+240+240+140,40+240),dot(240+40+140,640-240),dot(240+40+140,640))
    end

    love.graphics.setColor(0.4,0.4,0.2)
    love.graphics.setLineWidth(20)

    bezier(dot(240+40+140,40),dot(240+40+140,40+240),dot(240+240+240+140,640-240),dot(240+240+240+140,640),(t-90)*0.02,t*0.02)

    -- dotted lines
    love.graphics.setLineWidth(3)    
    local start_t=math.max((t-90)*0.02,0)
    local end_t=math.min(t*0.02,1)
    for i=0,1,0.25/2 do
    local dotted=(i+t*0.01)%1     
    local dotend=0.125/2
    bezier(dot(240+40+140,40),dot(240+40+140,40+240),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+40+140,40+240),dot(240+240+240+140,640-240),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+240+240+140,640-240),dot(240+240+240+140,640),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    end

    love.graphics.setLineWidth(20)
    bezier(dot(240+240+240+140,40),dot(240+240+240+140,40+240),dot(240+40+140,640-240),dot(240+40+140,640),(t-90-30)*0.02,(t-30)*0.02)

    -- dotted lines
    love.graphics.setLineWidth(3)
    local start_t=math.max((t-90-30)*0.02,0)
    local end_t=math.min((t-30)*0.02,1)
    for i=0,1,0.25/2 do
    local dotted=(i+t*0.01)%1
    local dotend=0.125/2
    bezier(dot(240+240+240+140,40),dot(240+240+240+140,40+240),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+240+240+140,40+240),dot(240+40+140,640-240),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+40+140,640-240),dot(240+40+140,640),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    end

    if t>=90+30+50 then t=0; love.draw=demodraw3 end
end

function demodraw3()
    love.graphics.clear(0.8,0.8,0.4)

    -- magenta flash
    if t>=50+50 then
    love.graphics.setLineWidth(60)

    love.graphics.setColor(0.8,0.4,0.8,1-(t-50-50+30)*0.02)
    bezier(dot(240+40+140,20),dot(240+40+140,20+320),dot(240+240+240+140,20+320))
    bezier(dot(240+240+240+140,20+320),dot(240+40+140,20+320),dot(240+40+140,20+320+20+320))
    bezier(dot(240+240+240+140,20),dot(240+240+240+140,20+320),dot(240+40+140,20+320),(t-50-50-50-20)*0.02,(t-50)*0.02)
    bezier(dot(240+40+140,20+320),dot(240+240+240+140,20+320),dot(240+240+240+140,20+320+20+320),(t-50-50-50-20)*0.02,(t-50)*0.02)
    end

    love.graphics.setColor(0.4,0.4,0.2)
    love.graphics.setLineWidth(20)

    bezier(dot(240+40+140,20),dot(240+40+140,20+320),dot(240+240+240+140,20+320),(t-50-50-20)*0.02,t*0.02)
    bezier(dot(240+240+240+140,20+320),dot(240+40+140,20+320),dot(240+40+140,20+320+20+320),(t-50-50-20)*0.02,t*0.02)

    -- dotted lines
    love.graphics.setLineWidth(3)
    local start_t=math.max((t-50-50-20)*0.02,0)
    local end_t=math.min(t*0.02,1)
    for i=0,1,0.25/2 do
    local dotted=(i+t*0.01)%1
    local dotend=0.125/2
    bezier(dot(240+40+140,20),dot(240+40+140,20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+40+140,20+320),dot(240+240+240+140,20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+240+240+140,20+320),dot(240+40+140,20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+40+140,20+320),dot(240+40+140,20+320+20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    end

    love.graphics.setLineWidth(20)

    bezier(dot(240+240+240+140,20),dot(240+240+240+140,20+320),dot(240+40+140,20+320),(t-50-50-50-20)*0.02,(t-50)*0.02)
    bezier(dot(240+40+140,20+320),dot(240+240+240+140,20+320),dot(240+240+240+140,20+320+20+320),(t-50-50-50-20)*0.02,(t-50)*0.02)

    -- dotted lines
    love.graphics.setLineWidth(3)
    local start_t=math.max((t-50-50-50-20)*0.02,0)
    local end_t=math.min((t-50)*0.02,1)
    for i=0,1,0.25/2 do
    local dotted=(i+t*0.01)%1
    local dotend=0.125/2
    bezier(dot(240+240+240+140,20),dot(240+240+240+140,20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+240+240+140,20+320),dot(240+40+140,20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+40+140,20+320),dot(240+240+240+140,20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    bezier(dot(240+240+240+140,20+320),dot(240+240+240+140,20+320+20+320),math.max(dotted,start_t),math.min(dotted+dotend,end_t))
    end

    if t>=50+50+50+50+20 then t=0; love.draw=demodraw2 end
end

function stardraw()
    love.graphics.clear(0.4,0.4,0.2)

    love.graphics.setColor(0.8,0.8,0.4)
    love.graphics.setLineWidth(20)

    for j=0,5 do
    for i=0,5-1 do
        -- take 5 points along a circle
        local a=-math.pi/2+2*math.pi/5*i
        local a2=a-math.pi/6-0.1
        local a3=a+math.pi/6+0.1

        love.graphics.setColor(0.8-(0.05*j+t*0.01)%(0.05*6),0.8-(0.05*j+t*0.01)%(0.05*6),0.4-(0.05*j+t*0.01)%(0.05*6))

        bezier(dot(1280/2+math.cos(a2)*(120+j*40),720/2+math.sin(a2)*(120+j*40)),dot(1280/2+math.cos(a)*(280+j*40),720/2+math.sin(a)*(280+j*40)),dot(1280/2+math.cos(a3)*(120+j*40),720/2+math.sin(a3)*(120+j*40)))
    end
    end
end

--[[ END OF DEMO CODE ]]
--[[ uncomment one of the following ]]
--[[ lines to see demos in action.]]

--love.draw = demodraw

--love.draw = demodraw2

--love.draw = stardraw