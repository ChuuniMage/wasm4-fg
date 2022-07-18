# Win 4 Fighter (W4F)

A fighting game game written in Odin for the [WASM-4](https://wasm4.org) fantasy console.

Play it here: https://wasm4.org/play/w4f/

W4F is a minimalistic fighting game based on the core gameplay of Virtua Fighter.
Intended exclusively for multiplayer.

Left & Right: Movement
Down: Crouch
A = Guard
B = Punch

You can hold down the attack button to attack the first frame you are able to act.
Down+Punch, Stand+Punch, Forward+Punch are all different striking attacks.
Punch+Guard executes a throw.

You can crouch under high punch, and throw.

Frame data and movelist for nerds:

    impact, active, rec		| grd, nh, ch	| b.stun, h.stun, ch stun bonus

5P| i12, +1 active, 14 rec | +2, +5, +8 | +18, +21, +3
2P| i12, +0 active, 21 rec | -5, +4, +7 | +17, +26, +3
6P| i14, +1 act, 21 rec | -5, -2, +5 | +18, +21, +7

P+G| i10, +0 1ct, 24 rec | hit advantage: +1
