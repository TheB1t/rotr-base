params ["_player", "_didJIP"];
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

private _init_sequence = [
	["teleports_buildAll",	[], true],
	["medical_init",		[], true],

	["zeus_verify",		_player],
	["zeus_stats_init",		[]],

	["arc_init",			[], true],
	["rc_init",				[], true],

	["credits_init",		[]],
	["credits_show",		[], true],

	["script_chatCommands",	[], true],
	["script_medMenu",		[], true],
	["script_playerLoad",	[], true],
	["script_weaponHand",	[], true],

	["script_rank",		_player]
];

{
	_x call A3RE_M_fnc_call;
} forEach _init_sequence;