params ["_name", "_display_name", "_destinations"];

private _tp_name = _name call teleports_get_name;

[_tp_name, [_display_name, _destinations], true] call teleports_set_settings;
