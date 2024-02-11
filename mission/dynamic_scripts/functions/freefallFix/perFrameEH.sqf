private _player = player;

if (vehicle _player != _player) exitWith {};

private _lastPlayer = missionNamespace getVariable ["LEO_FFF_lastPlayer", objNull];

if (_player != _lastPlayer) then {
	_lastPlayer setUnitFreefallHeight 100;
	_player setUnitFreefallHeight ([LEO_FFF_minHeight, 1e10] select (getPos _player select 2 < LEO_FFF_minHeight));
	LEO_FFF_lastPlayer = _player;
};

private _fallInfo = getUnitFreefallInfo _player;

if (_fallInfo#0) then {
	if (!(_fallInfo#1) && {getPos _player select 2 > LEO_FFF_minHeight}) then {
		_player setUnitFreefallHeight LEO_FFF_minHeight;
	};
} else {
	if (_fallInfo#2 < 1e9) then {
		_player setUnitFreefallHeight 1e10;
	};
};