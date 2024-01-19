params ["_sector", "_system", "_planet"];

_dayTime = [daytime] call BIS_fnc_timeToString;
_newLine = ["","<br/>"];

[
	[
		[format	["Сектор %1, Система %2", _sector, _system],				"size = '0.7'"], _newLine,
		[format ["Планета %1, Местное время %2", _planet, str _dayTime],	"size = '0.7'"], _newLine,
	],
	safeZoneX / 45.5, safeZoneH / 2, true, "<t font='PuristaBold'>%1</t>", [], {false}, true
] spawn BIS_fnc_typeText2;