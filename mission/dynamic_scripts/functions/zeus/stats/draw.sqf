if (isServer) exitwith {};

disableSerialization;

_active_curators = missionNamespace getVariable ["active_curators", []];

if (player in _active_curators) then {
	waitUntil { !isNull (findDisplay 312) };

	_display	= findDisplay 312;
	_ctrl		= _display displayCtrl 69696;

	if (_ctrl isEqualTo controlNull) then {
		_ctrl = _display ctrlCreate ["ROTR_ActiveZeusList", 69696];
	} else {
		ctClear _ctrl;
	};

	ctAddHeader _ctrl params ["_ind", "_header"];
	_header params ["_ctrlHeaderBackground", "_ctrlDescription", "_ctrlKickButton"];

	_ctrlHeaderBackground	ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.5];
	_ctrlDescription		ctrlSetText "Активные зевсы";
	_ctrlKickButton			ctrlSetText "Разлогинить";
	_ctrlKickButton			setVariable ["root", _ctrl];

	_ctrlKickButton ctrlAddEventHandler ["ButtonClick", {
		params ["_control"];

		if (stats_disableKick) then {
			systemChat "Kick functionality disabled, contact with Bit for more information.";
		} else {
			_root = _control getVariable "root";
			_active_curators = missionNamespace getVariable ["active_curators", []];
			_selected = _active_curators select ctCurSel _root;

			[[], {
				waitUntil { !isNull (findDisplay 312) };

				_display = findDisplay 312;
				_display closeDisplay 1;
			}] remoteExec ["spawn", owner _selected];
		};
	}];

	{
		ctAddRow _ctrl params ["_ind", "_row"];
		_row params ["_ctrlBackground", "_ctrlName", "_ctrlUID"];

		_ctrlBackground	ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.3];
		_ctrlName		ctrlSetText name _x;
		_ctrlUID		ctrlSetText getPlayerUID _x;
	} forEach _active_curators;

	_ctrl ctSetCurSel 0;

	_ctrl ctrlCommit 0;
}