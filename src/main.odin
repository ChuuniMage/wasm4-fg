package main

DEBUGGING :: false

import "w4"
import "core:unicode/utf8"
import "core:runtime"

DefaultPalette:[4]u32

Player :: enum {One, Two,}

FG_Notation :: enum {_1,_2,_3,_4,_5,_6,_7,_8,_9,_P,_G,_NULL}

FG_Input :: [3]FG_Notation

buttons_to_fg_notation_set :: proc(btns:w4.Buttons, fg_input:^FG_Input) {
	using FG_Notation

	input_matrix := [3][3]FG_Notation{
		{._7, ._8, ._9}, 
		{._4, ._5, ._6},
		{._1, ._2, ._3}}

	selection := [2]u32{1,1};
	if .UP in btns {selection[0] = selection[0] - 1}
	if .DOWN in btns {selection[0] = selection[0] + 1}
	if .LEFT in btns {selection[1] = selection[1] - 1}
	if .RIGHT in btns {selection[1] = selection[1] + 1}

	fg_input[0] = input_matrix[selection[0]][selection[1]]
	
	if .B in btns {fg_input[1] = ._P} else {fg_input[1] = ._NULL}
	if .A in btns {fg_input[2] = ._G} else {fg_input[2] = ._NULL}
};

DEBUG_fg_note_to_rune :: proc(fgi:FG_Notation) -> rune {
	switch(fgi){
		case ._1: return '1'
		case ._2: return '2'
		case ._3: return '3'
		case ._4: return '4'
		case ._5: return '5'
		case ._6: return '6'
		case ._7: return '7'
		case ._8: return '8'
		case ._9: return '9'
		case ._P: return 'P'
		case ._G: return 'G'
		case ._NULL: return ' '
		case: return ' '
	}
}

debug_fg_note_display :: proc (fg_input:^[3]FG_Notation) {
	bs, w := utf8.encode_rune(DEBUG_fg_note_to_rune(fg_input[0]))
	dir_str := string(bs[:w])
	bs_1, w_1 := utf8.encode_rune(DEBUG_fg_note_to_rune(fg_input[1]))
	p_str := string(bs_1[:w_1])
	bs_2, w_2 := utf8.encode_rune(DEBUG_fg_note_to_rune(fg_input[2]))
	g_str := string(bs_2[:w_2])
	w4.text(dir_str, 10, 20)
	w4.text(p_str, 18, 20)
	w4.text(g_str, 26, 20)
}

anim_idle_5 :: proc (x, y: i32) {
	w4.rect(x, y, 8, 8 * 3)
}

anim_idle_2 :: proc (x, y: i32) {
	w4.rect(x, y + 8, 8, 8 * 2)
}

anim_5P :: proc (x, y: i32) {
	w4.rect(x, y, 8, 8 * 3)
	w4.rect(x + 8, y, 8, 8)
}

anim_2P :: proc (x, y: i32) {
	w4.rect(x, y+8 , 8, 8 * 2)
	w4.rect(x+8, y + 8, 8, 8)
}

anim_6P :: proc (x, y: i32) {
	w4.rect(x, y, 8, 8 * 3)
	w4.rect(x+8, y + 8, 8, 8)
}

draw_rects :: proc () {
	prev_draw_colours := w4.DRAW_COLORS^
	defer{w4.DRAW_COLORS^ = prev_draw_colours}

	w4.DRAW_COLORS^ = 0x4
	w4.rect(50, 78+32, 55, 40)

	w4.DRAW_COLORS^ = 0x0
	anim_2P(44,80 + 32)

	w4.DRAW_COLORS^ = 0x1
	anim_2P(44 + 16,80 + 32)

	w4.DRAW_COLORS^ = 0x2
	anim_2P(44 + 32,80 + 32)

	w4.DRAW_COLORS^ = 0x3
	anim_2P(44 + 48,80 + 32)

	w4.DRAW_COLORS^ = 0x4
	anim_2P(44 + 64,80 + 32)
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

atk_details_5P:AttackDetails

atk_details_2P:AttackDetails 

atk_details_6P:AttackDetails 

attack_array: [Movelist]AttackDetails

player_data:PlayerData


Movelist :: enum {
	_5P,
	_2P,
	_6P,
	_IDLE_5,
	_IDLE_2,
	_MOVE_FORWARD,
	_MOVE_BACKWARD,
}

MoveAnimations: [Movelist]proc(x, y:i32)

Point :: struct {
	x:i32,
	y:i32,
}

PlayerData :: struct {
	point:Point,
	stance:PlayerStance,
	state:PlayerState,
	current_anim:^proc(x, y:i32),
	current_move:Movelist,
	anim_duration:u32,
	buffered_move:Movelist,
	current_colour:u32,
}

StateColoursArray:[PlayerState]u32

@export
start :: proc "c" () {
	//Global stuff MUST be initialised here, or else will be null at runtime because wasm
	context = runtime.default_context()
	//0 = foreground, 1 = background, 2 = p1, 3 = p2
	//TODO: set global consts for foreground, background, p1, p2 indices for palette
	DefaultPalette = {0xe0f8cf, 0x86c06c, 0x306850, 0x071821}
	StateColoursArray = {
		._Idle = 0x306850,
		._Startup = 0xde8d31,
		._Active = 0xd62f2f,
		._Recovery = 0x393ed4,
		._Blocking = 0x3285a8,
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

	MoveAnimations = [Movelist]proc(x, y:i32){
		._5P = anim_5P, 
		._2P = anim_2P, 
		._6P = anim_6P,
		._IDLE_5 = anim_idle_5, 
		._IDLE_2 = anim_idle_2,
		._MOVE_BACKWARD = anim_idle_5,
		._MOVE_FORWARD = anim_idle_5,
	}

	for atk in &attack_array {
		atk.total_duration = atk.startup + atk.active + atk.recovery
	}
	player_data = {
		point = {x = 18, y = 80},
		current_anim = &MoveAnimations[._IDLE_5],
		buffered_move = ._IDLE_5,
		stance = .Standing,
		state = ._Idle,
		anim_duration = 1,
		current_colour = DefaultPalette[3],
	}
	
}


advance_animation :: proc (player:^PlayerData) {
	//Will do more stuff here
	using player
	w4.DRAW_COLORS^ = 3 // Set the player colour to be drawn
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
	w4.PALETTE[2] = StateColoursArray[player.state]
	MoveAnimations[player.current_move](point.x, point.y)
	w4.tracef("Anim duration: %f",  f64(anim_duration))
}

update_idle_player_with_move :: proc (player:^PlayerData){
	using player
	w4.trace("before move to anim")
	current_move = buffered_move

	switch(buffered_move){
		case ._MOVE_BACKWARD: 
			stance = .Standing
			state = ._Moving
			anim_duration = 2
		case ._MOVE_FORWARD: 
			stance = .Standing
			state = ._Moving
			anim_duration = 2
		case ._IDLE_5: 
			stance = .Standing
			state = ._Idle
			anim_duration = 2
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
	}
	w4.PALETTE[2] = StateColoursArray[state]
}

fg_notation_to_move :: proc (fg_input: ^[3]FG_Notation) ->  Movelist {
	using FG_Notation
	using Movelist
	move:Movelist

	#partial switch(fg_input[0]){
		case ._1, ._2, ._3: move = fg_input[1] == ._P ? ._2P : ._IDLE_2
		case ._5: move =  fg_input[1] == ._P ? ._5P : ._IDLE_5
		case  ._4: move = fg_input[1] == ._P ? ._5P : ._MOVE_BACKWARD
		case ._6: move =  fg_input[1] == ._P ? ._6P : ._MOVE_FORWARD
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

apply_move_state :: proc (player:^PlayerData) {
	using player
	#partial switch(current_move){
		case ._MOVE_FORWARD: point.x = point.x == 160 - 16 ? point.x : point.x + 1
		case ._MOVE_BACKWARD: point.x = point.x == 0 ? point.x : point.x - 1
		case ._5P: {} // draw_hitboxes_based_on_anim_duration?
	}
}

@export
update :: proc "c" () {
	context = runtime.default_context()
	w4.DRAW_COLORS^ = 2 
	w4.text("FG4 QQrgtest!", 10, 10)
	fg_input:[3]FG_Notation = {._5,._NULL,._NULL}
	buttons_to_fg_notation_set(w4.GAMEPAD1^, &fg_input)
	debug_fg_note_display(&fg_input)
	player_data.buffered_move = fg_notation_to_move(&fg_input)

	if(player_data.state == ._Idle){
		update_idle_player_with_move(&player_data)
	}
	apply_move_state(&player_data)
	advance_animation(&player_data)

	draw_rects()
}