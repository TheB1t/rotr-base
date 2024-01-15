_index = getPlayerUID _this;
_dedman = format["dedman%1", _index];

[_dedman, _this] call {
	params ["_name", "_player"];
	missionNamespace setVariable [_name, _player, true];

	[_name] remoteExec ["zeus_process", 2];

	[{
		_index = getPlayerUID player;
		_dedman = format["dedman%1", _index];
		if (!isNil _dedman) then {
			systemChat format ["Zeus added to player %1", _this];
		};
	}, name _player] remoteExec ["spawn", 0];
};