params ["_name", "_settings", "_machine"];

private _var_name = format ["settings_%1", _name];
missionNamespace setVariable [_var_name, _settings, _machine];