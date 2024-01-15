params ["_sector", "_system"];

_dayTime = [daytime] call BIS_fnc_timeToString;
[
	[
		[format ["Сектор: %1, Система: %2", _sector, _system], "size = '0.7'"],
		["","<br/>"],
		["Местное время: ","size = '0.7'"],
		[str _dayTime,"size = '0.7'"],
		["","<br/>"]
	],
	safeZoneX / 45.5, safeZoneH / 2, true, "<t font='PuristaBold'>%1</t>", [], {false}, true
] spawn BIS_fnc_typeText2;