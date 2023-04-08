--[[ commonplace utility functions. ]]--


-- basic AABB collision.
    function AABB(x1,y1,w1,h1, x2,y2,w2,h2)
        return (x1 < x2 + w2 and
                x1 + w1 > x2 and
                y1 < y2 + h2 and
                y1 + h1 > y2)
    end

-- find by value. can return nil if not found
-- wish Lua had a C-optimized implementation, kinda silly that you have to provide your own.
    function find(tbl,what) for i,v in ipairs(tbl) do if v==what then return i end end
    end

-- find by condition
    function findf(tbl,how) for i,v in ipairs(tbl) do if how(v) then return i end end
    end

-- amount of keys in table with non-numeric keys
    function pairslength(tbl) local out=0; for video,games in pairs(tbl) do out=out+1 end; return out
    end

-- needed for deep copying tables. just got this online lol
    function deepcopy(orig, copies)
        copies = copies or {}
        local orig_type = type(orig)
        local copy
        if orig_type == 'table' then
            if copies[orig] then
                copy = copies[orig]
            else
                copy = {}
                copies[orig] = copy
                setmetatable(copy, deepcopy(getmetatable(orig), copies))
                for orig_key, orig_value in next, orig, nil do
                    copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
                end
            end
        else -- number, string, boolean, etc
            copy = orig
        end
        return copy
    end

-- do all in table satisfy a condition? (function returning true/false for any table element)
    function all(tbl,cond)
        for i,v in ipairs(tbl) do
            if not cond(v) then return false end
        end
        return true
    end

-- has a key been tapped, rather than held down.
    local keyboard = {}
    function tapped(k)
        if love.keyboard.isDown(k) then
            if not keyboard[k] then
                keyboard[k]=true
                return true
            end
        else 
            keyboard[k]=false
            return false 
        end
    end
    function press(k)
        if love.keyboard.isDown(k) then
            keyboard[k]=true
            return true
        else 
            keyboard[k]=false
            return false 
        end
    end

function round(n) return floor(n+0.5) end

-- cycle any table's counter variable 'i' (usually on keypress)
    function cycle(tbl,dir)
        dir=dir or 1
        tbl.i=tbl.i+dir
        if tbl.i<1 then tbl.i=#tbl elseif tbl.i>#tbl then tbl.i=1 end
    end

-- not global variables but REGISTER variables!! :thonk:
-- sometimes functions have side effects and relying on their
-- success values would be cumbersome, so i set keys in this.
    REG = {}
