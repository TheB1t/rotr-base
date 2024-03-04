params ["_var", "_name", "_basic", "_items"];

private _objName = format ["arsenal_%1", _var];
private _obj = missionNamespace getVariable [_objName, nil];

private _intersection = [_basic, _items] call utils_findIntersection;

if (count _intersection > 0) then {
	(format ["!!! Found intersection in arsenal %1 (%2) !!!", _name, _objName]) call A3RE_M_fnc_logServer;
	(format ["Intersected: %1", str _intersection]) call A3RE_M_fnc_logServer;
	("!!! End intersection report !!!") call A3RE_M_fnc_logServer;

	_items = _items - _intersection;
};

if (isNil "_obj") exitWith {
	(format ["Failed to initalize arsenal %1 (%2)", _name, _objName]) call A3RE_M_fnc_logServer;
};

(format ["Initializing arsenal %1 (%2)", _name, _objName]) call A3RE_M_fnc_logServer;

[_obj, _basic + _items, true] call ace_arsenal_fnc_initBox;