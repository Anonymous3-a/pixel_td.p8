pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include util.lua
#include menu.lua
#include selection.lua
#include enemy.lua
#include bullet.lua
#include core.lua
__gfx__
00000000000000000000000000000000000000000000000000000000555555505555555055555550bbbbbbb0eeeeeee0fffffff0000000000000000000000000
000000000555550005555500055555000bbbbb000eeeee000fffff005bbbbb105eeeee105fffff10b5555530e5555580f4444490000000000000000000000000
0000000005bbb10005eee10005fff1000b5553000e5558000f4449005b5553105e5558105f444910b5bbb130e5eee280f4fff290000000000000000000000000
0000000005b0310005e0810005f091000b5013000e5028000f4029005b5013105e5028105f402910b5b03130e5e08280f4f09290000000000000000000000000
000000000533310005888100059991000b1113000e2228000f2229005b1113105e2228105f222910b5333130e5888280f4999290000000000000000000000000
00000000011111000111110001111100033333000888880009999900533333105888881059999910b1111130e2222280f2222290000000000000000000000000
00000000000000000000000000000000000000000000000000000000111111101111111011111110333333308888888099999990000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaa00000880880070000000000000000000000000000000000000000000000000000000011111111111000000000000000000000000000000000000
00000000a999a0008228228077000000000000000000000000000000000000000000000000000000010101010101000001101000000000000000000000000000
00000000a999a0008222228077700000000000000000000000000000000000000000000000000000001000100010000001010010000000000000000000000000
00000000a999a0000822280077000000000000000000000000000000000000000000000000000000010101010101000001101000000000000000000000000000
000000000aaa00000082800070000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000
00000000000000000008000000000000000000000000000000000000000000000000000000000000001000100010000001101000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010010000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001101000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001101000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010010000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001101000000000000000000000000000
