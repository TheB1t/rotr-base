sleep 10;

switch (playerSide) do {
	case west:			{ [general_sector, general_system, general_planet] call credits_showPreview; };
	case resistance:	{ [general_sector, general_system, general_planet] call credits_showPreview; };
	case east:			{ [general_sector, general_system, general_planet] call credits_showPreview; };
	case civilian:		{};
};

sleep 20;

{
	_x params ["_memberFunction", "_memberNames"];

	sleep 2;

	_finalText = format ["<t size='0.55' color='#ffd700' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#ffffff' align='right'>";
	{
		_finalText = _finalText + format ["%1<br />", _x]
	} forEach _memberNames;

	_finalText = _finalText + "</t>";
	onScreenTime + (((count _memberNames) - 1) * 0.9);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (onScreenTime);
} forEach creditsLines;