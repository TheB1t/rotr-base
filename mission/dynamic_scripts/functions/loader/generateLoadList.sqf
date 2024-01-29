_modules = [
	"utils", 
	"zeus", 
	"teleports", 
	"credits", 
	"arc", 
	"rc", 
	"medical"
];

_scripts = [
	"chatCommands",
	"medMenu",
	"playerLoad",
	"playerSave",
	"rank",
	"weaponHand"
];

_loadList = [];

{
	private _funcName = format ["%1_getDepList", _x];

	_funcName call A3RE_M_fnc_loadFunction;

	private _list = [_funcName, []] call A3RE_M_fnc_call;
	if (typeName _list == "ARRAY") then {
		_loadList append _list;
	} else {
		diag_log format ["Failed to get dep list for %1", _x];
	};
} forEach _modules;

{
	_loadList pushBack [_x, true, true];
} forEach _scripts;

missionNamespace setVariable ["loadList", _loadList];