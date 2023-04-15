function dot(x,y)
    return {x=x,y=y}
end

function linear(dot1,dot2,t)
    return dot((1-t)*dot1.x+t*dot2.x, (1-t)*dot1.y+t*dot2.y)
end

function bezier(dot1,dot2,dot3,dot4,start_t,end_t)
    local process
    if type(dot4)=='table' then process='cubic'; end_t=end_t or 1; start_t=start_t or 0; 
    elseif type(dot3)=='table' then process='quadratic'; end_t=start_t or 1; start_t=dot4 or 0
    elseif type(dot2)=='table' then process='linear'; end_t=dot4 or 1; start_t=dot3 or 0;
    elseif type(dot1)=='table' then process='point'
    else return end

    if process=='point' then
        local w=love.graphics.getLineWidth()
        
        if painting_with=='rectangles' then
        love.graphics.rectangle('fill',dot1.x-w/2,dot1.y-w/2,w,w)
        elseif painting_with=='circles' then
        love.graphics.circle('fill',dot1.x,dot1.y,w/2)
        end
    end
    if process=='linear' then
        local len=math.sqrt((dot2.x-dot1.x)^2+(dot2.y-dot1.y)^2)
        for dt=math.max(start_t,0),math.min(end_t,1),1/len do
            local lin=linear(dot1,dot2,dt)
            local w=love.graphics.getLineWidth()
            
            if painting_with=='rectangles' then
            love.graphics.rectangle('fill',lin.x-w/2,lin.y-w/2,w,w)
            elseif painting_with=='circles' then
            love.graphics.circle('fill',lin.x,lin.y,w/2)
            end
        end
    end
    if process=='quadratic' then
        local len=math.sqrt((dot2.x-dot1.x)^2+(dot2.y-dot1.y)^2)+math.sqrt((dot3.x-dot2.x)^2+(dot3.y-dot2.y)^2)
        for dt=math.max(start_t,0),math.min(end_t,1),1/len do
            local lin=linear(dot1,dot2,dt)
            local lin2=linear(dot2,dot3,dt)
            local quad=linear(lin,lin2,dt)
            local w=love.graphics.getLineWidth()
            
            if painting_with=='rectangles' then
            love.graphics.rectangle('fill',quad.x-w/2,quad.y-w/2,w,w)
            elseif painting_with=='circles' then
            love.graphics.circle('fill',quad.x,quad.y,w/2)
            end
        end
    end
    if process=='cubic' then
        local len=math.sqrt((dot2.x-dot1.x)^2+(dot2.y-dot1.y)^2)+math.sqrt((dot3.x-dot2.x)^2+(dot3.y-dot2.y)^2)+math.sqrt((dot4.x-dot3.x)^2+(dot4.y-dot3.y)^2)
        for dt=math.max(start_t,0),math.min(end_t,1),1/len do
            local lin=linear(dot1,dot2,dt)
            local lin2=linear(dot2,dot3,dt)
            local quad=linear(lin,lin2,dt)
            local lin3=linear(dot3,dot4,dt)
            local quad2=linear(lin2,lin3,dt)
            local cubic=linear(quad,quad2,dt)
            local w=love.graphics.getLineWidth()

            if painting_with=='rectangles' then
            love.graphics.rectangle('fill',cubic.x-w/2,cubic.y-w/2,w,w)
            elseif painting_with=='circles' then
            love.graphics.circle('fill',cubic.x,cubic.y,w/2)
            end
        end
    end
end