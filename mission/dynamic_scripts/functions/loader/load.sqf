private _loadList = missionNamespace getVariable ["loadList", nil];

{
	_x params ["_name", "_isShared", "_isScript"];

	if (_isScript) then {
		_name call A3RE_M_fnc_loadScript;
	} else {
		_name call A3RE_M_fnc_loadFunction;
	};
} forEach _loadList;