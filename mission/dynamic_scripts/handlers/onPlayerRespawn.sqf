params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

["playerSave", []] call A3RE_M_fnc_callScript;

_playerUID = getPlayerUID _newUnit;
if (_playerUID in zeusmodule) then {
	_newUnit call zeus_add;
};

call general_addAction;