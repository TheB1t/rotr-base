params ["_player", "_didJIP"];
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

private _init_sequence = [
	["teleports_buildAll",	[], true],
	["utils_medical_init",	[], true],

	["freefallFix_init",	[]],

	["chat_init", 			_player],

	["zeus_stats_init",		[]],

	["credits_init",		[]],
	["credits_show",		[], true],

	["script_medMenu",		[], true],
	["script_weaponHand",	[], true],

	["script_rank",		_player]
];

{
	_x call A3RE_M_fnc_call;
} forEach _init_sequence;

_player setVariable ['ACE_Medical_medicClass', 2];