_playerUID = getPlayerUID _this;

private _zeusEntryPos	= zeusUsers findIf { (_x select 0) == _playerUID };
private _hasFLsuffix	= '[FL]' call utils_player_hasInName;

if (_zeusEntryPos != -1) then {
	private _zeus = zeusUsers select _zeusEntryPos;
	_zeus params ["_uid", "_canThrowOut", "_isIventolog", "_realName"];

	if (!_hasFLsuffix && _isIventolog) then {
		"Sign in as iventolog for use Zeus" call chat_logLocal;
	} else {
		_this call zeus_add;
	};
};