params ["_var", "_name", "_items"];

private _objName = format ["arsenal_%1", _var];
private _obj = missionNamespace getVariable [_objName, nil];

if (isNil "_obj") exitWith {
	(format ["Failed to initalize arsenal %1 (%2)", _name, _objName]) call A3RE_M_fnc_logServer;
};

(format ["Initializing arsenal %1 (%2)", _name, _objName]) call A3RE_M_fnc_logServer;
[_obj, _items, true] call ace_arsenal_fnc_initBox;