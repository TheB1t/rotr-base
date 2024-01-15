if (isServer) exitwith {};

_active_curators = missionNamespace getVariable ["active_curators", []];

if (player in _active_curators) then {
	_str = "<t color='#00FF00'>Активные зевсы:</t>";
	{
		_name = format ["%1 (%2)", name _x, getPlayerUID _x];
		_str = format["%1 <br/> %2", _str, _name];
	} forEach _active_curators;

	hintSilent parseText _str;
} else {
	hintSilent "";
};