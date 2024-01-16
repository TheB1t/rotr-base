_playerUID = getPlayerUID _this;
if (_playerUID in zeusmodule) then {
	["zeus_add", _this] call A3RE_M_fnc_call;
};