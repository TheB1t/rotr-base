params ["_sector", "_system", "_planet"];

_dayTime = [daytime] call BIS_fnc_timeToString;
_newLine = ["","<br/>"];

[
	[
		[format	["Сектор %1", _sector],				"size = '0.7'"], _newLine,
		[format	["Система %1", _system],			"size = '0.7'"], _newLine,
		[format	["Планета %1", _planet],			"size = '0.7'"], _newLine,
		[format ["Местное время %1", str _dayTime],	"size = '0.7'"], _newLine
	],
	safeZoneX / 45.5, safeZoneH / 2, true, "<t font='PuristaBold'>%1</t>", [], {false}, true
] spawn BIS_fnc_typeText2;