_index = getPlayerUID _this;
_dedman = format["dedman%1", _index];

[_dedman, _this] call {
	params ["_name", "_player"];
	missionNamespace setVariable [_name, _player, true];

	["zeus_process", _name] remoteExec ["A3RE_M_fnc_call", 2];

	[name _player, {
		_index = getPlayerUID player;
		_dedman = format["dedman%1", _index];
		if (!isNil _dedman) then {
			systemChat format ["Zeus added to player %1", _this];
		};
	}] remoteExec ["spawn", 0];
};