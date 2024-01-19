_save = {
	params ["_parameter_name", "_code", ["_args", []]];

	_value = _args call _code;
	profileNamespace setVariable [_parameter_name, _value];
};

_saveItems = {
	params ["_parameter_name", "_items", "_types"];

	[_parameter_name, {
		params ["_items", "_types"];
		_items select {
			_type = (_x call BIS_fnc_itemType) select 1;
			_type in _types;
		} param [0, ""];
	}, [_items, _types]] call _save;
};

_saveAssignedItems = {
	params ["_parameter_name", "_types"];
	[_parameter_name, assignedItems player, _types] call _saveItems;
};

_saveWeaponsItems = {
	params ["_parameter_name", "_types"];
	[_parameter_name, weaponsItems player, _types] call _saveItems;
};

["saved_uniform",			{ uniform player;				}] call _save;
["saved_uniform_items",		{ uniformItems player;			}] call _save;

["saved_vest",				{ vest player;					}] call _save;
["saved_vest_items",		{ vestItems player;				}] call _save;

["saved_backpack",			{ backpack player;				}] call _save;
["saved_backpack_items",	{ backpackItems player;			}] call _save;

["saved_headgear",			{ headgear player;				}] call _save;
["saved_goggles",			{ goggles player;				}] call _save;
["saved_hmd",				{ hmd player;					}] call _save;
["saved_binocular",			{ binocular player;				}] call _save;
["saved_binocularMagazine",	{ binocularMagazine player;		}] call _save;

["saved_map",				["Map"]							] call _saveAssignedItems;
["saved_gps",				["GPS", "UAVTerminal"]			] call _saveAssignedItems;
["saved_radio",				["Radio"]						] call _saveAssignedItems;
["saved_compass",			["Compass"]						] call _saveAssignedItems;
["saved_watch",				["Watch"]						] call _saveAssignedItems;

["saved_primary_weapon",	["Rifle", "SniperRifle", "AssaultRifle", "MachineGun", "Shotgun", "SubmachineGun"]	] call _saveWeaponsItems;
["saved_secondary_weapon",	["Launcher", "RocketLauncher", "MissileLauncher", "GrenadeLauncher", "Cannon"]		] call _saveWeaponsItems;
["saved_handgun_weapon",	["Handgun"]																			] call _saveWeaponsItems;

systemChat "Снаряжение сохранено";
saveProfileNamespace;