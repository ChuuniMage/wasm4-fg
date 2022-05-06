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
	0b0001111101111100,
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

punch_1_extra := []u8{
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

punch_2_extra := []u8 {
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

hitstun_stand_high := [32]u16be {
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

walk_f_anim_array: [4][32]u16be
walk_b_anim_array : [4][32]u16be
idle_anim_array: [4][32]u16be

punch_5p_anim_array: [4][32]u16be
punch_5p_anim_extra: [2][]u8
punch_2p_anim_array: [4][32]u16be
punch_6p_anim_array: [5][32]u16be

animFrameArrays: [Movelist][][32]u16be
animDurationArrays: [Movelist][]int
extraAnimArrays: #sparse [Movelist] proc (using player:^PlayerData, idx:int, player_blit:w4.Blit_Flags)

DefaultPalette:[4]u32

RunningAnimation :: struct {
	counter:u8,
	idx:u8,
}

AnimationFrameData :: struct {
	frames:[][32]u16be,
	durations:[]u32,
}


PlayerNumber :: enum {One, Two,}

FG_Notation :: enum {_1,_2,_3,_4,_5,_6,_7,_8,_9,_P,_G,_NULL}

FG_Input :: [3]FG_Notation

buttons_to_fg_notation_set :: proc(btns:w4.Buttons, fg_input:^FG_Input, p_num:PlayerNumber) {
	input_matrix := [3][3]FG_Notation{
		{._7, ._8, ._9}, 
		{._4, ._5, ._6},
		{._1, ._2, ._3}}

	selection := [2]u32{1,1};
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

DEBUG_fg_note_to_rune_array:[FG_Notation]rune

debug_fg_note_display :: proc (fg_input:^[3]FG_Notation, player:^PlayerData) {
	w4.DRAW_COLORS^ = 2
	offset:i32 = player.p_num == PlayerNumber.One ? 0 : 80

	for input, idx in fg_input {
		bs, w := utf8.encode_rune(DEBUG_fg_note_to_rune_array[fg_input[idx]])
		str := string(bs[:w])
		w4.text(str, 10 + offset + (i32(idx) * 8) , 20)
	}
}

anim_5P_extra :: proc (using player:^PlayerData, idx:int, player_blit:w4.Blit_Flags) {
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

anim_2P_extra :: proc (using player:^PlayerData, idx:int, player_blit:w4.Blit_Flags) {
	switch (idx){
		case 2:
			w4.blit(cast(^u8)&punch_2_extra[0], 
				i32(point.x + (p_num == .Two ? -5 : 16)), 
				i32(15 + point.y), 
				5, 
				4, player_blit + {.FLIPY})
	}
}

anim_6P_extra :: proc (using player:^PlayerData, idx:int, player_blit:w4.Blit_Flags) {
	switch (idx){
		case 2, 3:
			w4.blit(cast(^u8)&elbow_1_extra[0], i32(point.x - (player.p_num == .One ? 5 : -16)), i32(point.y + 23), 5, 9, player_blit)
	}
}

do_animation :: proc (using player:^PlayerData, 
	anim_array:[][32]u16be, 
	anim_durations:[]int, 
	extra_anim:proc (using player:^PlayerData, idx:int, player_blit:w4.Blit_Flags)) 
	{
	player_blit:w4.Blit_Flags = p_num == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = p_num == PlayerNumber.One ? 0x30 : 0x40

	using player.current_anim
	counter += 1;
	anim_threshold := anim_durations[idx]

	if (counter == anim_threshold){
		counter = 0
		idx = idx == (len(anim_array) - 1) ? 0 : idx + 1
	}

	w4.blit(cast(^u8)&anim_array[idx][0], point.x, point.y, 16, 32, player_blit)
	if(extra_anim != nil){
		extra_anim(player, idx, player_blit)
	}
}

draw_rects :: proc () {
	prev_draw_colours := w4.DRAW_COLORS^
	defer{w4.DRAW_COLORS^ = prev_draw_colours}

	w4.DRAW_COLORS^ = 0x4
	w4.rect(81, 80+32-3, 25, 22)

	w4.DRAW_COLORS^ = 0x0
	w4.rect(44, 120 , 8, 8 * 2)

	w4.DRAW_COLORS^ = 0x1
	w4.rect(44 + 64 - 24, 80+32 , 8, 8 * 2)

	w4.DRAW_COLORS^ = 0x2
	w4.rect(44 + 64 - 16, 80+32 , 8, 8 * 2)
	w4.DRAW_COLORS^ = 0x3
	w4.rect(44 + 64 - 8, 80+32 , 8, 8 * 2)
	w4.DRAW_COLORS^ = 0x4
	w4.rect(44 + 64, 80+32 , 8, 8 * 2)

}

PlayerStance :: enum {
	Standing,
	Stand_to_Crouch_Transition,
	Crouching,
}

PlayerState :: enum {
	_Idle,
	_Blocking,
	_Active,
	_Recovery,
	_Startup,
	_Moving,
	_Blockstun,
	_Hitstun,
}

AttackLevel :: enum {
	High,
	Mid,
	S_Low,
}

AttackDetails :: struct {
	level:AttackLevel,
	startup:u32,
	active:u32,
	recovery:u32,
	hitstun:u32,
	blockstun:u32,
	ch_bonus:u32,
	total_duration:u32,
}

attack_array: [Movelist]AttackDetails

p1_data:PlayerData
p2_data:PlayerData

Movelist :: enum {
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

Point :: struct {
	x:i32,
	y:i32,
}

PlayerAnimData :: struct {
	counter:int,
	idx:int,
	anim_duration:u32,
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
}

StateColoursArray:[PlayerState]u32

idle_anim_data:AnimationFrameData
walk_f_anim_data:AnimationFrameData
walk_b_anim_data:AnimationFrameData
punch_5p_anim_data:AnimationFrameData



@export
start :: proc "c" () {
	//Global stuff MUST be initialised here, or else will be null at runtime because wasm
	context = runtime.default_context()


	
	DEBUG_fg_note_to_rune_array = {
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

	DefaultPalette = {0xe0f8cf, 0x86c06c, 0x306850, 0x071821}
	StateColoursArray = {
		._Idle = 0x306850,
		._Startup = 0xde8d31,
		._Active = 0xd62f2f,
		._Recovery = 0x393ed4,
		._Blocking = 0x20bed6,
		._Moving = 0x32a848,
		._Blockstun = 0x0b6eb5,
		._Hitstun = 0xff00e1,
	}

	atk_details_5P:AttackDetails = {
		level = .High,
		startup = 11,
		active = 2,
		recovery = 14,
		hitstun = 22,
		blockstun = 19,
		ch_bonus = 3,
		total_duration = 1,
	}
	
	atk_details_2P:AttackDetails = {
		level = .S_Low,
		startup = 11,
		active = 1,
		recovery = 21,
		hitstun = 25,
		blockstun = 16,
		ch_bonus = 3,
		total_duration = 1,
	}
	
	atk_details_6P:AttackDetails = {
		level = .Mid,
		startup = 13,
		active = 2,
		recovery = 21,
		hitstun = 21,
		blockstun = 16,
		ch_bonus = 7,
		total_duration = 1,
	}
	attack_array = #partial [Movelist]AttackDetails{
		._5P = atk_details_5P, 
		._2P = atk_details_2P, 
		._6P = atk_details_6P}

	extraAnimArrays = #partial [Movelist] proc (using player:^PlayerData, idx:int, player_blit:w4.Blit_Flags) {
		._5P = anim_5P_extra,
		._2P = anim_2P_extra,
		._6P = anim_6P_extra,
	}

	idle_anim_array = {idle_stand_0, idle_stand_1, idle_stand_2, idle_stand_3}
	walk_f_anim_array = {f_walk_0, f_walk_1, f_walk_2, idle_stand_0}
	walk_b_anim_array = {f_walk_0, b_walk_1, f_walk_2, idle_stand_0}
	punch_5p_anim_array = {punch_0, punch_1, punch_2, punch_1}
	punch_2p_anim_array = {crouch_punch_0, crouch_punch_1, crouch_punch_2, crouch_punch_1}
	punch_6p_anim_array = {punch_0, elbow_0, elbow_1, elbow_2, elbow_3}

	animFrameArrays = [Movelist][][32]u16be{
		._5P = punch_5p_anim_array[:], 
		._2P = punch_2p_anim_array[:], 
		._6P = punch_6p_anim_array[:],
		._IDLE_5 = idle_anim_array[:], 
		._IDLE_2 = {idle_crouch_0},
		._MOVE_BACKWARD = walk_b_anim_array[:],
		._MOVE_FORWARD = walk_f_anim_array[:],
		._5G = {guard_stand},
		._2G = {guard_crouch},
	}

	anim_idle_lengths := [4]int{30,30,30,5}
	anim_walk_f_lengths := [4]int{7,7,7,7}
	anim_walk_b_lengths := [4]int{8,8,8,8}
	anim_5P_lengths := [4]int{5,6,7,9}
	anim_2P_lengths := [4]int{5,6,6,16}
	anim_6P_lengths := [5]int{6,7,13,6,4}

	animDurationArrays = [Movelist][]int{
		._5P = anim_5P_lengths[:], 
		._2P = anim_2P_lengths[:], 
		._6P = anim_6P_lengths[:],
		._IDLE_5 = anim_idle_lengths[:], 
		._IDLE_2 = {2},
		._MOVE_BACKWARD = anim_walk_b_lengths[:],
		._MOVE_FORWARD = anim_walk_f_lengths[:],
		._5G = {2},
		._2G = {2},
	}

	for atk in &attack_array {
		atk.total_duration = atk.startup + atk.active + atk.recovery
	}
	p1_data = {
		p_num = PlayerNumber.One,
		point = {x = 18, y = 70},
		current_anim = {0, 0, 1},
		previous_move = ._IDLE_5,
		buffered_move = ._IDLE_5,
		stance = .Standing,
		state = ._Idle,
		current_colour = DefaultPalette[3],
	}

	p2_data = {
		p_num = PlayerNumber.Two,
		point = {x = 160-18, y = 70},
		current_anim = {0, 0, 1},
		previous_move = ._IDLE_5,
		buffered_move = ._IDLE_5,
		stance = .Standing,
		state = ._Idle,
		current_colour = DefaultPalette[3],
	}
	
}


advance_animation :: proc (using player:^PlayerData) {
	
	w4.DRAW_COLORS^ = player.p_num == PlayerNumber.One ? 3 : 4 // Set the player colour to be drawn
	if(state != ._Idle && state != ._Moving && state != ._Blocking){
		
		atk:AttackDetails = attack_array[current_move]
		using atk;
		full_attack_length := startup + active + recovery
		active_period := startup + active
		current_attack_frame := full_attack_length - current_anim.anim_duration 

		switch {
			case current_attack_frame <= startup:
				player.state = ._Startup
			case current_attack_frame <= active_period:
				player.state = ._Active 
			case:
				player.state = ._Recovery
		}
	}
	if (current_anim.anim_duration  == 0){
		player.state = ._Idle
		update_idle_player_with_move(player)
	} 
	current_anim.anim_duration  -=  1;
	w4.PALETTE[player.p_num == PlayerNumber.One ? 2 : 3] = StateColoursArray[player.state]
	do_animation(player, animFrameArrays[current_move], animDurationArrays[current_move], extraAnimArrays[current_move])
	w4.tracef("Anim duration: %f",  f64(current_anim.anim_duration ))
}

update_idle_player_with_move :: proc (using player:^PlayerData){
	previous_move = current_move
	current_move = buffered_move

	switch(buffered_move){
		case ._MOVE_BACKWARD: 
			stance = .Standing
			state = ._Moving
			current_anim.anim_duration  = 1
			if (previous_move == ._MOVE_BACKWARD){
				w4.PALETTE[player.p_num == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
		case ._MOVE_FORWARD: 
			stance = .Standing
			state = ._Moving
			current_anim.anim_duration  = 2
			if (previous_move == ._MOVE_FORWARD){
				w4.PALETTE[player.p_num == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
		case ._IDLE_5: 
			stance = .Standing
			state = ._Idle
			current_anim.anim_duration  = 2
			if (previous_move == ._IDLE_5){
				w4.PALETTE[player.p_num == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
		case ._IDLE_2: 
			stance = .Crouching
			state = ._Idle
			current_anim.anim_duration  = 2
		case ._5P: 
			stance = .Standing
			state = ._Startup
			current_anim.anim_duration  = attack_array[buffered_move].total_duration
		case ._2P: 
			stance = .Crouching
			state = ._Startup
			current_anim.anim_duration  = attack_array[buffered_move].total_duration
		case ._6P: 
			stance = .Standing
			state = ._Startup
			current_anim.anim_duration  = attack_array[buffered_move].total_duration
		case ._5G: 
			stance = .Standing
			state = ._Blocking
			current_anim.anim_duration = 2
			if (previous_move == ._5G){
				w4.PALETTE[player.p_num == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
		case ._2G: 
			stance = .Crouching
			state = ._Blocking
			current_anim.anim_duration = 2
			if (previous_move == ._2G){
				w4.PALETTE[player.p_num == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
	}
	w4.PALETTE[player.p_num == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
	player.current_anim.counter = 0
	player.current_anim.idx = 0
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
				case fg_input[1] == ._P: move = ._5P
				case fg_input[2] == ._G: move = ._5G
				case: move = ._IDLE_5
			}
		case  ._4: 
			switch{
				case fg_input[1] == ._P: move = ._5P
				case fg_input[2] == ._G: move = ._5G
				case: move = ._MOVE_BACKWARD
			}
		case ._6: 
			switch{
				case fg_input[1] == ._P: move = ._6P
				case fg_input[2] == ._G: move = ._5G
				case: move = ._MOVE_FORWARD
			}

		case: move = _IDLE_5
	}

	return move
}

//Currently not strictly needed, but will need for dash
MAX_INPUT_BUFFER_SIZE :: 15

InputCircularBuffer :: struct {
	buffer:[MAX_INPUT_BUFFER_SIZE][3]FG_Notation,
	current_pos:u8,
}

add_frame_input_to_buffer :: proc(input:^FG_Input, buffer:^InputCircularBuffer) {
	if buffer.current_pos == MAX_INPUT_BUFFER_SIZE { buffer.current_pos = 0;}
}

resolve_push :: proc (players: ^[PlayerNumber]^PlayerData, accel_data:^AccelerationData) {
	using accel_data
	p1_advancing := accel[.One] > 0
	p2_advancing := accel[.Two] > 0

	if(!p1_advancing && !p2_advancing){
		w4.trace("NOT ADVANCING")
		return}
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
	
	if(players[.One].current_move == ._6P){
		w4.tracef("6P BEING DONE")
	}
	
	for delta > 0 {
		w4.tracef("tracking push delta -> %f", f64(delta))
		delta -= 1
		counter += 1
		if(counter == push_threshold){
			accel[advancing_player.p_num] += 1
			accel[retreating_player.p_num] -= 1
			counter = 0
		}
	}

}

L_SCREEN_LIMIT :: 0
R_SCREEN_LIMIT :: 160 - 16

forward_offset :: proc(using player:^PlayerData, diff:i32) -> i32 {
	forward_screen_limit:i32 = player.p_num == .One ? R_SCREEN_LIMIT : L_SCREEN_LIMIT
	if(point.x == forward_screen_limit){return point.x}
	return p_num == .One ? point.x + diff : point.x - diff
}

backward_offset :: proc(using player:^PlayerData, diff:i32) -> i32 {
	backward_screen_limit:i32 = player.p_num == .One ? L_SCREEN_LIMIT : R_SCREEN_LIMIT
	if(point.x == backward_screen_limit){return point.x}
	return p_num == .One ? point.x - diff : point.x + diff
}

AccelerationData :: struct {
	accel:[PlayerNumber]i32,
	last_frame_pushbox_overlapping:bool,
	current_frame_pushbox_overlapping:bool,
}

HitboxData :: struct {
	hitboxes:[PlayerNumber][]Hitbox,
}

apply_accel :: proc (players: ^[PlayerNumber]^PlayerData, accel_data:^AccelerationData) {
	defer {
		accel_data.accel[.One] = 0
		accel_data.accel[.Two] = 0
	}

	p1_pushbox_x_coord := players[.One].point.x + (players[.One].current_move == ._6P ? 12 : 16)
	p2_pushbox_x_coord := players[.Two].point.x 

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
	_Pushbox,
	_ActiveHitbox,
	_Hurtbox,
	_Blockbox,
}

Hitbox :: struct {
	type:HitboxType,
	pt:Point,
	dims:Dimensions_2D,
}

stand_blockbox:Hitbox = {
	type = ._Blockbox,
	pt = {0,0},
	dims = {16, 32},
}

stand_6P_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {0,0},
	dims = {11, 32},
}

stand_chest_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {0,0},
	dims = {16, 18},
}

stand_pushbox:Hitbox = {
	type = ._Pushbox,
	pt = {0,0},
	dims = {15, 32},
}

stand_full_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {0,0},
	dims = {15, 32},
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

crouch_pushbox:Hitbox = {
	type = ._Pushbox,
	pt = {0,7},
	dims = {16, 25},
}

punch_5P_hitbox:Hitbox = {
	type = ._ActiveHitbox,
	pt = {16, 6},
	dims = {5,4},
}

punch_5P_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {16, 6},
	dims = {5,4},
}

punch_2P_hitbox:Hitbox = {
	type = ._ActiveHitbox,
	pt = {16, 6},
	dims = {5,4},
}

punch_2P_hurtbox:Hitbox = {
	type = ._Hurtbox,
	pt = {16, 15},
	dims = {5,4},
}

draw_hitbox :: proc (player:^PlayerData, hitbox:Hitbox){
	w4.DRAW_COLORS^ = player.p_num == .One ? 0x30 : 0x40
	using hitbox

	w4.tracef("hitbox pt x %f", f64(player.point.x + pt.x))
	w4.tracef("hitbox pt y %f", f64(player.point.y + pt.y))
	w4.tracef("hitbox dim w %f", f64(dims.w))
	w4.tracef("hitbox dim h %f", f64(dims.h))
	w4.rect(player.point.x + pt.x, player.point.y + pt.y, dims.w, dims.h)
}



apply_move_state :: proc (using player:^PlayerData, accel_data:^AccelerationData, hitbox_data:^HitboxData) {
	atk:AttackDetails = attack_array[current_move]
	using atk;
	full_attack_length := startup + active + recovery
	current_attack_frame := full_attack_length - current_anim.anim_duration  

	using accel_data;
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
	}

	using hitbox_data;
	//Hurtboxes
	switch(current_move){
		case ._MOVE_FORWARD, ._MOVE_BACKWARD, ._5P: 
			new_hitboxes := [1]Hitbox{stand_full_hurtbox}
			hitboxes[p_num] = new_hitboxes[:]
		case	._IDLE_5:
			new_hitboxes := [1]Hitbox{stand_full_hurtbox}
			hitboxes[p_num] = new_hitboxes[:]
		case ._6P:
			new_hitboxes := [1]Hitbox{stand_6P_hurtbox}
			hitboxes[p_num] = new_hitboxes[:]
		case ._IDLE_2, ._2P:
			new_hitboxes := [1]Hitbox{crouch_hurtbox}
			hitboxes[p_num] = new_hitboxes[:]
		case ._5G:
			new_hitboxes := [1]Hitbox{stand_blockbox}
			hitboxes[p_num] = new_hitboxes[:]
		case ._2G:
			new_hitboxes := [1]Hitbox{crouch_blockbox}
			hitboxes[p_num] = new_hitboxes[:]

	}

}

@export
update :: proc "c" () {
	context = runtime.default_context()
	w4.DRAW_COLORS^ = 2 
	w4.text("GenericAnim!", 10, 10)
	fg_input_1:[3]FG_Notation = {._5,._NULL,._NULL}
	fg_input_2:[3]FG_Notation = {._5,._NULL,._NULL}

	input_ptrs := [PlayerNumber]^[3]FG_Notation{ .One = &fg_input_1, .Two = &fg_input_2}
	player_ptrs := [PlayerNumber]^PlayerData{.One = &p1_data, .Two = &p2_data}


	@static hitbox_data:HitboxData = {{.One = {}, .Two = {}}}


	@static accel_data:AccelerationData = {
		{.One = 0, .Two = 0},
		false,
		false,
	}

	for player, idx in player_ptrs {
		using player
		playerGamepad := player.p_num == .One ? w4.GAMEPAD1^ : w4.GAMEPAD2^
		buttons_to_fg_notation_set(playerGamepad, input_ptrs[p_num], p_num)
		debug_fg_note_display(input_ptrs[p_num], player)
		buffered_move = fg_notation_to_move(input_ptrs[p_num])
		if(player.state == ._Idle){
			update_idle_player_with_move(player)
		}
		apply_move_state(player, &accel_data, &hitbox_data)
		advance_animation(player)
	}
	apply_accel(&player_ptrs, &accel_data)
	for player in player_ptrs {
		for x in hitbox_data.hitboxes[player.p_num] {
			draw_hitbox(player, x)
		}
	}

	draw_rects()
	// draw_hitbox(.One, {0,0},{3,4})
}