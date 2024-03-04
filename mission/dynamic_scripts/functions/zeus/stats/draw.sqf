if (isServer) exitwith {};

disableSerialization;

_active_curators = _this;

{
	_x params ["_player", "_machine"];
	if (isNull _player) then {
		private _index = _active_curators find _x;
		_active_curators deleteAt _index;
	};
} forEach _active_curators;

if ([player, clientOwner] in _active_curators) then {
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
	_ctrlKickButton			ctrlSetText "Выкинуть";
	_ctrlKickButton			ctrlAddEventHandler ["ButtonClick", zeus_stats_handlers_throwOut];

	{
		_x params ["_player", "_machine"];

		ctAddRow _ctrl params ["_ind", "_row"];
		_row params ["_ctrlBackground", "_ctrlIngameName", "_ctrlRealName", "_ctrlUID"];

		_ctrlBackground	ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.3];
		_ctrlIngameName	ctrlSetText name _player;
		_ctrlUID		ctrlSetText getPlayerUID _player;

		_zeusEntryPos	= zeusUsers findIf { (_x select 0) == getPlayerUID _player };

		if (_zeusEntryPos != -1) then {
			_zeus = zeusUsers select _zeusEntryPos;
			_zeus params ["_uid", "_canThrowOut", "_isIventolog", "_realName"];

			_ctrlRealName ctrlSetText _realName;
		} else {
			_ctrlRealName ctrlSetText "Unauthorized";
		};
	} forEach _active_curators;

	_ctrl ctSetCurSel 0;

	_ctrl ctrlCommit 0;
}