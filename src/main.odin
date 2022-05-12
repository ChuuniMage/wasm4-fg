package main

DEBUGGING :: false

import "w4"
import "core:unicode/utf8"
import "core:runtime"


//TODO optimisation: Parcel these out into top-body bottom-body chunks to swap out, to save memory
idle_stand_0 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0011111110000000,
	0b0111111111000011,
	0b1111111111000111,
	0b1101111111100111,
	0b1101111111111111,
	0b1101111111111110,
	0b1110110000111100,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

idle_stand_1 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0011111110000000,
	0b0111111111000000,
	0b1111111111000011,
	0b1111111111000111,
	0b1101111111100111,
	0b1101111111111111,
	0b1101111111111110,
	0b1110110000111100,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

idle_stand_2 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0011111110000000,
	0b0111111111000011,
	0b1111111111000111,
	0b1101111111100111,
	0b1101111111111111,
	0b1101111111111110,
	0b1110110000111100,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

idle_stand_3 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0011111110000000,
	0b0111111111000011,
	0b1111111111000111,
	0b1101111111111111,
	0b1101111111111110,
	0b1110110000111100,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}


idle_crouch_0 := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000001110000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000001111000000,
	0b0000001110000000,
	0b0001111111000000,
	0b0011111111100011,
	0b0111111111100111,
	0b0110111111110111,
	0b0110111111111111,
	0b0110111111111110,
	0b0111011000011100,
	0b0111100111000000,
	0b0011111111011000,
	0b0001111111011110,
	0b0000000000111111,
	0b0111011110001111,
	0b0111111110011111,
	0b1111111110011110,
	0b1110111110111100,
	0b1111011110111111,
	0b1111001110111111,
}

f_walk_0 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0011111110000000,
	0b0111111111000011,
	0b1111111111000111,
	0b1101111111100111,
	0b1101111111111111,
	0b1101111111111110,
	0b1110110000111100,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0001111111110000,
	0b0000111011111000,
	0b0000111001111100,
	0b0000111000111100,
	0b0000111000011100,
	0b0000111000011100,
	0b0000111000011100,
	0b0000111000111100,
	0b0000111000111000,
	0b0001111001111000,
	0b0001111001111000,
	0b0001111101111110,
	0b0001111101111110,
}

f_walk_1 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0011111110000000,
	0b0111111111000011,
	0b1111111111000111,
	0b1101111111100111,
	0b1101111111111111,
	0b1110110001111110,
	0b1111001110111100,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111100000,
	0b0001111111110000,
	0b0001111111111000,
	0b0001111001111100,
	0b0000111000111110,
	0b0000111000011110,
	0b0000111000001110,
	0b0000111000001110,
	0b0000111000011110,
	0b0000111000011100,
	0b0000111000111100,
	0b0000111000111111,
	0b0001111000111111,
	0b0001111000000000,
	0b0001111100000000,
	0b0001111100000000,
}

f_walk_2 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0011111110000000,
	0b0111111111000011,
	0b1111111111000111,
	0b1101111111100111,
	0b1101111111111111,
	0b1101111111111110,
	0b1110110000111100,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111100000,
	0b0001111111110000,
	0b0001111111111000,
	0b0001111001111100,
	0b0001111000111110,
	0b0001111000011110,
	0b0011110000001110,
	0b0011110000001110,
	0b0011110000001110,
	0b0011110000011110,
	0b0011100000011100,
	0b0111100000111100,
	0b0111100000111100,
	0b0111110000111111,
	0b0111110000111111,
}

b_walk_1 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0011111110000011,
	0b0111111111000111,
	0b1111111111100111,
	0b1101111111111111,
	0b1101111111111110,
	0b1101111110111100,
	0b1110110000000000,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0001111111110000,
	0b0001111011111000,
	0b0001111001111100,
	0b0001110000111100,
	0b0001110000011100,
	0b0001110000011100,
	0b0001110000011100,
	0b0001110000011100,
	0b0011110000011100,
	0b0011110000111100,
	0b0011111000111100,
	0b0011111000111111,
	0b0000000000111111,
}

punch_0 := [32]u16be {
	0b0000001110000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000001111000000,
	0b0000001110000000,
	0b0001111111000000,
	0b0011111111100011,
	0b0111111111100111,
	0b0110111111110111,
	0b0110111111111111,
	0b0110111111111110,
	0b0111011000111100,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111000000,
	0b0000000000100000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}


punch_1 := [32]u16be {
	0b0000001110000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000001111000000,
	0b0000001110000000,
	0b0001111111000000,
	0b0011111111100001,
	0b0111111111110001,
	0b0110111111111111,
	0b0110111111111111,
	0b0110111111111110,
	0b0111011000000000,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111000000,
	0b0000000000100000,
	0b0000111111110000,
	0b0000111111110000,
	0b0001111111111000,
	0b0001111001111100,
	0b0001111000111110,
	0b0011111000011110,
	0b0011110000001110,
	0b0011110000001110,
	0b0011110000001110,
	0b0111100000011110,
	0b0111100000011100,
	0b0111100000111100,
	0b1111000000111100,
	0b1111100000111111,
	0b1111100000111111,
}

punch_1_extra := [2]u8{
	0b11111111,
	0b10000000,	
}

punch_2 := [32]u16be {
	0b0000001110000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000001111000000,
	0b0000001110000000,
	0b0001111111111111,
	0b0011111111111111,
	0b0111111111111111,
	0b0110111111000000,
	0b0110111111000000,
	0b0110111111000000,
	0b0111011000000000,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111000000,
	0b0000000000100000,
	0b0000111111110000,
	0b0000111111110000,
	0b0001111111111000,
	0b0001111001111100,
	0b0001111000111110,
	0b0011111000011110,
	0b0011110000001110,
	0b0011110000001110,
	0b0011110000001110,
	0b0111100000011110,
	0b0111100000011100,
	0b0111100000111100,
	0b1111000000111100,
	0b1111100000111111,
	0b1111100000111111,
}

punch_2_extra := [4]u8 {
	0b00111111,
	0b11111111,
	0b11111111,
	0b11111111,
}

crouch_punch_0 := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000001110000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000001111000000,
	0b0000001110000000,
	0b0000111111000000,
	0b0001111111100011,
	0b0011111111110111,
	0b0011011111111111,
	0b0011011111111110,
	0b0011101000011100,
	0b0011110111000000,
	0b0001111111000000,
	0b0000111111011110,
	0b0000000000111111,
	0b0111011110111111,
	0b0111111110011111,
	0b1111111110011110,
	0b1110111110111100,
	0b1111011110111111,
	0b1111001110111111,
}

crouch_punch_1 := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000011100000,
	0b0000000111110000,
	0b0000000111110000,
	0b0000000111110000,
	0b0000000011110000,
	0b0000000011100000,
	0b0000000111111000,
	0b0000001111111000,
	0b0000011111100000,
	0b0000011101011100,
	0b0000011101011101,
	0b0000011101011101,
	0b0000001110011100,
	0b0000101111111000,
	0b0000110111111000,
	0b0000111011110110,
	0b0000111100001111,
	0b0111011110011111,
	0b0111111110011111,
	0b1111111110011110,
	0b1110111110111100,
	0b1111011110111111,
	0b1111001110111111,
}

crouch_punch_2 := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000011100000,
	0b0000000111110000,
	0b0000000111110000,
	0b0000000111110000,
	0b0000000011110000,
	0b0000000011100000,
	0b0000000111111111,
	0b0000001111111111,
	0b0000011111111111,
	0b0000011111100000,
	0b0000011111100000,
	0b0000011111101100,
	0b0000011111101100,
	0b0000111111110000,
	0b0000111111111000,
	0b0000111111111110,
	0b0000111111111111,
	0b0111011111011111,
	0b0111111110011111,
	0b1111111110011110,
	0b1110111110111100,
	0b1111011110111111,
	0b1111001110111111,
}

elbow_0 := [32]u16be {
	0b0000000000000000,
	0b0000000111000000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000000111100000,
	0b0000000111000000,
	0b0000111111100000,
	0b0001111111110000,
	0b0011111111111100,
	0b0011011111111111,
	0b0011011111111111,
	0b0011011111100111,
	0b0011101100000000,
	0b0011110011100000,
	0b0001111111100000,
	0b0000111111100000,
	0b0000000000000000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

elbow_1 := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000111000000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000000111100000,
	0b0001111111110000,
	0b0011111111111100,
	0b0111111111111110,
	0b0110111111111111,
	0b1101111111100111,
	0b1101111111011111,
	0b1110100001011110,
	0b1111011101011100,
	0b0111111101000000,
	0b0011111101000000,
	0b0100000001000000,
	0b1111111111000000,
	0b1111101111100000,
	0b1111000111100000,
	0b1110000011100000,
	0b1100000011100000,
	0b1000000111100000,
	0b0000000111000000,
	0b0000001111000000,
	0b0000001111110000,
	0b0000001111110000,
}

elbow_1_extra := [6]u8{
	0b00000000,
	0b01000110,
	0b01110111,
	0b11111111,
	0b11011111,
	0b01111111,
}

elbow_2 := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000111000000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000000111100000,
	0b0001111111100000,
	0b0011111111111000,
	0b0111111111111100,
	0b0110111111111110,
	0b1101111111001110,
	0b1101111110111110,
	0b1101000010111100,
	0b1110111010111000,
	0b0111111011000000,
	0b0011111011000000,
	0b0100000011000000,
	0b1111111111000000,
	0b1111101111100000,
	0b1111000111100000,
	0b1110000011100000,
	0b1100000011100000,
	0b1000000111100000,
	0b0000000111000000,
	0b0000001111000000,
	0b0000001111110000,
	0b0000001111110000,
}
elbow_3 := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000111000000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000001111100000,
	0b0000000111100000,
	0b0000000111000000,
	0b0000111111100000,
	0b0001111111110000,
	0b0011111111110000,
	0b0011011111110000,
	0b0011011111111100,
	0b0011011111111111,
	0b0011101100011111,
	0b0011110011100111,
	0b0001111111100000,
	0b0000111111100000,
	0b0000000000000000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

guard_stand := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110011110,
	0b0000011100011110,
	0b0001111110011110,
	0b0011111111001110,
	0b0111111111101110,
	0b0110111111111110,
	0b0110111111111110,
	0b0110111111111100,
	0b0111011000011000,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111000000,
	0b0000000000000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

guardstun_stand := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110111100,
	0b0000011100111100,
	0b0001111110111100,
	0b0011111111011100,
	0b0111111111111100,
	0b0110111111111100,
	0b0110111111111100,
	0b0110111111111000,
	0b0111011000010000,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111000000,
	0b0000000000000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

guard_crouch := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000001110000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000001111001111,
	0b0000001110001111,
	0b0001111111001111,
	0b0011111111100111,
	0b0111111111110111,
	0b0110111111111111,
	0b0110111111111110,
	0b0111011000011100,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111011000,
	0b0000000000111110,
	0b0000111111111111,
	0b0111011110001111,
	0b0111111110011111,
	0b1111111110011110,
	0b1110111110111100,
	0b1111011110111111,
	0b1111001110111111,
}

guardstun_crouch := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000001110000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000011111000000,
	0b0000001111011110,
	0b0000001110011110,
	0b0001111111011110,
	0b0011111111101110,
	0b0111111111111110,
	0b0110111111111110,
	0b0110111111111100,
	0b0111011000011000,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111000000,
	0b0000000000111000,
	0b0000111111111111,
	0b0111011110001111,
	0b0111111110011111,
	0b1111111110011110,
	0b1110111110111100,
	0b1111011110111111,
	0b1111001110111111,
}


hitstun_stand_highreel := [32]u16be {
	0b0001110000000000,
	0b0011111000000000,
	0b0011111000000000,
	0b0011111000000000,
	0b0011110000011000,
	0b0001110000111100,
	0b0111111000111100,
	0b1111111110011100,
	0b1111111111111100,
	0b1101111111111000,
	0b1101111111110000,
	0b1110111110000000,
	0b1111000000000000,
	0b0111111100000000,
	0b0011111101000000,
	0b0000011101000000,
	0b0001100001100000,
	0b0001111111100000,
	0b0001111111110000,
	0b0001111011111000,
	0b0001111001111100,
	0b0001111000111100,
	0b0001110000011100,
	0b0011110000011100,
	0b0011110000011100,
	0b0011110000011100,
	0b0011100000011100,
	0b0011100000011100,
	0b0111100000111100,
	0b0111100000111110,
	0b0111110000111111,
	0b0111110000011111,
}

hitstun_stand_low := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000001111000,
	0b0000000011111100,
	0b0000000111111100,
	0b0001111111111100,
	0b0011111110111000,
	0b0111111111000000,
	0b0111011111100000,
	0b1110111111100000,
	0b1110111111100000,
	0b1110111111111000,
	0b1110111111111100,
	0b1111000010111100,
	0b0111111010011100,
	0b0011111010000000,
	0b0000111010000000,
	0b0011000011000000,
	0b0011111111100000,
	0b0011110111110000,
	0b0011110011111000,
	0b0011110001111000,
	0b0011100001111000,
	0b0111100001111000,
	0b0111000011110000,
	0b0111000011100000,
	0b1111000111100000,
	0b1111000111110000,
	0b1111100111111000,
	0b1111100011111000,
}

hitstun_crouch := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0001110000000000,
	0b0011111000000000,
	0b0011111000000000,
	0b0011111000000000,
	0b0011110000011000,
	0b0001110000111100,
	0b0111111000111100,
	0b1111111110011100,
	0b1111111111111100,
	0b1111111111111000,
	0b1101111111110000,
	0b1101111100000000,
	0b1110110000000000,
	0b0111001110000000,
	0b0011111110000000,
	0b0001111110110000,
	0b0000000001111110,
	0b0111011110001111,
	0b0111111110011111,
	0b1111111110011110,
	0b1110111110111100,
	0b1111011110111111,
	0b1111001110111111,
}

stance_transition := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0011111110000000,
	0b0111111111000011,
	0b1111111111000111,
	0b1101111111100111,
	0b1101111111111111,
	0b1101111111111110,
	0b1110110000111100,
	0b1111001110000000,
	0b0111111110000000,
	0b0011111110000000,
	0b0000000001000000,
	0b0011111111100000,
	0b0011110111110000,
	0b0011110011111000,
	0b0011110001111000,
	0b0011100001111000,
	0b0111100001111000,
	0b0111000011110000,
	0b0111000011100000,
	0b1111000111100000,
	0b1111000111110000,
	0b1111100111111000,
	0b1111100011111000,
}

stance_transition_guard := [32]u16be {
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110011110,
	0b0000011100011110,
	0b0001111110011110,
	0b0011111111001110,
	0b0111111111101110,
	0b0110111111111110,
	0b0110111111111110,
	0b0110111111111100,
	0b0111011000011000,
	0b0111100111000000,
	0b0011111111000000,
	0b0001111111000000,
	0b0000000000000000,
	0b0011111111100000,
	0b0011110111110000,
	0b0011110011111000,
	0b0011110001111000,
	0b0011100001111000,
	0b0111100001111000,
	0b0111000011110000,
	0b0111000011100000,
	0b1111000111100000,
	0b1111000111110000,
	0b1111100111111000,
	0b1111100011111000,
}

throw_startup_0 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0001111111111000,
	0b0011111011110111,
	0b0011111100000111,
	0b0001111111111111,
	0b0001110111111110,
	0b0001111001111000,
	0b0001111110000000,
	0b0001111111000000,
	0b0001111111000000,
	0b0001111111000000,
	0b0001111111000000,
	0b0001111111100000,
	0b0001111111100000,
	0b0011111111110000,
	0b0011110011111000,
	0b0011110001111100,
	0b0011110000111100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000011100,
	0b0111100000111100,
	0b0111000000111000,
	0b1111000001111000,
	0b1111000001111000,
	0b1111100001111110,
	0b1111100001111110,
}

throw_hit := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000111110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0001111111111111,
	0b0011111111111000,
	0b0011111011110111,
	0b0011111100000111,
	0b0001111111111111,
	0b0001110111111110,
	0b0001111001111000,
	0b0001111110000000,
	0b0001111111111111,
	0b0001111111111111,
	0b0001111111111111,
	0b0000111111101111,
	0b0000000000001111,
	0b0000000011011110,
	0b0000000010111100,
	0b0000000001111000,
	0b0000000011110000,
	0b0000000011110000,
	0b0000000011111000,
	0b0000001101111000,
	0b0000001110000000,
	0b0000011110000000,
	0b0000011100000000,
	0b0000111100000000,
	0b0000111111000000,
	0b0000111111000000,
}

//sprites by convention are 32*16 atm
walk_f_anim_array: [4][]u16be
walk_b_anim_array : [4][]u16be 
idle_anim_array: [4][]u16be 
punch_5p_anim_array: [4][]u16be 
punch_2p_anim_array: [4][]u16be 
punch_6p_anim_array: [5][]u16be
crouch_anim : [1][]u16be
guard_high_anim : [1][]u16be
guard_low_anim : [1][]u16be
hitstunAnimArrays: [HitstunType][][]u16be
blockstunAnimArrays: [BlockstunType][][]u16be
highreel_anim_array: [1][]u16be
midgut_anim_array: [1][]u16be
crouch_hitstun_anim_array: [1][]u16be
throw_default_array : [3][]u16be
throw_hit_array : [4][]u16be
throw_break_array : [2][]u16be

animFrameArrays: [Movelist][][]u16be
extraAnimArrays: #sparse [Movelist] proc (using player:^PlayerData, idx:u8, player_blit:w4.Blit_Flags)

StateColoursArray:[PlayerState]u32

anim_idle_lengths := [4]u8{30,30,30,5}
anim_walk_f_lengths := [4]u8{7,7,7,7}
anim_walk_b_lengths := [4]u8{8,8,8,8}
anim_5P_lengths := [4]u8{5,6,7,9}
anim_2P_lengths := [4]u8{5,6,6,16}
anim_6P_lengths := [5]u8{6,7,13,6,4}
idle_2_lengths := [1]u8{2} 
guard_high_lengths:=[1]u8{2}
guard_low_lengths:=[1]u8{2}
throw_default_lengths:= [3]u8{4,10,19}

animDurationArrays: [Movelist][]u8


standing_blockstun_anim_array: [1][]u16be
crouching_blockstun_anim_array: [1][]u16be

DefaultPalette:[4]u32

anim_5P_extra :: proc (using player:^PlayerData, idx:u8, player_blit:w4.Blit_Flags) {
	switch (idx){
		case 1, 3: 
			w4.blit(cast(^u8)&punch_1_extra[0], 
				i32(point.x + (p_num == .One ? 16 : -2)), 
				i32(6 + point.y), 
				2, 
				5, player_blit)

		case 2:
			w4.blit(cast(^u8)&punch_2_extra[0], 
				i32(point.x + (p_num == .One ? 16 : -5)), 
				i32(5 + point.y), 
				5, 
				4, player_blit)
	}
}

anim_2P_extra :: proc (using player:^PlayerData, idx:u8, player_blit:w4.Blit_Flags) {
	switch (idx){
		case 2:
			w4.blit(cast(^u8)&punch_2_extra[0], 
				i32(point.x + (p_num == .Two ? -5 : 16)), 
				i32(15 + point.y), 
				5, 
				4, player_blit + {.FLIPY})
	}
}

anim_6P_extra :: proc (using player:^PlayerData, idx:u8, player_blit:w4.Blit_Flags) {
	switch (idx){
		case 2, 3:
			w4.blit(cast(^u8)&elbow_1_extra[0], i32(point.x - (player.p_num == .One ? 5 : -16)), i32(point.y + 23), 5, 9, player_blit)
	}
}

anim_throw_extra :: proc (using player:^PlayerData, idx:u8, player_blit:w4.Blit_Flags) {
	w4.DRAW_COLORS^ = p_num == PlayerNumber.One ? 0x33 : 0x44
	switch (idx){
		case 1:
			w4.rect(point.x + (p_num == .One ? 17 : -4), 6 + point.y, 3, 3)
	}
}

do_animation :: proc (using player:^PlayerData, 
	anim_array:[][]u16be, 
	anim_durations:[]u8, 
	player_blit:w4.Blit_Flags,
	extra_anim:proc (using player:^PlayerData, idx:u8, player_blit:w4.Blit_Flags) = nil,
 )	{

	w4.DRAW_COLORS^ = p_num == PlayerNumber.One ? 0x30 : 0x40
	using player.current_anim

	counter += 1;
	anim_threshold := anim_durations[idx]

	if (counter >= anim_threshold){
		counter = 0
		idx = idx == u8(len(anim_durations) - 1) ? 0 : idx + 1
	}

	w4.blit(cast(^u8)&anim_array[idx][0], point.x, point.y, 16, 32, player_blit)

	if(extra_anim != nil){
		extra_anim(player, idx, player_blit)
	}
}

FG_Notation :: enum {_1,_2,_3,_4,_5,_6,_7,_8,_9,_P,_G,_NULL}

FG_Input :: [3]FG_Notation

fg_input_1:[3]FG_Notation 
fg_input_2:[3]FG_Notation 

buttons_to_fg_notation_set :: proc(btns:w4.Buttons, fg_input:^FG_Input, p_num:PlayerNumber) {
	input_matrix := [3][3]FG_Notation{
		{._7, ._8, ._9}, 
		{._4, ._5, ._6},
		{._1, ._2, ._3}}

	selection := [2]u8{1,1};
	if .UP in btns {selection[0] -= 1}
	if .DOWN in btns {selection[0] += 1}
	if(p_num == .One){
		if .LEFT in btns {selection[1] -= 1}
		if .RIGHT in btns {selection[1] += 1}
	} else {
		if .LEFT in btns {selection[1] += 1}
		if .RIGHT in btns {selection[1] -= 1}
	}

	fg_input[0] = input_matrix[selection[0]][selection[1]]
	if .B in btns {fg_input[1] = ._P} else {fg_input[1] = ._NULL}
	if .A in btns {fg_input[2] = ._G} else {fg_input[2] = ._NULL}
};



debug_fg_note_display :: proc (fg_input:^[3]FG_Notation, player:^PlayerData) {
	DEBUG_fg_note_to_rune_array :[FG_Notation]rune = {
		._1= '1',
		._2= '2',
		._3= '3',
		._4= '4',
		._5= '5',
		._6= '6',
		._7= '7',
		._8= '8',
		._9= '9',
		._P= 'P',
		._G= 'G',
		._NULL= ' ',
	}

	w4.DRAW_COLORS^ = 2
	offset:i32 = player.p_num == PlayerNumber.One ? 0 : 80

	
	for input, idx in fg_input {
		bs, w := utf8.encode_rune(DEBUG_fg_note_to_rune_array[fg_input[idx]])
		str := string(bs[:w])
		w4.text(str, 10 + offset + (i32(idx) * 8) , 20)
	}
}

HitstunType :: enum u8 {
	_Standing_HighReel,
	_Standing_MidGut,
	_Crouching,
}

BlockstunType :: enum {
	_Standing,
	_Crouching,
}

AttackLevel :: enum  u8 {
	High,
	Mid,
	S_Low,
	HighThrow,
}

ThrowStatus :: enum {
	_Success,
	_Breaking,
}

Movelist :: enum {
	_5Throw,
	_5P,
	_2P,
	_6P,
	_IDLE_5,
	_IDLE_2,
	_MOVE_FORWARD,
	_MOVE_BACKWARD,
	_5G,
	_2G,
}

fg_notation_to_move :: proc (fg_input: ^[3]FG_Notation) ->  Movelist {
	using FG_Notation
	using Movelist
	move:Movelist

	#partial switch(fg_input[0]){
		case ._1, ._2, ._3: 
			switch{
				case fg_input[1] == ._P: move = ._2P
				case fg_input[2] == ._G: move = ._2G
				case: move = ._IDLE_2
			}
		case ._5: 
			switch{
				case fg_input[1] == ._P: move = fg_input[2] == ._G ? ._5Throw : ._5P
				case fg_input[2] == ._G: move = fg_input[1] == ._P ? ._5Throw : ._5G
				case: move = ._IDLE_5
			}
		case  ._4: 
			switch{
				case fg_input[1] == ._P: move = fg_input[2] == ._G ? ._5Throw : ._5P
				case fg_input[2] == ._G: move = fg_input[1] == ._P ? ._5Throw : ._5G
				case: move = ._MOVE_BACKWARD
			}
		case ._6: 
			switch{
				case fg_input[1] == ._P: move = fg_input[2] == ._G ? ._5Throw : ._6P
				case fg_input[2] == ._G: move = fg_input[1] == ._P ? ._5Throw : ._5G
				case: move = ._MOVE_FORWARD
			}

		case: move = _IDLE_5
	}

	return move
}

AttackDetails :: struct {
	level:AttackLevel,
	startup:u8,
	active:u8,
	recovery:u8,
	hitstun:u8,
	blockstun:u8,
	ch_bonus_hitstun:u8,
	damage:i8,
	ch_bonus_damage:i8,
	stand_hitstun_type: HitstunType,
	crouch_hitstun_type: HitstunType,
	stand_blockstun_type: BlockstunType,
	crouch_blockstun_type: BlockstunType,
}

attack_array: [Movelist]AttackDetails

PlayerNumber :: enum {One, Two,}

PlayerStance :: enum {
	Standing,
	Stand_to_Crouch_Transition,
	Crouch_to_Stand_Transition,
	Crouching,
}

PlayerState :: enum {
	_Idle,
	_Blocking,
	_Blockstun,
	_Startup,
	_Active,
	_Recovery,
	_Moving,
	_Hitstun,
	_ThrowStartup,
	_ThrowActive,
	_Dead,
	_RingOut,
}

Point :: struct {
	x:i32,
	y:i32,
}
PlayerAnimData :: struct {
	counter:u8,
	idx:u8,
	anim_duration:u8,
}

SufferingAttack :: union {
	Movelist,
}

MaybeThrowStatus :: union {
	ThrowStatus,
}

PlayerData :: struct {
	p_num:PlayerNumber,
	point:Point,
	stance:PlayerStance,
	state:PlayerState,
	current_anim:PlayerAnimData,
	previous_move:Movelist,
	current_move:Movelist,
	buffered_move:Movelist,
	current_colour:u32,
	suffering_attack:SufferingAttack,
	suffering_attack_duration:[1]u8,
	suffering_slice:[]u8,
	maybe_throw_status:MaybeThrowStatus,
}

p1_data:PlayerData
p2_data:PlayerData
import "core:mem"

KB :: 1024


throw_hit_duration_array : [4]u8

throw_break_duration : [2]u8

init_pdata :: proc (pdata:^PlayerData, p_num:PlayerNumber){
	pdata^ = {
		p_num = p_num,
		point = {x = p_num == .One ? 61 : 86, y = 69},
		current_anim = { 0, 0, 1},
		previous_move = ._IDLE_5,
		buffered_move = ._IDLE_5,
		stance = .Standing,
		state = ._Idle,
		current_colour = DefaultPalette[3],
		suffering_attack = nil,
		suffering_attack_duration = {0},
		maybe_throw_status = nil,
	}
	pdata.suffering_slice = pdata.suffering_attack_duration[:]
}
global_buffer: [1*KB]byte
global_arena: mem.Arena

transition_array : [1][]u16be

transition_duration : [1]u8

transition_guard_array : [1][]u16be

transition_guard_duration : [1]u8

dead_anim_array : [2][]u16be

dead_anim_durations : [2]u8


ring_out_anim_array : [4][]u16be

ring_out_anim_durations : [4]u8

@export
start :: proc "c" () {
	context = runtime.default_context()
	mem.init_arena(&global_arena, global_buffer[:])
	context.allocator = mem.arena_allocator(&global_arena)
	
	ring_out_anim_array = [4][]u16be{b_walk_1[:], f_walk_1[:], idle_stand_0[:], hitstun_stand_low[:]}

	ring_out_anim_durations = [4]u8{10,17,38, 110}

	dead_anim_array = [2][]u16be{hitstun_stand_highreel[:],hitstun_stand_highreel[:],}

	dead_anim_durations = [2]u8{35, 120}

	transition_array = [1][]u16be{stance_transition[:]}

	transition_duration = [1]u8{5}

	transition_guard_array = [1][]u16be{stance_transition_guard[:]}

	transition_guard_duration = [1]u8{5}

	fg_input_1 = {._5,._NULL,._NULL}
	fg_input_2 = {._5,._NULL,._NULL}

	highreel_anim_array = {hitstun_stand_highreel[:]}
	midgut_anim_array = {hitstun_stand_low[:]}
	crouch_hitstun_anim_array = {hitstun_crouch[:]}

	hitstunAnimArrays = {
		._Standing_HighReel = highreel_anim_array[:],
		._Standing_MidGut = midgut_anim_array[:],
		._Crouching = crouch_hitstun_anim_array[:],
	}

	standing_blockstun_anim_array = {guardstun_stand[:]}
	crouching_blockstun_anim_array = {guardstun_crouch[:]}

	blockstunAnimArrays = {
		._Standing = standing_blockstun_anim_array[:],
		._Crouching = crouching_blockstun_anim_array[:],
	}


	DefaultPalette = {0xe0f8cf, 0x86c06c, 0x306850, 0x071821}
	StateColoursArray = {
		._Idle = 0x306850,
		._Startup = 0xde8d31,
		._Active = 0xd62f2f,
		._Recovery = 0x393ed4,
		._Blocking = 0x20bed6,
		._Moving = 0x32a848,
		._Blockstun = 0x0b6eb5,
		._Hitstun = 0xff1100,
		._ThrowActive = 0xd62f2f,
		._ThrowStartup = 0x78c200,
		._Dead = 0x000000,
		._RingOut = 0x000000,
	}

	atk_details_5Throw:AttackDetails = {
		level = .HighThrow,
		startup = 9,
		active = 1,
		recovery = 24,
		hitstun = 26,
		blockstun = 0,
		ch_bonus_hitstun = 0,
		damage = 2,
		ch_bonus_damage = 0,
		stand_hitstun_type = ._Standing_MidGut,
		crouch_hitstun_type = ._Crouching,
		stand_blockstun_type = ._Standing,
		crouch_blockstun_type = ._Crouching,
	}

	atk_details_5P:AttackDetails = {
		level = .High,
		startup = 11,
		active = 2,
		recovery = 14,
		hitstun = 22,
		blockstun = 19,
		ch_bonus_hitstun = 3,
		damage = 1,
		ch_bonus_damage = 1,
		stand_hitstun_type = ._Standing_HighReel,
		crouch_hitstun_type = ._Crouching,
		stand_blockstun_type = ._Standing,
		crouch_blockstun_type = ._Crouching,
	}
	
	atk_details_2P:AttackDetails = {
		level = .S_Low,
		startup = 11,
		active = 1,
		recovery = 21,
		hitstun = 25,
		blockstun = 16,
		ch_bonus_hitstun = 3,
		damage = 1,
		ch_bonus_damage = 1,
		stand_hitstun_type = ._Standing_MidGut,
		crouch_hitstun_type = ._Crouching,
		stand_blockstun_type = ._Standing,
		crouch_blockstun_type = ._Crouching,
	}
	
	atk_details_6P:AttackDetails = {
		level = .Mid,
		startup = 13,
		active = 2,
		recovery = 21,
		hitstun = 23,
		blockstun = 16,
		ch_bonus_hitstun = 7,
		damage = 2,
		ch_bonus_damage = 1,
		stand_hitstun_type = ._Standing_MidGut,
		crouch_hitstun_type = ._Standing_MidGut, // force stand
		stand_blockstun_type = ._Standing,
		crouch_blockstun_type = ._Crouching,
	}

	attack_array = #partial [Movelist]AttackDetails{
		._5P = atk_details_5P, 
		._2P = atk_details_2P, 
		._6P = atk_details_6P,
		._5Throw = atk_details_5Throw,
	}
	
	extraAnimArrays = #partial [Movelist] proc (using player:^PlayerData, idx:u8, player_blit:w4.Blit_Flags) {
		._5P = anim_5P_extra,
		._2P = anim_2P_extra,
		._6P = anim_6P_extra,
		._5Throw = anim_throw_extra,
	}

	throw_break_array = {hitstun_stand_highreel[:], hitstun_stand_highreel[:]}

	throw_break_duration = [2]u8{24,24}

	idle_anim_array = {idle_stand_0[:], idle_stand_1[:], idle_stand_2[:], idle_stand_3[:]}
	walk_f_anim_array = {f_walk_0[:], f_walk_1[:], f_walk_2[:], idle_stand_0[:]}
	walk_b_anim_array = {f_walk_0[:], b_walk_1[:], f_walk_2[:], idle_stand_0[:]}
	punch_5p_anim_array = {punch_0[:], punch_1[:], punch_2[:], punch_1[:]}
	punch_2p_anim_array = {crouch_punch_0[:], crouch_punch_1[:], crouch_punch_2[:], crouch_punch_1[:]}
	punch_6p_anim_array = {punch_0[:], elbow_0[:], elbow_1[:], elbow_2[:], elbow_3[:]}
	crouch_anim = {idle_crouch_0[:]}
 	guard_high_anim = {guard_stand[:]}
	guard_low_anim = {guard_crouch[:]}

	throw_default_array = {elbow_0[:],throw_startup_0[:], elbow_3[:]}

	throw_hit_array = {elbow_0[:],crouch_punch_2[:], throw_hit[:], elbow_3[:]}

	throw_hit_duration_array = [4]u8{4,5,18,7}


	animFrameArrays = [Movelist][][]u16be{
		._5P = punch_5p_anim_array[:], 
		._2P = punch_2p_anim_array[:], 
		._6P = punch_6p_anim_array[:],
		._IDLE_5 = idle_anim_array[:], 
		._IDLE_2 = crouch_anim[:],
		._MOVE_BACKWARD = walk_b_anim_array[:],
		._MOVE_FORWARD = walk_f_anim_array[:],
		._5G = guard_high_anim[:],
		._2G = guard_low_anim[:],
		._5Throw = throw_default_array[:],
	}
	animDurationArrays = [Movelist][]u8{
		._5P = anim_5P_lengths[:], 
		._2P = anim_2P_lengths[:], 
		._6P = anim_6P_lengths[:],
		._IDLE_5 = anim_idle_lengths[:], 
		._IDLE_2 = idle_2_lengths[:],
		._MOVE_BACKWARD = anim_walk_b_lengths[:],
		._MOVE_FORWARD = anim_walk_f_lengths[:],
		._5G = guard_high_lengths[:],
		._2G = guard_low_lengths[:],
		._5Throw = throw_default_lengths[:],
	}

	init_pdata(&p1_data, .One)
	init_pdata(&p2_data, .Two)

}

Range :: struct {
	start:u8,
	end:u8,
}

//Ranges are from first frame relevant to last frame relevant, ie, 1-10 = 1 up-to-ten inclusive
AttackDetailRanges :: struct {
	startup:Range,
	active:Range,
	recovery:Range,
}


attack_ranges :: proc (atk:^AttackDetails) -> AttackDetailRanges{
	new_ranges := AttackDetailRanges{
		startup = {1,atk.startup},
		active = {atk.startup + 1, atk.startup + atk.active},
		recovery = {atk.startup + atk.active + 1, atk.startup + atk.active + atk.recovery},
	}
	return new_ranges
}

advance_animation :: proc (players:[PlayerNumber]^PlayerData) {
	for player in players {
		using player
		w4.DRAW_COLORS^ = player.p_num == PlayerNumber.One ? 3 : 4 // Set the player colour to be drawn


		#partial switch(state){
			case ._Startup, ._Active, ._Recovery, ._ThrowStartup, ._ThrowActive:
				if(player.maybe_throw_status == ._Breaking){
					break
				}
				atk:AttackDetails = attack_array[current_move]
				using atk;
				full_attack_length := startup + active + recovery
				active_period := startup + active
				current_attack_frame := full_attack_length - current_anim.anim_duration 
		
				switch {
					case current_attack_frame <= startup:
						player.state = level == .HighThrow ? ._ThrowStartup : ._Startup 
					case current_attack_frame <= active_period:
						player.state = level == .HighThrow ? ._ThrowActive : ._Active 
					case:
						player.state = ._Recovery
				}
		}
		if (current_anim.anim_duration  == 0){
			if(suffering_attack != nil){
				suffering_attack = nil
				suffering_attack_duration = 0
			}
			player.state = ._Idle
			player.maybe_throw_status = nil
			update_idle_player_with_move(player)

		} 
		current_anim.anim_duration  -=  1;
		w4.PALETTE[player_palette_index(p_num)] = StateColoursArray[player.state]

		if(suffering_attack == nil){
			animArray := animFrameArrays[current_move]
			durationArray := animDurationArrays[current_move]
			transitioning := stance == .Crouch_to_Stand_Transition || stance == .Stand_to_Crouch_Transition
			extraAnimArrays := extraAnimArrays[current_move]
			switch {
				case player.maybe_throw_status == ._Success: 
					animArray = throw_hit_array[:]
					durationArray = throw_hit_duration_array[:]
				case player.state == ._Blocking && transitioning:
					animArray = transition_guard_array[:]
					durationArray = transition_guard_duration[:]
					case transitioning:
						animArray = transition_array[:]
						durationArray = transition_duration[:]
				case maybe_throw_status == ._Breaking:
					animArray = throw_break_array[:]
					durationArray = throw_break_duration[:]
					extraAnimArrays = nil
				case player.state == ._Dead: 
					animArray = dead_anim_array[:]
					durationArray = dead_anim_durations[:]
				case player.state == ._RingOut:
					animArray = ring_out_anim_array[:]
					durationArray = ring_out_anim_durations[:]
			}

			player_blit:w4.Blit_Flags = p_num == .Two ? {.FLIPX} : nil
			switch(p_num){
				case .One:
					player_blit = player.state == ._Dead && player.current_anim.idx == 1 ? {.ROTATE_CCW_90} : nil
				case .Two:
					player_blit = player.state == ._Dead && player.current_anim.idx == 1  ? {.ROTATE_CCW_90, .FLIPY} : {.FLIPX}
			} 
			do_animation(player, animArray, durationArray, player_blit, extraAnimArrays)
		} else {
			atk := attack_array[suffering_attack.(Movelist)]

			hitstun_type := stance == .Standing ? atk.stand_hitstun_type : atk.crouch_hitstun_type
			blockstun_type := stance == .Standing ? atk.stand_blockstun_type : atk.crouch_blockstun_type
			stunAnimArray := state == ._Blockstun ? blockstunAnimArrays[blockstun_type] : hitstunAnimArrays[hitstun_type]
			do_animation(player, stunAnimArray, suffering_slice,  p_num == .Two ? {.FLIPX} : nil,)
		}
	}
}

update_players_with_hit_resolution :: proc (
	players:[PlayerNumber]^PlayerData, 
	attack_hit: [PlayerNumber]bool, 
	attack_blocked: [PlayerNumber]bool, 
	health:^[PlayerNumber]i8,
	rounds_won:^[PlayerNumber]u8,
	player_dead:^bool,
	victory_type:^VictoryType, time:f64){

	get_blockstun_type := proc (atk:AttackDetails, target_player:^PlayerData) -> BlockstunType {
		using target_player
		return stance == .Crouching || stance == .Crouch_to_Stand_Transition ? atk.crouch_blockstun_type : atk.stand_blockstun_type
	}

	apply_blockstun_type := proc (blockstun_type:BlockstunType, target_player:^PlayerData) {
		target_player.stance = blockstun_type == ._Crouching ? .Crouching : .Standing
		target_player.state = ._Blockstun
	}

	for player in players {
		using player
		if(attack_blocked[p_num] == false){continue}
		opposing_pnum:PlayerNumber = p_num == .One ? .Two : .One

		atk := attack_array[current_move]
		players[opposing_pnum].current_anim.anim_duration = atk.blockstun
		players[opposing_pnum].current_anim.counter = 0
		players[opposing_pnum].current_anim.idx = 0
		bstun_type := get_blockstun_type(atk, players[opposing_pnum])
		apply_blockstun_type(bstun_type, players[opposing_pnum])
		players[opposing_pnum].suffering_attack = player.current_move
		players[opposing_pnum].suffering_attack_duration[0] =  u8(atk.blockstun)
	}

	get_hitstun_type := proc (atk:AttackDetails, target_player:^PlayerData) -> HitstunType {
		using target_player
		return stance == .Crouching || stance == .Crouch_to_Stand_Transition ? atk.crouch_hitstun_type : atk.stand_hitstun_type
	}

	apply_hitstun_type := proc (hitstun_type:HitstunType, target_player:^PlayerData) {
		target_player.stance = hitstun_type == ._Crouching ? .Crouching : .Standing
		target_player.state = ._Hitstun
	}

	// is_counterhit := proc (target_player:^PlayerData) -> bool {
	// 	#partial switch(target_player.state){
	// 		case ._Startup, ._Active : return true
	// 		case: return false
	// 	}
	// }

	for player in players {
		using player
		if(attack_hit[p_num] == false){continue}
		opposing_pnum:PlayerNumber= p_num == .One ? .Two : .One
		atk := attack_array[current_move]

		
		if(attack_hit[p_num] && attack_hit[opposing_pnum]){
			opponent_attack_dmg := attack_array[players[opposing_pnum].current_move].damage
			if(opponent_attack_dmg > atk.damage){
				continue
			}
		}
		total_damage:= atk.damage
		total_hitstun:= atk.hitstun 
		if (players[opposing_pnum].state == ._Startup || players[opposing_pnum].state == ._Active){
			total_damage += atk.ch_bonus_damage
			total_hitstun += atk.ch_bonus_hitstun
		}
		if(time <= 0){total_damage = 0}
		opposing_player_killed := health[opposing_pnum] - total_damage <= 0
		health[opposing_pnum] = opposing_player_killed ? 0 : health[opposing_pnum] - total_damage

		players[opposing_pnum].current_anim.counter = 0
		players[opposing_pnum].current_anim.idx = 0
		players[opposing_pnum].point.y = 69
		if opposing_player_killed {
			players[opposing_pnum].state = ._Dead
			players[opposing_pnum].current_anim.anim_duration = 35 + 120
			if(victory_type^ == ._None){rounds_won[p_num] += 1}

			player_dead^ = true
			victory_type^ = ._Knockout
			players[opposing_pnum].current_move = ._IDLE_5

			continue
		}

		players[opposing_pnum].current_anim.anim_duration = total_hitstun
		hitstun_type := get_hitstun_type(atk, players[opposing_pnum])
		apply_hitstun_type(hitstun_type, players[opposing_pnum])
		players[opposing_pnum].suffering_attack = player.current_move
		players[opposing_pnum].suffering_attack_duration[0] = u8(total_hitstun)
		

	}

}

player_palette_index :: proc (p_num:PlayerNumber) -> int {return p_num == PlayerNumber.One ? 2 : 3}
player_draw_colour :: proc (p_num:PlayerNumber) -> u16 {return p_num == PlayerNumber.One ? 3 : 4}

update_idle_player_with_move :: proc (using player:^PlayerData){
	previous_move = current_move
	current_move = buffered_move
	@static transition_counters:= [PlayerNumber]u8{.One = 0, .Two = 0}
	transition_threshold :u8 = 5

	#partial switch(buffered_move){
		case ._MOVE_BACKWARD, ._MOVE_FORWARD: state = ._Moving
		case ._IDLE_2, ._IDLE_5: state = ._Idle
		case ._5G, ._2G: state = ._Blocking
		case ._5P, ._2P, ._6P: state = ._Startup
		case ._5Throw: state = ._ThrowStartup
	}

	switch(buffered_move){
		case ._MOVE_BACKWARD, ._MOVE_FORWARD, ._IDLE_5, ._5G: 
			if(stance == .Crouching || stance == .Crouch_to_Stand_Transition){
				stance =.Crouch_to_Stand_Transition 
				transition_counters[p_num] +=1
				current_anim.anim_duration = 1
				if (transition_counters[p_num] == transition_threshold){
					stance = .Standing
					current_anim.anim_duration = buffered_move == ._5G ? 2 : 3
					transition_counters[p_num] = 0
				}
			} else {
				stance = .Standing
				current_anim.anim_duration = 2
			}
		case ._IDLE_2, ._2G: 
			if(stance == .Standing || stance == .Stand_to_Crouch_Transition){
				stance =.Stand_to_Crouch_Transition 
				transition_counters[p_num] +=1
				current_anim.anim_duration =  buffered_move == ._2G ? 1 : 5
				if (transition_counters[p_num] == transition_threshold){
					stance = .Crouching
					current_anim.anim_duration = 2
					transition_counters[p_num] = 0
				}
			} else {
				stance = .Crouching
				current_anim.anim_duration = 2
			}
		case ._5P, ._6P, ._5Throw: 
			stance = .Standing
			current_anim.anim_duration  = attack_array[buffered_move].active + attack_array[buffered_move].startup + attack_array[buffered_move].recovery
		case ._2P: 
			stance = .Crouching
			current_anim.anim_duration  = attack_array[buffered_move].active + attack_array[buffered_move].startup + attack_array[buffered_move].recovery
	}

	#partial switch(buffered_move){
		case ._MOVE_BACKWARD, ._MOVE_FORWARD, ._IDLE_5, ._5G, ._2G, ._2P:
			if (previous_move == buffered_move){
				w4.PALETTE[player_palette_index(p_num)] = StateColoursArray[state]
				return
			}
	}

	w4.PALETTE[player_palette_index(p_num)] = StateColoursArray[state]
	player.current_anim.counter = 0
	player.current_anim.idx = 0
}

resolve_push :: proc (players: ^[PlayerNumber]^PlayerData, accel_data:^AccelerationData) {
	using accel_data
	p1_advancing := accel[.One] > 0
	p2_advancing := accel[.Two] > 0
	// w4.print("p1 adv,")
	if(!p1_advancing && !p2_advancing){return}
	if(accel[.One] == accel[.Two]){
		accel[.One] = 0
		accel[.Two] = 0
		return
	}

	@static counter := 0;
	push_threshold := 3
	p1vel := accel[.One] - accel[.Two] 
	p2vel := accel[.Two] - accel[.One] 

	advancing_player := p1_advancing ? players[.One] : players[.Two]
	retreating_player := p2_advancing ? players[.One] : players[.Two]
	
	advancing_player_vel := p1_advancing ? p1vel : p2vel
	retreating_player_vel := p2_advancing ? p1vel : p2vel
	if (last_frame_pushbox_overlapping == false){
		counter = 0;
	}
	delta := advancing_player_vel - retreating_player_vel
	accel[advancing_player.p_num] = 0
	accel[retreating_player.p_num] = 0
	
	for delta > 0 {
		delta -= 1
		counter += 1
		if(counter == push_threshold){
			accel[advancing_player.p_num] += 1
			accel[retreating_player.p_num] -= 1
			counter = 0
		}
	}

}

R_SCREEN_LIMIT :: 160 - 16
L_SCREEN_LIMIT :: 0


forward_offset :: proc(using player:^PlayerData, diff:i8) -> i32 {
	diffed := p_num == .One ? point.x + i32(diff) : point.x - i32(diff)
	if(diffed < L_SCREEN_LIMIT || diffed > R_SCREEN_LIMIT ){return point.x}
	return diffed
}

backward_offset :: proc(using player:^PlayerData, diff:i8) -> i32 {
	diffed := p_num == .One ? point.x - i32(diff) : point.x + i32(diff)
	if(diffed > R_SCREEN_LIMIT || diffed < L_SCREEN_LIMIT){return point.x}
	return diffed
}

AccelerationData :: struct {
	accel:[PlayerNumber]i8,
	last_frame_pushbox_overlapping:bool,
	current_frame_pushbox_overlapping:bool,
}

HitboxSlot :: enum {
	_MainHurtbox,
	_MainHitbox,
	_ExtraHurtbox,
}

//MainHurtbox, Hitbox, ExtraHurtbox

MaybeHitbox :: union { Hitbox, }

HitboxData :: struct {
	hitboxes:[PlayerNumber][3]MaybeHitbox,
}

resolve_accel :: proc (players: ^[PlayerNumber]^PlayerData, accel_data:^AccelerationData) {
	defer {
		accel_data.accel[.One] = 0
		accel_data.accel[.Two] = 0
	}
	p1_pushbox_x_coord := players[.One].point.x + (players[.One].current_move == ._6P ? 12 : 16)
	p2_pushbox_x_coord := players[.Two].point.x + (players[.Two].current_move == ._6P ? 5 : 0)

	if players[.One].maybe_throw_status != nil {p1_pushbox_x_coord -= 4}
	if players[.Two].maybe_throw_status != nil {p2_pushbox_x_coord += 4}

	overlap := p2_pushbox_x_coord <= p1_pushbox_x_coord ? true : false
	overlap_degree := p1_pushbox_x_coord - p2_pushbox_x_coord
	if(overlap){
		resolve_push(players, accel_data)
		accel_data.last_frame_pushbox_overlapping = true
	} else {
		accel_data.last_frame_pushbox_overlapping = false
	}

	if(overlap_degree > 0){
		overlap_offset := overlap_degree / 2
		for ; overlap_offset > 0; overlap_offset -= 1 {
			for player in players {
				player.point.x = backward_offset(player, 1)
			}
		}
	}

	for player in players {
		offset := accel_data.accel[player.p_num]
		player.point.x = offset > 0 ? forward_offset(player, offset) : backward_offset(player, offset * -1)
	}

}

Dimensions_2D :: struct {
	w:u32,
	h:u32,
}

// Offsets defined from player 1 origin point, ie, top left corner of the sprite

HitboxType :: enum {
	_ActiveHitbox,
	_Hurtbox,
	_Blockbox,
}

Hitbox :: struct {
	type:HitboxType,
	pt:Point,
	dims:Dimensions_2D,
}

//TODO: Put these in an SOA
stand_blockbox:Hitbox = {
	type = ._Blockbox,
	pt = {0,0},
	dims = {16, 32},
}

stand_p2_blockbox:Hitbox = {
	type = ._Blockbox,
	pt = {1,0},
	dims = {16, 32},
}

stand_6P_hurtbox_p1:Hitbox = {
	type = ._Hurtbox,
	pt = {0,0},
	dims = {12, 32},
}

stand_6P_hitbox_p1:Hitbox = {
	type = ._ActiveHitbox,
	pt = {12,11},
	dims = {5, 8},
}

stand_6P_elbow_hurtbox_p1:Hitbox = {
	type = ._Hurtbox,
	pt = {12,11},
	dims = {5, 8},
}

stand_6P_hurtbox_p2:Hitbox = {
	type = ._Hurtbox,
	pt = {5,0},
	dims = {12, 32},
}

stand_6P_hitbox_p2:Hitbox = {
	type = ._ActiveHitbox,
	pt = {-1,11},
	dims = {6, 8},
}

stand_6P_elbow_hurtbox_p2:Hitbox = {
	type = ._Hurtbox,
	pt = {-1,11},
	dims = {6, 8},
}

stand_chest_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {0,0},
	dims = {16, 18},
}


stand_full_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {0,0},
	dims = {16, 32},
}

stand_legs_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {0,18},
	dims = {15, 14},
}

crouch_blockbox:Hitbox = {
	type = ._Blockbox,
	pt = {0,9},
	dims = {16, 23},
}

crouch_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {0,9},
	dims = {16, 23},
}

throw_hitbox_p1:Hitbox = {
	type = ._ActiveHitbox,
	pt = {16, 6},
	dims = {5,4},
}

throw_hitbox_p2:Hitbox = {
	type = ._ActiveHitbox,
	pt = {-5, 5},
	dims = {5,4},
}


punch_5P_hitbox_p1:Hitbox = {
	type = ._ActiveHitbox,
	pt = {16, 6},
	dims = {5,4},
}

punch_5P_hurtbox_p1:Hitbox = {
	type = ._Hurtbox,
	pt = {16, 5},
	dims = {5,4},
}

punch_5P_hitbox_p2:Hitbox = {
	type = ._ActiveHitbox,
	pt = {-5, 5},
	dims = {5,4},
}

punch_5P_hurtbox_p2:Hitbox = {
	type = ._Hurtbox,
	pt = {-5, 5},
	dims = {5,4},
}

punch_2P_hitbox_p1:Hitbox = {
	type = ._ActiveHitbox,
	pt = {16, 15},
	dims = {5,4},
}

punch_2P_hurtbox_p1:Hitbox = {
	type = ._Hurtbox,
	pt = {16, 15},
	dims = {5,4},
}

punch_2P_hitbox_p2:Hitbox = {
	type = ._ActiveHitbox,
	pt = {-5, 15},
	dims = {5,4},
}

punch_2P_hurtbox_p2:Hitbox = {
	type = ._Hurtbox,
	pt = {-5, 15},
	dims = {5,4},
}

draw_hitbox :: proc (player:^PlayerData, hitbox:Hitbox, show_type: HitboxType = nil){
	if show_type != nil {if hitbox.type != show_type do return}
	w4.DRAW_COLORS^ = player.p_num == .One ? 0x31 : 0x41
	using hitbox
	w4.rect(player.point.x + pt.x, pt.y + player.point.y, u32(dims.w), u32(dims.w))
}

draw_hitbox_2 :: proc (player:^PlayerData, hitbox:Hitbox, show_type: HitboxType = nil){
	if(show_type != nil){if (hitbox.type != show_type) {return}}
	w4.DRAW_COLORS^ = player.p_num == .One ? 0x21 : 0x21
	using hitbox
	w4.rect(player.point.x + pt.x, pt.y + player.point.y, u32(dims.w), u32(dims.w))
}

apply_suffering_attack :: proc (players:^[PlayerNumber]^PlayerData, accel_data:^AccelerationData) {

	if players[.One].maybe_throw_status == ._Breaking{

		for player in players {
			using accel_data, player
			current_attack_frame:= attack_array[._5Throw].recovery - player.current_anim.anim_duration
			switch(current_attack_frame){
				case 1: accel[p_num] = 1; 
				case 11: accel[p_num] = -1; 
				case 12: accel[p_num] = -2;
				case 13: accel[p_num] = -3;
				case 15,18: accel[p_num] = -1;
			}
		}
		return
	}


	for player in players {
		using player
		if(suffering_attack == nil){continue}
		opponent_pnum:PlayerNumber = p_num == .One ? .Two : .One
		using accel_data;
		suffering_atk:AttackDetails = attack_array[suffering_attack.(Movelist)]
		hitstun := suffering_atk.hitstun
		current_attack_frame := suffering_atk.hitstun - current_anim.anim_duration  
		#partial switch(suffering_attack.(Movelist)){
			case ._5P: switch(current_attack_frame){case 1: accel[p_num] = -3}
			case ._6P: switch(current_attack_frame){case 1: accel[p_num] = -2}
			case ._5Throw: switch(current_attack_frame){
				case 1: accel[p_num] = 1; 
				case 11: accel[p_num] = -1; 
				case 12: accel[p_num] = -2;
				case 13: accel[p_num] = -3;
				case 15,18: accel[p_num] = -1;
			}
		}
	}
}

apply_move_acceleration :: proc (players:^[PlayerNumber]^PlayerData, accel_data:^AccelerationData) {
	if players[.One].maybe_throw_status == ._Breaking {
		return
	}

	for player in players {
		using player
		
		using accel_data;
		if player.state == ._Dead {
			switch(player.current_anim.anim_duration){
				case 152, 151: accel[p_num] = -2;  
				case 150, 149, 148: accel[p_num] = -1
				case 155 - 34 : if p_num == .One {point.x -= 10} else {point.x += 5}
				case 155 - 35 : 
					point.y +=17; 
					if p_num == .One {accel[p_num] = -6}
			}
		}
		if player.state == ._RingOut {
			switch(player.current_anim.anim_duration){
				case 172, 171: accel[p_num] = -5
				case 170..168: accel[p_num] = -4
				case 167..162: accel[p_num] = -3
				case 161..155: accel[p_num] = -3;
				case 154:  point.y +=2; accel[p_num] = -2
				case 153 : point.y +=3; accel[p_num] = -5
			}
		}

		if(suffering_attack != nil){continue}

		opponent_pnum:PlayerNumber = p_num == .One ? .Two : .One
		atk:AttackDetails = attack_array[current_move]
		using atk;
		full_attack_length := startup + active + recovery
		current_attack_frame := full_attack_length - current_anim.anim_duration  

		#partial switch(current_move){
			case ._MOVE_FORWARD: accel[p_num] = 1
			case ._MOVE_BACKWARD: 
				switch(player.current_anim.counter % 4) {
					case 0: return
					case: accel[p_num] = -1
				}
			case ._6P: 
				switch(current_attack_frame) {
					case 4, 5, 10, 11: accel[p_num] = 1
					case 12: accel[p_num] = 2
					case 13: accel[p_num] = 3
					case 14: accel[p_num] = 4
					case full_attack_length - 5:  accel[p_num] = - 3
				}
			case ._5P: 
				switch(current_attack_frame) {
					case 8, 12: accel[p_num] = 1
					case 10, 11: accel[p_num] = 2
				}
			case ._5Throw: 
				if(player.maybe_throw_status == nil){continue}
				switch(current_attack_frame) {
					case 13: accel[p_num] = 1
					case 14: accel[p_num] = 2
					case 15: accel[p_num] = 3
					case 16: accel[p_num] = 4
				}
		}
	}
}

apply_move_hitboxes :: proc (players:^[PlayerNumber]^PlayerData, hitbox_data:^HitboxData) {
	if players[.One].maybe_throw_status == ._Breaking {
		return
	}
	

	for player in players {
		using player
		if(state == ._RingOut){continue}
		if(suffering_attack != nil){continue}
		opponent_pnum:PlayerNumber = p_num == .One ? .Two : .One
		atk:AttackDetails = attack_array[current_move]
		full_attack_length := atk.startup + atk.active + atk.recovery
		current_attack_frame := full_attack_length - current_anim.anim_duration  
	
		using hitbox_data;
		//TODO: Put the moves hitboxes on the move itself?
		ranges := attack_ranges(&attack_array[current_move])
		switch(current_move){
			case ._5Throw:
				switch (player.current_anim.idx){
					case 0: hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
					case 1:	
						throw_hitbox := p_num == .One ? throw_hitbox_p1 : throw_hitbox_p2
						if (current_attack_frame == 10){
							hitboxes[p_num] = {stand_full_hurtbox, throw_hitbox, nil}
						}else {
							hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
						}
						
					case 2:	hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
					case 3:	hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
				}
			case ._5P: 
				switch(player.current_anim.idx){
					case 0: hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
					case 1: hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
					case 2: 
						fist_hurtbox := p_num == .One ? punch_5P_hurtbox_p1 : punch_5P_hurtbox_p2
						fist_hitbox := p_num == .One ? punch_5P_hitbox_p1 : punch_5P_hitbox_p2
						if(current_attack_frame >= ranges.active.end){
								hitboxes[p_num] = {stand_full_hurtbox, fist_hurtbox, nil}
							} else {
								hitboxes[p_num] = {stand_full_hurtbox, fist_hurtbox, fist_hitbox}
							}
					case 3: hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
					}
			case ._MOVE_FORWARD: 
				hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
			case ._MOVE_BACKWARD: 
				hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
			case ._IDLE_5: 
				hitboxes[p_num] = {stand_full_hurtbox, nil, nil}
			case ._6P:
				switch(player.current_anim.idx){
					case 0: hitboxes[p_num] = {p_num == .One ? stand_6P_hurtbox_p1 : stand_6P_hurtbox_p2, nil, nil }
					case 1: hitboxes[p_num] = {p_num == .One ? stand_6P_hurtbox_p1 : stand_6P_hurtbox_p2, nil, nil }
					case 2: 
						elbow_hurtbox := p_num == .One ? stand_6P_elbow_hurtbox_p1 : stand_6P_elbow_hurtbox_p2
						elbow_hitbox := p_num == .One ? stand_6P_hitbox_p1 : stand_6P_hitbox_p2
						if(current_attack_frame == 14 || current_attack_frame == 15){
							hitboxes[p_num] = {
								p_num == .One ? stand_6P_hurtbox_p1 : stand_6P_hurtbox_p2,
								elbow_hurtbox, elbow_hitbox}

							} else {
								hitboxes[p_num] = {
									p_num == .One ? stand_6P_hurtbox_p1 : stand_6P_hurtbox_p2,
									elbow_hurtbox, nil,}
							}
					case 3: hitboxes[p_num] = {
						p_num == .One ? stand_6P_hurtbox_p1 : stand_6P_hurtbox_p2, 
						p_num == .One ? stand_6P_elbow_hurtbox_p1 : stand_6P_elbow_hurtbox_p2,
						nil, }
					case 4: hitboxes[p_num] = {p_num == .One ? stand_6P_hurtbox_p1 : stand_6P_hurtbox_p2 , nil, nil}
				}
			case ._IDLE_2:
				hitboxes[p_num] = {crouch_hurtbox, nil, nil}
			case ._2P:
				switch(player.current_anim.idx){
					case 0: hitboxes[p_num] = {crouch_hurtbox, nil, nil}
					case 1: hitboxes[p_num] = {crouch_hurtbox, nil, nil}
					case 2: 
						fist_hurtbox := p_num == .One ? punch_2P_hurtbox_p1 : punch_2P_hurtbox_p2
						fist_hitbox := p_num == .One ? punch_2P_hitbox_p1 : punch_2P_hitbox_p2
						if(current_attack_frame >= ranges.active.end){
								hitboxes[p_num] = {crouch_hurtbox, fist_hurtbox, nil}
							} else {
								hitboxes[p_num] = {crouch_hurtbox, fist_hurtbox, fist_hitbox,}
							}
	
					case 3: hitboxes[p_num] = {crouch_hurtbox, nil, nil}
				}
			case ._5G:
				hitboxes[p_num] = {p_num == .One ? stand_blockbox : stand_p2_blockbox, nil, nil}
			case ._2G:
				hitboxes[p_num] = {crouch_blockbox, nil, nil}
		}
	}

}

resolve_hitboxes :: proc (players: ^[PlayerNumber]^PlayerData, hitbox_data:^HitboxData) -> (attack_hit:[PlayerNumber]bool, attack_blocked:[PlayerNumber]bool) {

	attack_hit = {.One = false, .Two = false}
	attack_blocked = {.One = false, .Two = false}

	actives:[PlayerNumber]MaybeHitbox = { .One = nil, .Two = nil}
	hurtboxes:[PlayerNumber][2]MaybeHitbox = {.One = {nil, nil}, .Two = {nil, nil}}
	blockboxes:[PlayerNumber]MaybeHitbox = {.One = nil, .Two = nil}

	for player in players {
		hurtbox_idx := 0
		for hitbox in hitbox_data.hitboxes[player.p_num]{
			if (hitbox == nil) {continue}
		
			switch(hitbox.(Hitbox).type){
				case ._ActiveHitbox: actives[player.p_num] = hitbox
				case ._Blockbox: blockboxes[player.p_num] = hitbox
				case ._Hurtbox: hurtboxes[player.p_num][hurtbox_idx] = hitbox; hurtbox_idx += 1
			}
		}
	}

	if(actives[.One] == nil && actives[.Two] == nil){
		return attack_hit, attack_blocked
	}



	attack_connected_by_height := proc (atk:AttackDetails, target_player:^PlayerData) -> bool{
		using target_player
		switch(atk.level){
			case .High:  switch(stance){
				case .Crouching, .Crouch_to_Stand_Transition: return false
				case .Standing: return true
				case .Stand_to_Crouch_Transition: return false
			}
			case .Mid: switch(stance){
				case .Crouching, .Crouch_to_Stand_Transition: return true
				case .Standing, .Stand_to_Crouch_Transition: return true
			}
			case .S_Low: return true
			case .HighThrow: switch (stance){
				case .Crouching, .Crouch_to_Stand_Transition: return false
				case .Standing, .Stand_to_Crouch_Transition: 
					#partial switch(state){
						case ._Active, ._Startup: return false
						case: return true
					}
			}
		}
		return false
	}

	
	attack_blocked_by_height := proc (atk:AttackDetails, target_player:^PlayerData) -> bool{
		using target_player
		switch(atk.level){
			case .High:  switch(stance){
				case .Crouching, .Crouch_to_Stand_Transition: return false
				case .Standing: return true
				case .Stand_to_Crouch_Transition: return false
			}
			case .Mid: switch(stance){
				case .Crouching, .Crouch_to_Stand_Transition: return false
				case .Standing, .Stand_to_Crouch_Transition: return true
			}
			case .S_Low: return true
			case .HighThrow: switch(stance){
				case .Crouching, .Crouch_to_Stand_Transition: return false
				case .Standing, .Stand_to_Crouch_Transition: return false
			}
		}
		return false
	}

	get_furthest_hitbox_x_point := proc (player:^PlayerData, hitbox:Hitbox) -> i32 {
		return player.point.x + hitbox.pt.x + i32(player.p_num == .One ? i32(hitbox.dims.w) : 0)   
	}

	apply_throw := proc (player_atking:^PlayerData, player_defending:^PlayerData, attack_hit:^[PlayerNumber]bool) {
		current_atk := attack_array[player_atking.current_move]
		if current_atk.level == .HighThrow && attack_hit[player_atking.p_num] {
			#partial switch(player_defending.state) {
				case ._ThrowActive, ._ThrowStartup : 
					player_atking.maybe_throw_status = ._Breaking
					player_defending.maybe_throw_status = ._Breaking
					attack_hit[player_atking.p_num] = false
				case: 	
					player_atking.maybe_throw_status = ._Success
			}
		}
	}


	for player_atking in players {

		if(actives[player_atking.p_num] == nil){continue}
		using player_atking
		attack_x_point: = get_furthest_hitbox_x_point(player_atking, actives[player_atking.p_num].(Hitbox))
		defending_pnum:PlayerNumber = player_atking.p_num == .One ? .Two : .One

		current_atk := attack_array[player_atking.current_move]
		stance_connect := attack_connected_by_height(current_atk, players[defending_pnum])

		if (blockboxes[defending_pnum] != nil){ 
			blockbox_x_point := get_furthest_hitbox_x_point(players[defending_pnum], blockboxes[defending_pnum].(Hitbox))
			intersect := player_atking.p_num == .One ? blockbox_x_point <= attack_x_point : attack_x_point <= blockbox_x_point
			block_success := attack_blocked_by_height(current_atk, players[defending_pnum])
			attack_blocked[player_atking.p_num] = intersect && stance_connect && block_success
			attack_hit[player_atking.p_num] = intersect && stance_connect && !block_success
			apply_throw(player_atking, players[defending_pnum], &attack_hit)
		}
		
		for hurtbox in hurtboxes[defending_pnum] {
			if(hurtbox == nil){continue}
			hurtbox_x_point := get_furthest_hitbox_x_point(players[defending_pnum], hurtbox.(Hitbox))
			intersect := player_atking.p_num == .One ? hurtbox_x_point <= attack_x_point : attack_x_point <= hurtbox_x_point
			attack_hit[player_atking.p_num] = intersect && stance_connect
			apply_throw(player_atking, players[defending_pnum], &attack_hit)
		}

	}
	return attack_hit, attack_blocked
}



draw_healthbars :: proc (health:[PlayerNumber]i8) {
	w4.DRAW_COLORS^ = 2
	w4.rect(30,27,42, 7)
	w4.rect(42 + 9 + 40,27,42, 7)
	
	w4.DRAW_COLORS^ = 3
	w4.rect(31+(5*i32(8 -health[.One])), 28, 5*u32(health[.One]), 5)


	w4.DRAW_COLORS^ = 4
	w4.rect(92, 28, 5*u32(health[.Two]), 5)

	for lifebar, idx in health {
		text_offset:i32 = idx == .One ? 0 : 86
		text_offset += 21
		w4.DRAW_COLORS^ = player_draw_colour(idx)
		w4.text(idx == .One ? "P1" : "P2", 10 + text_offset, 36 )
	}

}



draw_stage :: proc () {
	w4.DRAW_COLORS^ = 2 
	w4.line(29, 101, 29, 104)
	w4.line(160-29, 101, 160-29, 104)
	
	w4.line(29, 105, 160-29, 105)

	w4.line(29, 100, 29+11, 104-9)
	w4.line(160-29, 100, (160-29)-11, 104-9)

	w4.line(29+11, 104-9, (160-29)-11, 104-9)

	w4.line(34, 101, 160-34, 101)
}

draw_round_markers :: proc (rounds_won:[PlayerNumber]u8) {
	w4.DRAW_COLORS^ = 0x12
	for i in 0..3 {
		w4.DRAW_COLORS^ = int(rounds_won[.One]) < i+1 ?  0x12 : 0x23
		w4.rect(68  - (i32(i) * 5), 36, 5, 5)
		w4.DRAW_COLORS^ = int(rounds_won[.Two]) < i+1 ?  0x12 : 0x24
		w4.rect(90  + (i32(i) * 5), 36, 5, 5)
	}
}


print_fractional :: proc(buffer: []u8, remainder: f64, precision: int) -> (length: int) {

    if precision + 1 > len(buffer) {
        // Doesn't fit `.abc`
        return 0
    }

    multiplier := f64(1)
    for in 1..precision {
        multiplier *= 10
    }

    r := uint(remainder * multiplier)

    for i := 0; i < precision; i += 1 {
        _i := len(buffer) - i - 1

        buffer[_i] = '0' + u8(r % 10)
        r /= 10
        length += 1
    }
    buffer[len(buffer) - precision - 1] = ' '
    return length + 1
}

log10 :: proc(value: int) -> (res: int) {
	v := value
	for v > 0 {
		v /= 10
		res += 1
	}
	return res if value > 0 else 1
}


print_float :: proc(buffer: []u8, value: f64, precision: int = 3) -> (s: string) {
    assert(precision >= 0 && precision <= 19)


    whole := int(value)
    fract := value - f64(whole)

    whole_size := log10(whole)
    fract_size := 0 if precision == 0 else precision + 1 // if precision is zero we also don't need the .

    if whole_size + fract_size > len(buffer) {
        // Doesn't fit
        return ""
    }

    for i in 1..whole_size {
        buffer[whole_size - i] = '0' + u8(whole % 10)
        whole /= 10
    }
    if fract_size > 0 {
        print_fractional(buffer[whole_size:][:fract_size], fract, precision)
    }
    return string(buffer[:whole_size + fract_size])
}

draw_time :: proc (time:f64, health:[PlayerNumber]i8) {
	time_buffer:[5]u8
	f_text := print_float(time_buffer[:], time, 2)
	w4.DRAW_COLORS^ = 0x02
	_ts, _te : int
	if(time < 10){
		_ts = 2; _te = 4
	} else {
		_ts = 3; _te = 5
	}
	x_offset :i32 = 73
	y_offset :i32 = 27
	w4.text(string(time_buffer[_ts:_te]), x_offset + 1,y_offset)
	w4.DRAW_COLORS^ = health[.Two] > health[.One] ? 0x04 : 0x03
	w4.text(string(time_buffer[0:2]), x_offset + (time < 10 ? 5 : 0),y_offset)

}


VictoryType :: enum {
	_Knockout,
	_Timeout,
	_Ringout,
	_None,
}

@export
update :: proc "c" () {
	context = runtime.default_context()
	w4.DRAW_COLORS^ = 2 

	@static win_count := [PlayerNumber]f64{ .One = 0, .Two = 0}
	@static player_ready:= [PlayerNumber]bool {.One = false, .Two = false}
	@static victory_type :VictoryType = ._None
	@static health := [PlayerNumber]i8{.One = 8, .Two = 8}
	input_ptrs := [PlayerNumber]^[3]FG_Notation{ .One = &fg_input_1, .Two = &fg_input_2}
	player_ptrs := [PlayerNumber]^PlayerData{.One = &p1_data, .Two = &p2_data}

	@static rounds_won := [PlayerNumber]u8{.One = 0, .Two = 0}
	@static time := 15.00

	@static game_start:= false
	@static game_start_counter:= 0
	game_start_threshold := 90

	if(!game_start){
		if player_ready[.One] && player_ready[.Two] {
			game_start_counter+= 1
			if game_start_counter == game_start_threshold {game_start = true; rounds_won = {.One = 0, .Two = 0};game_start_counter = 0}
		}
		w4.DRAW_COLORS^ = 0x2
		w4.rect(30, 50, 100, 100)
		w4.DRAW_COLORS^ = 0x21 
		w4.text("P1 wins:", 40, 60)
		w4.text("000", 120 - 16, 60)
		w4.text("P2 wins:", 40, 68)
		w4.text("000", 120 - 16, 68)
		string_buf:[3]u8
		w4.text(print_float(string_buf[:], win_count[.One], 0), 120 - i32(((log10(int(win_count[.One]))) - 1) * 8), 60)
		w4.text(print_float(string_buf[:], win_count[.Two], 0), 120 - i32(((log10(int(win_count[.Two])))- 1) * 8), 68)

		w4.text(win_count[.One] == 0 && win_count[.Two] == 0 ? "Start?": "Rematch?", 60, 88)
		for ready, idx in player_ready {
			if(ready){
				w4.DRAW_COLORS^ = idx == .One ? 0x3 : 0x4
				w4.rect(idx == .One ? 40 : 80, 109, 24, 9)
			}
			w4.DRAW_COLORS^ = 0x1
			w4.text(ready ? "Yes" : "No", idx == .One ? 40 : 80, 110)
			w4.DRAW_COLORS^ = idx == .One ? 0x33 : 0x44
			w4.oval(idx == .One ? 66 : 106, 110, 6, 6)
			controller := idx == .One ? w4.GAMEPAD1^ : w4.GAMEPAD2^
			if .A in controller {
				player_ready[idx] = true
			}
		}
		return
	}

	@static round_start := false; round_start_threshold := 96; @static round_start_count := 0
	go_text_threshold := 60; @static go_text_count := 0

	switch(round_start){
		case true:
			if go_text_count < go_text_threshold {
				w4.text("Go!", 72, 52)
				go_text_count += 1
			}
		case false:
			w4.text("Ready?", 55, 52)
			round_start_count +=1
			w4.DRAW_COLORS^ = round_start_count < 68 ? 0x2 : 0x3
			w4.rect(55, 61, 1 * u32((round_start_count / 2)), 1)
			if round_start_count == round_start_threshold {
				round_start = true
				round_start_count = 0
			}
	}


	re_init_round := proc (player_ptrs:[PlayerNumber]^PlayerData) {
		for player in player_ptrs {
			init_pdata(player, player.p_num)
		}
		health = {.One = 8, .Two = 8}
		time = 15.00
		death_counter = 0
		player_dead = false
		victory_type = ._None
		round_start = false; round_start_count = 0; go_text_count = 0
	}

	@static player_dead := false
	@static death_counter := 0
	death_threshold := 155
	//DRAW VICTORY ANIMATIONS

	for player in player_ptrs {
		if player.state == ._Dead || player.state == ._RingOut{death_counter += 1}
	}
	

	if (rounds_won[.One] == 4 || rounds_won[.Two] == 4) && death_counter >= death_threshold {
		for count, pnum in rounds_won {
			@static update_wins_counter := 0
			update_wins_threshold := 150
			if count == 4 {
				opposing_pnum:PlayerNumber= pnum == .One ? .Two : .One
				str:= rounds_won[opposing_pnum] == 4 ? "Draw!" : (pnum == .One ? "P1 wins!" : "P2 wins!")
				w4.DRAW_COLORS^ = 2
				w4.rect(30, 50, 100, 30)
				w4.DRAW_COLORS^ = 1 
				w4.text(str, rounds_won[opposing_pnum] == 4 ? 60 : 50, 60)
				if update_wins_counter == update_wins_threshold {
					if rounds_won[opposing_pnum] == 4 {win_count[opposing_pnum] += 1 }
					win_count[pnum] += 1
					game_start = false
					player_ready = [PlayerNumber]bool {.One = false, .Two = false}
					re_init_round(player_ptrs)

				}
				update_wins_counter = update_wins_counter == update_wins_threshold ? 0 : update_wins_counter + 1
				return
			}
		}
	}


	draw_stage()
	draw_healthbars(health)
	draw_round_markers(rounds_won)
	draw_time(time, health)
	if(victory_type != ._None){
		victory_text:string
		#partial switch(victory_type){
			case ._Knockout: victory_text = "Knockout!"
			case ._Ringout: victory_text = "Ring Out!"
			case ._Timeout: victory_text = "Time out!"
		}
		p1_wins := health[.One] > health[.Two] || p2_data.state == ._RingOut || p2_data.state == ._Dead
		p2_wins := health[.One] < health[.Two] || p1_data.state == ._RingOut || p1_data.state == ._Dead
		w4.DRAW_COLORS^ = p2_wins ? 0x04 : 0x03
		w4.text(victory_text,48,48)
		player_wins_text:string

		switch {
			case p1_wins: player_wins_text = "P1 wins!"
			case p2_wins: player_wins_text = "P2 wins!"
		}
		if (!p1_wins && !p2_wins){
			player_wins_text = "Draw!"
		}
		w4.text(player_wins_text,!p1_wins && !p2_wins ? 62: 52,56)
	}


	hitbox_data:HitboxData = {{.One = {nil, nil, nil}, .Two = {nil, nil, nil}}}

	@static accel_data:AccelerationData = {
		{.One = 0, .Two = 0},
		false,
		false,
	}



	//CHECK FOR KILL: TIME OUT
	if time <= 0 {
		time = 0; death_counter += 1;
		if(player_dead == false){
			if health[.One] >= health[.Two]{
				rounds_won[.One] += 1
			}
			if health[.One] <= health[.Two]{
				rounds_won[.Two] += 1
			}
			player_dead = true
			victory_type = ._Timeout
		}
	}
	//CHECK FOR KILL: RING OUT
	for player, idx in player_ptrs {
		using player_ptrs[idx].point
		crossed_left := x < 30
		crossed_right := x > 130-16
		if (crossed_left || crossed_right){
			opposing_pnum:PlayerNumber=idx == .One ? .Two : .One
			using player
			self_threshold :i32 = idx == .One ? 30 : 130-16
			opponent_threshold :i32= idx == .One ? 130-16 : 30
			 switch {
				case (idx == .One ? crossed_left : crossed_right) && (player_ptrs[opposing_pnum].state == ._RingOut || time == 0): x = self_threshold; continue
				case (idx == .One ? crossed_right :crossed_left): x = opponent_threshold; continue
			}
			
			if(player.state == ._RingOut || player.state == ._Dead ){
				switch(y){
					case 69, 69+2, 69+5,  69+17+5: continue
				}
				y+= 5
				continue
			}
			current_anim.idx = 0
			current_anim.counter = 0
			current_anim.anim_duration = 175
			rounds_won[opposing_pnum] += 1
			player_dead = true
			current_move = ._IDLE_5
			buffered_move = ._IDLE_5
			suffering_attack = nil
			victory_type = ._Ringout
			state = ._RingOut
		}
	}

	if(death_counter == death_threshold){
		re_init_round(player_ptrs)
	}



	for player in player_ptrs {
		if round_start == false {continue}
		if(player.state == ._Dead || player.state == ._RingOut){continue}
		if player.p_num == .One {time -= .0167}
		using player
		playerGamepad := player.p_num == .One ? w4.GAMEPAD1^ : w4.GAMEPAD2^
		buttons_to_fg_notation_set(playerGamepad, input_ptrs[p_num], p_num)
		when(DEBUGGING) {debug_fg_note_display(input_ptrs[p_num], player)}
		player.buffered_move = fg_notation_to_move(input_ptrs[p_num])


		if(player.state == ._Idle){
			update_idle_player_with_move(player)
		}
		
	}

	apply_suffering_attack(&player_ptrs, &accel_data)
	//Everything above is pretty good
	apply_move_acceleration(&player_ptrs, &accel_data)
	apply_move_hitboxes(&player_ptrs, &hitbox_data)

	@static disable_hitboxes_counter :u8 = 0
	@static disable_hitboxes_threshold :u8 = 1
	@static impact := false

	if impact { disable_hitboxes_counter += 1}
	if disable_hitboxes_counter == disable_hitboxes_threshold {
		disable_hitboxes_counter = 0
		impact = false
	}
	if(!impact){
		attack_hit, attack_blocked := resolve_hitboxes(&player_ptrs, &hitbox_data)
		for x in attack_hit {if x == true {impact = true}}
		for x in attack_blocked {if x == true {impact = true}}

		if(impact){
			update_players_with_hit_resolution(player_ptrs, attack_hit, attack_blocked, &health, &rounds_won, &player_dead, &victory_type, time)
			disable_hitboxes_threshold = p1_data.suffering_attack == nil ? attack_array[p1_data.current_move].active : attack_array[p2_data.current_move].active 
			disable_hitboxes_threshold += 5
			if (p1_data.maybe_throw_status == ._Breaking){
				for player in player_ptrs {
					throw_data := attack_array[._5Throw]
					using throw_data
					full_attack_length := startup + active + recovery
					active_period := startup + active
					current_attack_frame := full_attack_length - player.current_anim.anim_duration 
					player.current_anim.anim_duration = recovery 
					player.current_anim.counter = 0
					player.current_anim.idx = 0
					player.state = ._Recovery
					player.suffering_attack = nil
				}
			}
			for player in player_ptrs {
				using player
				opposing_pnum :PlayerNumber = p_num == .One ? .Two : .One
				if attack_blocked[player.p_num] {accel_data.accel[opposing_pnum] -= 2}
			}
		} 


	}
	advance_animation(player_ptrs)
	resolve_accel(&player_ptrs, &accel_data)

}