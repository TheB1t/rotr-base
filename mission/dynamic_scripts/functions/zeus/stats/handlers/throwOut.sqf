params ["_control"];

_zeus = zeusUsers select {	(_x select 0) == (getPlayerUID player) && (_x select 1)	};

if (count _zeus > 0) then {
	_display	= findDisplay 312;
	_ctrl		= _display displayCtrl 69696;

	_active_curators = missionNamespace getVariable ["active_curators", []];
	_selected = _active_curators select ctCurSel _ctrl;
	_selected params ["_player", "_machine"];

	if (_machine < 2) exitWith {
		"Error: Bad machine id!" call chat_logLocal;
	};

	_user = (_zeus select 0);

	[_user select 2, {
		waitUntil { !isNull (findDisplay 312) };

		(findDisplay 312) closeDisplay 1;

		(format ["%1 выкинул вас из интерфейса Zeus", _this]) call chat_logLocal;
	}] remoteExec ["spawn", _machine];
} else {
	"You have no right to do this (throw out of Zeus)" call chat_logLocal;
};