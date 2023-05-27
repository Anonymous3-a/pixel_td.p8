-- buttons: ⬆️⬇️➡️⬅️❎🅾️

Black      = 0
DarkBlue   = 1
DarkPurple = 2
DarkGreen  = 3
Brown      = 4
DarkGray   = 5
LightGray  = 6
White      = 7
Red        = 8
Orange     = 9
Yellow     = 10
Green      = 11
Blue       = 12
Indigo     = 13
Pink       = 14
Peach      = 15

-- corners
CNR = {tl=1, tr=2, bl=3, br=4, top=5, left=6, right=7, bot=8}

function tbl_find(tbl, fn)
    for v in all(tbl) do
        if fn(v) then
            return v
        end
    end
end

function lerp(a, b, t)
    return a + (b-a)*t
end

function easeout(t)
    return 1 - (1-t)^2
end

function wrap(min, v, max)
    if v > max then return min end
    if v < min then return max end
    return v
end

function round(v)
    return flr(v+0.5)
end

-- Random integer in a range (inclusive)
function rand(low, hi)
    return flr(rnd(hi+1-low)) + low
end

-- Convert grid coordinates to pixel coordinates
function g2p(cell)
    local top  = (cell.y * 12) - 2
    local left = (cell.x * 12) - 2
    return {top=top, left=left, bot=top+12, right=left+12}
end

-- Based on https://github.com/chenglou/react-motion/blob/master/src/stepper.js
function spring(cur_pos, dst_pos, cur_vel, cfg)
    local s = cfg.stiffness or 180 -- more stiffness = snappier, more bounce
    local d = cfg.damping or 12
    local m = cfg.mass or 1        -- more mass = more inertia
    local p = cfg.precision or 0.01

    local Fspring = -s * (cur_pos - dst_pos)
    local Fdamper = -d * cur_vel
    local acc = (Fspring + Fdamper) / m
    local new_vel = cur_vel + acc/60
    local new_pos = cur_pos + new_vel/60

    if abs(cur_vel) < p and abs(new_pos - cur_pos) < p then
        return dst_pos, 0
    end
    return new_pos, new_vel
end

function hcenter(str)
    local mid = 64
    local width = print(str, 0, -20) - 1
    local left = mid - width\2
    return left
end

function print_outlined(str, x, y, color, outline_color)
    local w = print(str, 0, -20)
    rectfill(x-1, y-1, x-1+w, y+5, outline_color or Black)
    print(str, x, y, color)
    return x, w
end
