params ["_name"];

private _src = missionNamespace getVariable [_name, nil];
private _src_settings = _name call teleports_get_settings;

if (isNil "_src" || isNil "_src_settings") exitWith {
	diag_log format ["[teleport_build] Failed to find source teleport point %1", _name];
	_actions
};

{
	private _dst_name = _x call teleports_get_name;

	private _dst = missionNamespace getVariable [_dst_name, nil];
	private _dst_settings = _dst_name call teleports_get_settings;

	if (isNil "_dst" || isNil "_dst_settings") then {
		diag_log format ["[teleport_build] Failed to find destination teleport point %1", _dst_name];
		continue;
	};

	private _dst_display_name = _dst_settings select 0;
	private _dst_title = format ["Телепортироватся к %1", _dst_display_name];
	private _dst_desc = format ["Вы были телепортированы к %1", _dst_display_name];

	private _dst_pos = getPosATL _dst;
	private _dst_dir = direction _dst;
	private _dst_newPos = _dst_pos vectorAdd [1 * sin(_dst_dir), 1 * cos(_dst_dir), 0.1];

	_src addAction [_dst_title, {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_arguments params ["_dst_pos", "_dst_desc"];

		_caller setPosATL _dst_pos;
		titleText [_dst_desc, "BLACK FADED", 0.1];
	}, [_dst_newPos, _dst_desc], 1, true, true, "", "_this distance _target < 5"];
} forEach (_src_settings select 1);