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
	0b0000001110000000,
	0b0000011111000000,
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

f_walk_0 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
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
	0b0001111000111111,
	0b0001111000111111,
	0b0001111100000000,
	0b0001111100000000,
}

f_walk_2 := [32]u16be {
	0b0000011100000000,
	0b0000111110000000,
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
	0b0000001110000000,
	0b0000011111000000,
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
	0b0000111111011000,
	0b0000000000111110,
	0b0000111111111111,
	0b0111011110001111,
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
	0b0000000011100000,
	0b0000000111110000,
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
	0b0111011110001111,
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
	0b0000000011100000,
	0b0000000111110000,
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
	0b0000111111011111,
	0b0111011111001111,
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
	0b0000000111000000,
	0b0000001111100000,
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
	0b0000000111000000,
	0b0000001111100000,
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
	0b0000001110000000,
	0b0000011111000000,
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
	0b0000111111111110,
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
	0b0001110000000000,
	0b0011111000000000,
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
	0b0000111111111111,
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
punch_5p_anim_extra_heights: [2]u32
punch_5p_anim_extra_widths: [2]u32
punch_5p_anim_extra_offsets: [2]Point

punch_2p_anim_array: [4][32]u16be

punch_6p_anim_array: [5][32]u16be

animationArrays: [Movelist][][32]u16be


DefaultPalette:[4]u32

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
	offset:i32 = player.number == PlayerNumber.One ? 0 : 80

	for input, idx in fg_input {
		bs, w := utf8.encode_rune(DEBUG_fg_note_to_rune_array[fg_input[idx]])
		str := string(bs[:w])
		w4.text(str, 10 + offset + (i32(idx) * 8) , 20)
	}
}

RunningAnimation :: struct {
	counter:u8,
	idx:u8,
}

AnimationFrameData :: struct {
	frames:[][32]u16be,
	durations:[]u32,
}

anim_idle_5 :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40

	using player.current_anim
	if player.previous_move != ._IDLE_5 {idx = 0}
	counter += 1;
	anim_idle_lengths := [4]int{30,30,30,5}
	idle_anim_threshold := anim_idle_lengths[idx]

	if (counter == idle_anim_threshold){
		counter = 0
		idx = idx == (len(anim_array) - 1) ? 0 : idx + 1
	}

	w4.blit(cast(^u8)(&anim_array[idx][0]), point.x, point.y, 16, 32, player_blit)
}

anim_walk_f :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40

	using player.current_anim
	if player.previous_move != ._MOVE_FORWARD {idx = 0}

	counter += 1;
	anim_walk_f_lengths := [4]int{7,7,7,7}
	walk_f_anim_threshold := anim_walk_f_lengths[idx]
	if (counter == walk_f_anim_threshold){
		counter = 0
		idx = idx == (len(anim_array) - 1) ? 0 : idx + 1
	}

	w4.blit(cast(^u8)(&anim_array[idx][0]), point.x, point.y, 16, 32, number == .Two ? {.FLIPX} : nil)
}

anim_walk_b :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40

	using player.current_anim
	if player.previous_move != ._MOVE_BACKWARD {idx = 0}
	counter += 1;

	anim_walk_b_lengths := [4]int{8,8,8,8}
	walk_b_anim_threshold := anim_walk_b_lengths[idx]

	if (counter == walk_b_anim_threshold){
		counter = 0
		idx = idx == (len(anim_array) - 1) ? 0 : idx + 1
	}
	w4.blit(cast(^u8)(&anim_array[idx][0]), point.x, point.y, 16, 32, player_blit)
}

anim_idle_2 :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40
	w4.blit(cast(^u8)(&anim_array[0]), point.x, point.y, 16, 32, player_blit)
}

anim_5G :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40
	w4.blit(cast(^u8)(&anim_array[0]), point.x, point.y, 16, 32, player_blit)
}

anim_2G :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40
	w4.blit(cast(^u8)(&anim_array[0]), point.x, point.y, 16, 32, player_blit)
}

anim_5P :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40

	using player.current_anim
	counter += 1;
	anim_5P_lengths := [4]int{5,6,7,9}
	punch_anim_threshold := anim_5P_lengths[idx]

	if (counter == punch_anim_threshold){
		counter = 0
		idx = idx == (len(anim_array) - 1) ? 0 : idx + 1
	}
	w4.blit(cast(^u8)&anim_array[idx][0], point.x, point.y, 16, 32, player_blit)

	switch (idx){
		case 1, 3: 
			w4.blit(cast(^u8)&punch_5p_anim_extra[0][0], 
				i32(point.x + (number == .One ? 16 : -2)), 
				i32(punch_5p_anim_extra_offsets[0].y + point.y), 
				punch_5p_anim_extra_widths[0], 
				punch_5p_anim_extra_heights[0], player_blit)

		case 2:
			w4.blit(cast(^u8)&punch_5p_anim_extra[1][0], 
				i32(point.x + (number == .One ? 16 : -5)), 
				i32(punch_5p_anim_extra_offsets[1].y + point.y), 
				punch_5p_anim_extra_widths[1], 
				punch_5p_anim_extra_heights[1], player_blit)
	}
}

anim_2P :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40

	using player.current_anim
	counter += 1;
	anim_2P_lengths := [4]int{5,6,6,16}
	punch_2P_anim_threshold := anim_2P_lengths[idx]

	if (counter == punch_2P_anim_threshold){
		counter = 0
		idx = idx == (len(anim_array) - 1) ? 0 : idx + 1
	}

	w4.blit(cast(^u8)&anim_array[idx][0], point.x, point.y, 16, 32, player_blit)

	switch (idx){
		case 2:
			w4.blit(cast(^u8)&punch_5p_anim_extra[1][0], 
				i32(point.x + (number == .Two ? -5 : 16)), 
				i32(15 + point.y), 
				punch_5p_anim_extra_widths[1], 
				punch_5p_anim_extra_heights[1], player_blit + {.FLIPY})
	}
}

anim_6P :: proc (using player:^PlayerData, anim_array:[][32]u16be) {
	player_blit:w4.Blit_Flags = number == .Two ? {.FLIPX} : nil
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 0x30 : 0x40

	using player.current_anim
	anim_6P_lengths := [5]int{6, 7, 13, 6, 4}
	punch_6P_anim_threshold := anim_6P_lengths[idx]
	counter += 1

	if (counter == punch_6P_anim_threshold){
		counter = 0
		idx = idx == (len(anim_array) - 1) ? 0 : idx + 1
	}

	w4.blit(cast(^u8)&anim_array[idx][0], point.x, point.y, 16, 32, player_blit)

	switch (idx){
		case 2, 3:
			w4.blit(cast(^u8)&elbow_1_extra[0], i32(point.x - (player.number == .One ? 5 : -16)), i32(point.y + 23), 5, 9, player_blit)
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
		// Throwing,
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

MoveAnimations: [Movelist]proc(player:^PlayerData, anim_array:[][32]u16be)

Point :: struct {
	x:i32,
	y:i32,
}

PlayerAnimData :: struct {
	counter:int,
	idx:int,
}

PlayerData :: struct {
	number:PlayerNumber,
	point:Point,
	stance:PlayerStance,
	state:PlayerState,
	current_anim:PlayerAnimData,
	previous_move:Movelist,
	current_move:Movelist,
	anim_duration:u32,
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

	idle_anim_array = {idle_stand_0, idle_stand_1, idle_stand_2, idle_stand_3}
	idle_anim_data = {
		frames = {idle_stand_0, idle_stand_1, idle_stand_2, idle_stand_3},
		durations = {8,8,8,8},
	}

	walk_f_anim_array = {f_walk_0, f_walk_1, f_walk_2, idle_stand_0}
	walk_f_anim_data = {
		frames = {f_walk_0, f_walk_1, f_walk_2, idle_stand_0},
		durations = {8,8,8,8},
	}

	walk_b_anim_array = {f_walk_0, b_walk_1, f_walk_2, idle_stand_0}
	walk_b_anim_data = {
		frames = {f_walk_0, b_walk_1, f_walk_2, idle_stand_0},
		durations = {7,7,7,7},
	}

	punch_5p_anim_array = [4][32]u16be{punch_0, punch_1, punch_2, punch_1}
	punch_5p_anim_extra = [2][]u8{punch_1_extra, punch_2_extra}
	punch_5p_anim_extra_heights = [2]u32{5,4}
	punch_5p_anim_extra_widths = [2]u32{2,5}
	punch_5p_anim_extra_offsets = [2]Point{{x = 16, y = 7,}, { x = 16, y = 6}}

	punch_2p_anim_array = [4][32]u16be{crouch_punch_0, crouch_punch_1, crouch_punch_2, crouch_punch_1}
	punch_6p_anim_array = [5][32]u16be{punch_0, elbow_0, elbow_1, elbow_2, elbow_3}

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
	//0 = foreground, 1 = background, 2 = p1, 3 = p2
	//TODO: set global consts for foreground, background, p1, p2 indices for palette
	DefaultPalette = {0xe0f8cf, 0x86c06c, 0x306850, 0x071821}
	StateColoursArray = {
		._Idle = 0x306850,
		._Startup = 0xde8d31,
		._Active = 0xd62f2f,
		._Recovery = 0x393ed4,
		._Blocking = 0x20bed6,
		._Moving = 0x32a848,
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


	// using sprites
	animationArrays = [Movelist][][32]u16be{
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

	MoveAnimations = [Movelist]proc(player:^PlayerData, anim_array:[][32]u16be){
		._5P = anim_5P, 
		._2P = anim_2P, 
		._6P = anim_6P,
		._IDLE_5 = anim_idle_5, 
		._IDLE_2 = anim_idle_2,
		._MOVE_BACKWARD = anim_walk_b,
		._MOVE_FORWARD = anim_walk_f,
		._5G = anim_5G,
		._2G = anim_2G,
	}


	for atk in &attack_array {
		atk.total_duration = atk.startup + atk.active + atk.recovery
	}
	p1_data = {
		number = PlayerNumber.One,
		point = {x = 18, y = 70},
		current_anim = {0, 0},
		previous_move = ._IDLE_5,
		buffered_move = ._IDLE_5,
		stance = .Standing,
		state = ._Idle,
		anim_duration = 1,
		current_colour = DefaultPalette[3],
	}

	p2_data = {
		number = PlayerNumber.Two,
		point = {x = 160-18, y = 70},
		current_anim = {0, 0},
		previous_move = ._IDLE_5,
		buffered_move = ._IDLE_5,
		stance = .Standing,
		state = ._Idle,
		anim_duration = 1,
		current_colour = DefaultPalette[3],
	}
	
}


advance_animation :: proc (using player:^PlayerData) {
	
	w4.DRAW_COLORS^ = player.number == PlayerNumber.One ? 3 : 4 // Set the player colour to be drawn
	if(state != ._Idle && state != ._Moving && state != ._Blocking){
		
		atk:AttackDetails = attack_array[current_move]
		using atk;
		full_attack_length := startup + active + recovery
		active_period := startup + active
		current_attack_frame := full_attack_length - anim_duration 

		switch {
			case current_attack_frame <= startup:
				player.state = ._Startup
			case current_attack_frame <= active_period:
				player.state = ._Active 
			case:
				player.state = ._Recovery
		}
	}
	if (anim_duration == 0){
		player.state = ._Idle
		update_idle_player_with_move(player)
	} 
	anim_duration = anim_duration - 1;
	w4.PALETTE[player.number == PlayerNumber.One ? 2 : 3] = StateColoursArray[player.state]
	MoveAnimations[current_move](player, animationArrays[current_move])
	w4.tracef("Anim duration: %f",  f64(anim_duration))
}

update_idle_player_with_move :: proc (using player:^PlayerData){
	previous_move = current_move
	current_move = buffered_move

	switch(buffered_move){
		case ._MOVE_BACKWARD: 
			stance = .Standing
			state = ._Moving
			anim_duration = 1
			if (previous_move == ._MOVE_BACKWARD){
				w4.PALETTE[player.number == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
		case ._MOVE_FORWARD: 
			stance = .Standing
			state = ._Moving
			anim_duration = 2
			if (previous_move == ._MOVE_FORWARD){
				w4.PALETTE[player.number == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
		case ._IDLE_5: 
			stance = .Standing
			state = ._Idle
			anim_duration = 2
			if (previous_move == ._IDLE_5){
				w4.PALETTE[player.number == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
				return
			}
		case ._IDLE_2: 
			stance = .Crouching
			state = ._Idle
			anim_duration = 2
		case ._5P: 
			stance = .Standing
			state = ._Startup
			anim_duration = attack_array[buffered_move].total_duration
		case ._2P: 
			stance = .Crouching
			state = ._Startup
			anim_duration = attack_array[buffered_move].total_duration
		case ._6P: 
			stance = .Standing
			state = ._Startup
			anim_duration = attack_array[buffered_move].total_duration
		case ._5G: 
			stance = .Standing
			state = ._Blocking
		case ._2G: 
			stance = .Crouching
			state = ._Blocking
	}
	player.current_anim.counter = 0
	player.current_anim.idx = 0
	w4.PALETTE[player.number == PlayerNumber.One ? 2 : 3] = StateColoursArray[state]
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

apply_move_state :: proc (using player:^PlayerData) {
	atk:AttackDetails = attack_array[current_move]
	using atk;
	full_attack_length := startup + active + recovery
	current_attack_frame := full_attack_length - anim_duration 

	add_diff :=  proc(x:i32, diff:i32) -> i32{return x + diff}
	sub_diff := proc(x:i32, diff:i32) -> i32 {return x - diff}

	forward_offset := player.number == .One ? add_diff : sub_diff
	backward_offset := player.number == .One ? sub_diff : add_diff 

	L_screen_limit :i32 = 0
	R_screen_limit :i32 = 160 - 16

	forward_screen_limit := player.number == .One ? R_screen_limit : L_screen_limit
	backward_screen_limit := player.number == .One ? L_screen_limit : R_screen_limit

	#partial switch(current_move){
		case ._MOVE_FORWARD: point.x = point.x == forward_screen_limit ? point.x : forward_offset(point.x, 1)
		case ._MOVE_BACKWARD: 
			@static move_back_quad := 4
			if (previous_move != ._MOVE_BACKWARD) {move_back_quad = 4}
			switch {
				case move_back_quad == 4: 
					move_back_quad = 1
				case: 
					point.x = point.x == backward_screen_limit ? point.x :backward_offset(point.x, 1)
					move_back_quad += 1
			}
		case ._6P: 
			switch(current_attack_frame) {
				case 3, 4, 5: point.x = point.x == forward_screen_limit ? point.x : forward_offset(point.x, 1)
				case 11, 12, 13: point.x = point.x == forward_screen_limit ? point.x : forward_offset(point.x, 2)
				case 14: point.x = point.x == forward_screen_limit ? point.x : forward_offset(point.x, 3)
			}
		case ._5P: 
			switch(current_attack_frame) {
				case 8, 12: point.x = point.x == forward_screen_limit ? point.x : forward_offset(point.x, 1)
				case 10, 11 : point.x = point.x == forward_screen_limit ? point.x : forward_offset(point.x, 2)
			}
		
	}
}

@export
update :: proc "c" () {
	context = runtime.default_context()
	w4.DRAW_COLORS^ = 2 
	w4.text("FG4 offset!", 10, 10)
	fg_input_1:[3]FG_Notation = {._5,._NULL,._NULL}
	fg_input_2:[3]FG_Notation = {._5,._NULL,._NULL}

	input_ptrs := [2]^[3]FG_Notation{&fg_input_1, &fg_input_2}
	player_ptrs := [2]^PlayerData{&p1_data, &p2_data}

	for player, idx in player_ptrs {
		buttons_to_fg_notation_set(player.number == .One ? w4.GAMEPAD1^ : w4.GAMEPAD2^, input_ptrs[idx], player.number)
		debug_fg_note_display(input_ptrs[idx], player)
		player.buffered_move = fg_notation_to_move(input_ptrs[idx])
		if(player.state == ._Idle || player.state == ._Blocking){
			update_idle_player_with_move(player)
		}
		apply_move_state(player)
		advance_animation(player)
	}
	// Resolve conflicts 
	draw_rects()
}