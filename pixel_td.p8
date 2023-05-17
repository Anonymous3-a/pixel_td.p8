pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
do
#include util.lua
end

do
#include menu.lua
end

do
#include selection.lua
end

do
#include tower.lua
end

do
#include enemy.lua
end

do
#include bullet.lua
end

do
#include hint.lua
end

do
#include title.lua
end

do
#include core.lua
end
__gfx__
00000000000000000000000000000000000000000000000000000000555555505555555055555550bbbbbbb0eeeeeee0fffffff0000000000000000000000000
000000000555550005555500055555000bbbbb000eeeee000fffff005bbbbb105eeeee105fffff10b5555530e5555580f4444490000000000000000000000000
0000000005bbb10005eee10005fff1000b5553000e5558000f4449005b5553105e5558105f444910b5bbb130e5eee280f4fff290000000000000000000000000
0000000005b0310005e0810005f091000b5013000e5028000f4029005b5013105e5028105f402910b5b03130e5e08280f4f09290000000000000000000000000
000000000533310005888100059991000b1113000e2228000f2229005b1113105e2228105f222910b5333130e5888280f4999290000000000000000000000000
00000000011111000111110001111100033333000888880009999900533333105888881059999910b1111130e2222280f2222290000000000000000000000000
00000000000000000000000000000000000000000000000000000000111111101111111011111110333333308888888099999990000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaa0000088088007000000000d000000000000000000000000000000000000000000000011111111111000000000000000000000000000000000000
00000000a999a00082282280770000000dd000000000000000000000000000000000000000000000010101010101000001101000000000000000000000000000
00000000a999a0008222228077700000ddd000000000000000000000000000000000000000000000001000100010000001010010000000000000000000000000
00000000a999a00008222800770000001dd000000000000000000000000000000000000000000000010101010101000001101000000000000000000000000000
000000000aaa0000008280007000000001d000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000
00000000000000000008000000000000001000000000000000000000000000000000000000000000001000100010000001101000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010010000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001101000000000000000000000000000
ddddddd0ddddddd0ddddddd011111000111110001111100000000000000000000000000000000000000000000000000001000000000000000000000000000000
d00000d0d00000d0d00000d011dd10001d1d100011d1100000000000000000000000000000000000000000000000000001101000000000000000000000000000
d00dd0d0d0d0d0d0d00d00d01d1d100011d110001d1d100000000000000000000000000000000000000000000000000001010010000000000000000000000000
d0d0d0d0d00d00d0d0d0d0d01dd110001d1d100011d1100000000000000000000000000000000000000000000000000001101000000000000000000000000000
d0dd00d0d0d0d0d0d00d00d011111000111110001111100000000000000000000000000000000000000000000000000000000000000000000000000000000000
d00000d0d00000d0d00000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
ddddddd0ddddddd0ddddddd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06666600076666000776660007776600067776000667770006667700066667000666660006666600066666000666660000000000000000000000000000000000
66b6b66076b6b66077b6b66077b6b66067b7b66066b7b76066b7b77066b6b77066b6b77066b6b67066b6b66066b6b66000000000000000000000000000000000
666b6660666b6660766b6660776b6660777b6660677b7660667b7760666b7770666b7770666b6770666b6670666b666000000000000000000000000000000000
66b6b66066b6b66066b6b66076b6b66077b6b66077b7b66067b7b66066b7b76066b7b77066b6b77066b6b77066b6b67000000000000000000000000000000000
d66666d0d66666d0d66666d0d66666d0d66666d0d77666d0d77766d0d77776d0d67777d0d66777d0d66677d0d66667d000000000000000000000000000000000
0ddddd000ddddd000ddddd000ddddd000ddddd000ddddd000ddddd000ddddd000ddddd000ddddd000ddddd000ddddd0000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9999999999900099990009990000000009990000999999999009999000000000bbbbbbbbbbb00bbbbbbbb0000000000000000000000000000000000000000000
9999999999900099990009990000000009990000999999999009999000000000bbbbbbbbbbb00bbbbbbbb0000000000000000000000000000000000000000000
9999444449900099990009990000000009990099994444444009999000000000bbbbbbbbbbb00bbbbbbbb0000000000000000000000000000000000000000000
99990000099000999900044499900099944400999900000000099990000000003333bbb333300bbb33333bbb0000000000000000000000000000000000000000
99990000099000999900000099900099900000999900000000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99990000099000999900000099900099900000999900000000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99990000099000999900000044499944400000999900000000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99999999944000999900000000099900000000999999990000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99999999900000999900000000099900000000999999990000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99994444400000999900000099944499900000999944440000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99990000000000999900000099900099900000999900000000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99990000000000999900000099900099900000999900000000099990000000000000bbb000000bbb00000bbb0000000000000000000000000000000000000000
99990000000000999900099944400044499900999900000000099990000000000000bbb000000bbbbbbbb3330000000000000000000000000000000000000000
99990000000000999900099900000000099900999999999990044999999999000000bbb000000bbbbbbbb0000000000000000000000000000000000000000000
99990000000000999900099900000000099900999999999990000999999999000000bbb000000bbbbbbbb0000000000000000000000000000000000000000000
44440000000000444400044400000000044400444444444440000444444444000000333000000333333330000000000000000000000000000000000000000000
44440000000000444400044400000000044400444444444440000444444444000000333000000333333330000000000000000000000000000000000000000000
