function dot(x,y)
    return {x=x,y=y}
end

function linear(dot1,dot2,t)
    return dot((1-t)*dot1.x+t*dot2.x, (1-t)*dot1.y+t*dot2.y)
end

function bezier(dot1,dot2,dot3,dot4,t)
    if t==nil then 
        if dot4==nil then
            if dot3==nil or dot2==nil then
                -- single point
                local w=love.graphics.getLineWidth()
                love.graphics.rectangle('fill',dot1.x-w/2,dot1.y-w/2,w,w)
            else
                -- linear
                t=dot3
                local len=math.sqrt((dot2.x-dot1.x)^2+(dot2.y-dot1.y)^2)
                for dt=0,math.min(t,1),1/len do
                    local lin=linear(dot1,dot2,dt)
                    local w=love.graphics.getLineWidth()
                    love.graphics.rectangle('fill',lin.x-w/2,lin.y-w/2,w,w)
                end
            end
        else
            -- quadratic
            t=dot4 
            local len=math.sqrt((dot2.x-dot1.x)^2+(dot2.y-dot1.y)^2)+math.sqrt((dot3.x-dot2.x)^2+(dot3.y-dot2.y)^2)
            for dt=0,math.min(t,1),1/len do
                local lin=linear(dot1,dot2,dt)
                local lin2=linear(dot2,dot3,dt)
                local quad=linear(lin,lin2,dt)
                local w=love.graphics.getLineWidth()
                love.graphics.rectangle('fill',quad.x-w/2,quad.y-w/2,w,w)
            end
        end
    else
        -- cubic
        local len=math.sqrt((dot2.x-dot1.x)^2+(dot2.y-dot1.y)^2)+math.sqrt((dot3.x-dot2.x)^2+(dot3.y-dot2.y)^2)+math.sqrt((dot4.x-dot3.x)^2+(dot4.y-dot3.y)^2)
        for dt=0,math.min(t,1),1/len do
            local lin=linear(dot1,dot2,dt)
            local lin2=linear(dot2,dot3,dt)
            local quad=linear(lin,lin2,dt)
            local lin3=linear(dot3,dot4,dt)
            local quad2=linear(lin2,lin3,dt)
            local cubic=linear(quad,quad2,dt)
            local w=love.graphics.getLineWidth()
            love.graphics.rectangle('fill',cubic.x-w/2,cubic.y-w/2,w,w)
        end
    end
end
    
