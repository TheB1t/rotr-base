_load = {
	params ["_parameter_name", "_expected_type", "_code"];

	_parameter = (profileNamespace getVariable _parameter_name);
	if (typeName _parameter == _expected_type) then {
		_parameter call _code;
	};
};

_load_string = {
	params ["_parameter_name", "_code"];
	[_parameter_name, "STRING", _code] call _load;
};

_load_array = {
	params ["_parameter_name", "_code"];
	[_parameter_name, "ARRAY", _code] call _load;
};

_addItem = {
	player addItem _this;
	player assignItem _this;
};

_addWeapon = {
	player addWeapon (_this select 0 param [0, ""]);
	{
		player addSecondaryWeaponItem (_x param [0, ""]);
	} forEach _this;
};

["saved_uniform",			{ player forceAddUniform _this;		}] call _load_string;
["saved_vest",				{ player AddVest _this;				}] call _load_string;
["saved_backpack",			{ player addBackpack _this;			}] call _load_string;

["saved_headgear",			{ player addHeadgear _this;			}] call _load_string;
["saved_goggles",			{ player addGoggles _this;			}] call _load_string;
["saved_hmd",				{ player addWeapon _this;			}] call _load_string;
["saved_binocular",			{ player addWeapon _this;			}] call _load_string;
["saved_binocularMagazine", { player addBinocularItem _this;	}] call _load_string;

["saved_map",				_addItem] call _load_string;
["saved_gps",				_addItem] call _load_string;
["saved_radio",				_addItem] call _load_string;
["saved_compass",			_addItem] call _load_string;
["saved_watch", 			_addItem] call _load_string;

["saved_uniform_items",		{{ player addItemToUniform _x;	} forEach _this;	}] call _load_array;
["saved_vest_items",		{{ player addItemToVest _x;		} forEach _this;	}] call _load_array;
["saved_backpack_items",	{{ player addItemToBackpack _x;	} forEach _this;	}] call _load_array;

["saved_primary_weapon",	_addWeapon] call _load_array;
["saved_secondary_weapon",	_addWeapon] call _load_array;
["saved_handgun_weapon",	_addWeapon] call _load_array;