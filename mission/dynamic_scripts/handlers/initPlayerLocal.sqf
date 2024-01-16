params ["_player", "_didJIP"];
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

private _loadStart = time;

private _init_sequence = [
	["zeus_verify",		_player],
	["zeus_stats_init",		[]],

	["credits_init",		[]],
	["credits_show",		[]],

	["general_addAction",	[]],

	["script_chatCommands",	[]],
	["script_medMenu",		[]],
	["script_playerSave",	[]],
	["script_weaponHand",	[]],

	["script_rank",		_player]
];

{
	_x call A3RE_M_fnc_call;
} forEach _init_sequence;

private _loadTime = time - _loadStart;

(format ["[%1] Loading took %2 seconds", name _player, _loadTime]) call A3RE_M_fnc_logServer;
(format ["Player (%1) %2 connected to the server", getPlayerUID _player, name _player]) remoteExec ["diag_log", 0];