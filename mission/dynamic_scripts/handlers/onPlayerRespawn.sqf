params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

removeAllActions _newUnit;
removeAllActions _oldUnit;

private _reinit_sequence = [
	["zeus_verify",		_newUnit],
	["script_playerLoad",	[]],
	["arc_init",			[], true],
	["rc_init",				[], true]
];

{
	_x call A3RE_M_fnc_call;
} forEach _reinit_sequence;