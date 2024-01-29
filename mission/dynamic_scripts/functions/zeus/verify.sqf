_playerUID = getPlayerUID _this;

_zeus = zeusUsers select {
	(_x select 0) == _playerUID
};

if (count _zeus > 0) then {
	_this call zeus_add;
};