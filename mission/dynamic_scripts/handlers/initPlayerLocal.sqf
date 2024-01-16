params ["_player", "_didJIP"];
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

private _init_sequence = [
	["zeus_verify",		_player, true],
	["zeus_stats_init",		[]],

	["credits_init",		[]],
	["credits_show",		[], true],

	["script_chatCommands",	[], true],
	["script_medMenu",		[], true],
	["script_playerSave",	[], true],
	["script_weaponHand",	[], true],

	["script_rank",		_player]
];

{
	_x call A3RE_M_fnc_call;
} forEach _init_sequence;