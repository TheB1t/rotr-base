params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

private _reinit_sequence = [
	["zeus_verify",		_newUnit],
	["script_playerSave",	[]],
	["arc_init",			[]]
];

{
	_x call A3RE_M_fnc_call;
} forEach _reinit_sequence;