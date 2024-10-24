params ["_obj", "_req"];

(format ["Test %1 | %2", _obj, _req]) call A3RE_M_fnc_logServer;
private _player = _obj call utils_player_get;

if (isNil "_player") exitWith { false };

private _perms = _player select 3;
private _ret = true;

for "_i" from 0 to ((count _req) - 1) do {
	private _perm_index = _req select _i;
	private _perm = _perms select _perm_index;

	(format ["Perm [%1]: %2", _perm_index, _perm]) call A3RE_M_fnc_logServer;

	if (_perm_index >= count _perms || !_perm) then { 
		_ret = false;
	};
};

_ret