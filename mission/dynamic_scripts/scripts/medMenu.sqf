disableSerialization;

_allowedItems = [
	[],
	[],
	[
		"IW_Team_Medcore",
		"IW_Team_Medcore_UAV"
	],
	[]
];

_hr_colors = [
	[0, "#8888FF"],
	[70, "#88FF88"],
	[130, "#FF8888"]
];

1005 cutRsc ["HudMedic", "PLAIN"];
_ui = uiNamespace getVariable "HudMedic";

[1, [_ui, _hr_colors, _allowedItems], {
	(_this select 1) params ["_ui", "_hr_colors", "_allowedItems"];
	_allowedItems params ["_helmets", "_goggles", "_assignedItems", "_items"];

	_is_alive			= alive player;
	_hudMedic			= _ui displayCtrl 66666;

	_is_helmet			= (headgear player) in _helmets;
	_is_goggles			= (goggles player) in _goggles;
	_is_assignedItem	= count (_assignedItems select { _x in (assignedItems player) }) > 0;
	_is_item			= count (_items select { _x in (assignedItems player) }) > 0;

	if ((_is_helmet || _is_goggles || _is_assignedItem || _is_item) && _is_alive) then {
		private _tmp = [];

		_tmp pushBack format ["<t size='1.25' color='#FFCC00' shadow='1'>%1</t><br/>", "MedCore HUD"];

		{
			_namePlayer = name _x;

			_hr1	= _x getVariable ['ACE_medical_heartrate', 0];
			_bv1	= _x getVariable ['ACE_medical_bloodVolume', 0];
			_spO2	= _x getVariable ["KAT_breathing_airwayStatus", 0];
            _hr		= (floor (_hr1 * 100)) / 100;
            _bv		= (floor (_bv1 * 100)) / 100;
            _O2		= floor _spO2;

			private _hr_color = "#FFFFFF";

			{
				_x params ["_val", "_color"];
				if (_hr >= _val) then {
					_hr_color = _color;
				}
			} forEach _hr_colors;

			_tmp pushBack format ["<t size='0.85' color='%1' shadow='1'>%2</t> | ", _hr_color, _hr];
			_tmp pushBack format ["<t size='0.85' color='#FF1111' shadow='1'>%1</t> | ", _bv];
			_tmp pushBack format ["<t size='0.85' color='#FF8888' shadow='1'>%1</t> : ", _O2];
			_tmp pushBack format ["<t size='0.85' color='#FFFFFF' shadow='1'>%1</t><br/>", _namePlayer];
        } forEach units player;

      	_hudMedic ctrlSetStructuredText parseText (_tmp joinString "");
	} else {
		_hudMedic ctrlSetStructuredText parseText "";
	};

	_hudMedic ctrlCommit 0;
}, false] call A3RE_M_fnc_addTask;