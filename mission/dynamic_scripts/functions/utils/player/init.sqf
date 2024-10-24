[player, {
	params ["_res", "_player"];

	private _arr = parseSimpleArray _res;

	(format ["Server returned player: %1", _arr]) call A3RE_M_fnc_logServer;

	missionNamespace setVariable [format ["rotr_player_%1", getPlayerUID _player], _arr];
}] call A3RE_M_fnc_getPlayer;

private _isLoaded = [{
	private _player = _this call utils_player_get;
	!isNil "_player"
}, player, 10, {
	params ["_res", "_async", "_args"];
	private _kick_enabled = false;

	if (!_res) then {
		["Please register your SteamID in our Discord by using command /player bind", "Failed to find player"] call BIS_fnc_guiMessage;

		if (_kick_enabled) then {
			(findDisplay 46) closeDisplay 0;
		}
	}
}, false] call A3RE_M_fnc_waitFor;