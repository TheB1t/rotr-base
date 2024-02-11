_modules = [
	"utils", 
	"zeus", 
	"teleports", 
	"credits", 
	"arc", 
	"rc", 
	"chat",
	"arsenal",
	"freefallFix"
];

_scripts = [
	"chatCommands",
	"medMenu",
	"rank",
	"weaponHand"
];

_loadList = [];

{
	private _moduleName = _x;
	private _funcName = format ["%1_getDepList", _moduleName];

	_funcName call A3RE_M_fnc_loadFunction;

	private _list = [_funcName, []] call A3RE_M_fnc_call;
	if (typeName _list == "ARRAY") then {
		{
			_x params ["_name", "_isShared", "_isScript"];

			private _correctedName = format ["%1_%2", _moduleName, _name];
			_x set [0, _correctedName];

			_list set [_forEachIndex, _x];
		} forEach _list;

		_loadList append _list;
	} else {
		(format ["Failed to get dep list for %1", _moduleName]) call A3RE_M_fnc_logServer;
	};
} forEach _modules;

{
	_loadList pushBack [_x, true, true];
} forEach _scripts;

"Generated load list:" call A3RE_M_fnc_logServer;

{
	_x params ["_name", "_isShared", "_isScript"];

	_shared = if (_isShared) then { "SHARED" } else { "LOCAL" };
	_script = if (_isScript) then { "SCRIPT" } else { "FUNCTION" };
	(format ["	%1: (%3, %4) %2", _forEachIndex, _name, _shared, _script]) call A3RE_M_fnc_logServer;
} forEach _loadList;

missionNamespace setVariable ["loadList", _loadList];