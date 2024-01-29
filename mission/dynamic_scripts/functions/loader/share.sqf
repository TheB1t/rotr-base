private _loadList = missionNamespace getVariable ["loadList", nil];

{
	_x params ["_name", "_isShared", "_isScript"];

	if (_isShared) then {
		if (_isScript) then {
			private _scriptName = format ["script_%1", _name];
			[_this, _scriptName] call A3RE_M_fnc_makeShared;
		} else {
			[_this, _name] call A3RE_M_fnc_makeShared;
		};
	};
} forEach _loadList;