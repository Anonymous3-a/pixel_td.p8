-- Red -------------------------------------------------------------------------

local function update_bullet_red(twr, blt)
    local enmy = blt.enemy
    if enmy.hp == 0 then
        del(twr.bullets, blt)
        return
    end

    -- update particles
    for p in all(blt.particles) do
        p.age += 1
        if p.age > 3 then
            del(blt.particles, p)
        end
    end

    local oldx, oldy = blt.x, blt.y

    -- update bullet position
    local dx = enmy.x - blt.x
    local dy = enmy.y - blt.y
    blt.rotation = atan2(dx, dy)
    blt.x = blt.x + cos(blt.rotation)*1
    blt.y = blt.y + sin(blt.rotation)*1

    -- handle collision
    if collide(blt, enmy) then
        enmy.hp = max(0, enmy.hp-twr.dmg)
        del(twr.bullets, blt)
    else
        -- add particle
        if t%2 == 0 then
            add(blt.particles, {x=oldx, y=oldy, age=1})
        end
    end
end

local function fire_bullet_red(twr)
    twr.cd = max(0, twr.cd-1)
    if twr.cd > 0 then return end
    for enmy in all(enemies) do
        if is_in_range(enmy, twr) then
            local p = g2p(twr)
            add(twr.bullets, {
                x=p.left+6, y=p.top+6,
                rotation=0,
                enemy=enmy,
                particles={},
            })
            twr.cd = twr.atkspd
            break
        end
    end
end

local function draw_bullets_red(twr)
    for blt in all(twr.bullets) do
        pset(blt.x, blt.y, C.red)
        for part in all(blt.particles) do
            pset(part.x, part.y, C.dark_purple)
        end
    end
end

-- Green -----------------------------------------------------------------------

local function update_bullet_green(twr, blt)
    local enmy = blt.enemy
    if enmy.hp == 0 or not is_in_range(enmy, twr) then
        del(twr.bullets, blt)
    else
        blt.age += 1
        if blt.age > 2 then -- don't trigger damage every frame
            enmy.hp = max(0, enmy.hp-twr.dmg)
            blt.age = 0
        end
        -- update particle
        local oldx, oldy = enmy.x, enmy.y
        if t%3 == 0 then
            deli(blt.particles, 1)
            add(blt.particles, {x=oldx, y=oldy, age=1})
        end
    end
end

local function fire_bullet_green(twr)
    if #twr.bullets > 0 then return end
    for enmy in all(enemies) do
        if is_in_range(enmy, twr) then
            add(twr.bullets, {
                -- x=0, y=0,
                -- rotation=0,
                age=0,
                enemy=enmy,
                particles={},
            })
            return
        end
    end
end

local function draw_bullets_green(twr)
    local blt = twr.bullets[1]
    if blt then
        local t = g2p(twr)
        for part in all(blt.particles) do
            line(t.left+6, t.top+6, part.x, part.y, C.dark_green)
        end
        line(t.left+6, t.top+6, blt.enemy.x, blt.enemy.y, C.green)
        -- don't cover up center pixel
        pset(t.left+6, t.top+6, C.black)
        pset(blt.enemy.x, blt.enemy.y, C.black)
    end
end

-- Yellow ----------------------------------------------------------------------

local MAX_BULLETS_YELLOW = 3
local MAX_AGE_YELLOW = 60

local function update_bullets_yellow(twr)
    for blt in all(twr.bullets) do
        if blt.enemy.hp == 0 then
            del(twr.bullets, blt)
        else
            blt.age += 1
        end
    end
    if #twr.bullets == 0 then return end
    if twr.bullets[1].age >= MAX_AGE_YELLOW then
        twr.bullets = {}
    else
        if twr.bullets[1].age == 30 then
            -- register damage & slow
            for blt in all(twr.bullets) do
                blt.enemy.hp = max(0, blt.enemy.hp-twr.dmg)
                blt.enemy.slow = 0.3
                blt.enemy.slow_dur = 100
            end
        end
    end
end

local function fire_bullet_yellow(twr)
    twr.cd = max(0, twr.cd-1)
    if twr.cd > 0 or #twr.bullets > 0 then return end
    for enmy in all(enemies) do
        if is_in_range(enmy, twr) then
            add(twr.bullets, {
                -- x=0, y=0,
                -- rotation=0,
                age=0,
                enemy=enmy,
                -- particles={},
            })
            twr.cd = twr.atkspd
            if #twr.bullets > MAX_BULLETS_YELLOW then
                return
            end
        end
    end
end

local function draw_bullets_yellow(twr)
    for blt in all(twr.bullets) do
        local t = g2p(twr)
        local color
        if blt.age >= 20 and blt.age <= 42 then
            if     blt.age <= 23 then color = C.dark_blue
            elseif blt.age <= 24 then color = C.brown
            elseif blt.age <= 27 then color = C.orange
            elseif blt.age <= 30 then color = C.yellow
            elseif blt.age <= 36 then color = C.peach
            elseif blt.age <= 37 then color = C.white
            elseif blt.age <= 39 then color = C.peach
            elseif blt.age <= 40 then color = C.yellow
            elseif blt.age <= 41 then color = C.orange
            else                      color = C.brown end
            line(t.left+6, t.top+6, blt.enemy.x, blt.enemy.y, color)
            -- don't cover up center pixel
            pset(t.left+6, t.top+6, C.black)
            pset(blt.enemy.x, blt.enemy.y, C.black)
        end
    end
end

--------------------------------------------------------------------------------

function update_bullets()
    foreach(towers, function(twr)
        if is_red_twr(twr.type) then
            foreach(twr.bullets, function(blt)
                update_bullet_red(twr, blt)
            end)
        elseif is_green_twr(twr.type) then
            foreach(twr.bullets, function(blt)
                update_bullet_green(twr, blt)
            end)
        elseif is_yellow_twr(twr.type) then
            update_bullets_yellow(twr)
        end
    end)
    foreach(towers, function(twr)
        if is_red_twr(twr.type) then
            fire_bullet_red(twr)
        elseif is_green_twr(twr.type) then
            fire_bullet_green(twr)
        elseif is_yellow_twr(twr.type) then
            fire_bullet_yellow(twr)
        end
    end)
end

function draw_bullets()
    foreach(towers, function(twr)
        if is_red_twr(twr.type) then
            draw_bullets_red(twr)
        elseif is_green_twr(twr.type) then
            draw_bullets_green(twr)
        elseif is_yellow_twr(twr.type) then
            draw_bullets_yellow(twr)
        end
    end)
end
