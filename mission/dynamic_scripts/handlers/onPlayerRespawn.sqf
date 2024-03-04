params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

removeAllActions _newUnit;
removeAllActions _oldUnit;

private _reinit_sequence = [
	["chat_initChannels", 	[_newUnit, _oldUnit], true],

	["zeus_verify",			_newUnit],
	["utils_player_load",	_newUnit],
	["arc_init",			[], true]
];

{
	_x call A3RE_M_fnc_call;
} forEach _reinit_sequence;