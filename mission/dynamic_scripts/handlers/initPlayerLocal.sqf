params ["_player", "_didJIP"];

private _loadStart = time;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

(format ["Player (%1) %2 connected to the server", getPlayerUID _player, name _player]) remoteExec ["diag_log", 0];

"arc_redBacta" call A3RE_M_fnc_loadFunction;
"arc_stimulator" call A3RE_M_fnc_loadFunction;

"general_addAction" call A3RE_M_fnc_loadFunction;

["zeus_stats_init", []] call A3RE_M_fnc_callFunction;

["credits_show", []] call A3RE_M_fnc_callFunction;

["rank", [_player]] call A3RE_M_fnc_callScript;
["chatCommands", []] call A3RE_M_fnc_callScript;
["medMenu", []] call A3RE_M_fnc_callScript;
["playerSave", []] call A3RE_M_fnc_callScript;
["weaponHand", []] call A3RE_M_fnc_callScript;

_playerUID = getPlayerUID _player;
if (_playerUID in zeusmodule) then {
	_player call zeus_add;
};

call general_addAction;

private _loadDone = time;

systemChat format ["Loading took %1 seconds", _loadDone - _loadStart];