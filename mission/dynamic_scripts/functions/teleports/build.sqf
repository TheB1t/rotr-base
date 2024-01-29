params ["_name"];

private _src = missionNamespace getVariable [_name, nil];
private _src_settings = _name call teleports_get_settings;

if (isNil "_src" || isNil "_src_settings") exitWith {
	diag_log format ["[teleport_build] Failed to find source teleport point %1", _name];
	_actions
};

_teleport_action_group = ["Teleport", "Телепорт", "", {}, { true }, {
	params ["_target", "_player", "_params"];
	_params params ["_src", "_src_settings"];

	private _actions = [];

	{
		private _dst_name = _x call teleports_get_name;

		private _dst = missionNamespace getVariable [_dst_name, nil];
		private _dst_settings = _dst_name call teleports_get_settings;

		if (isNil "_dst" || isNil "_dst_settings") then {
			diag_log format ["[teleport_build] Failed to find destination teleport point %1", _dst_name];
			continue;
		};

		private _dst_display_name = _dst_settings select 0;
		private _dst_desc = format ["Вы были телепортированы к %1", _dst_display_name];
		private _dst_pos = getpos _dst;

		private _action = [_dst_name, _dst_display_name, "", {
			params ["_target", "_player", "_params"];
			_params params ["_dst_pos", "_dst_desc"];

			_player setposatl _dst_pos; 
			titleText [_dst_desc, "BLACK FADED", 0.1];
		}, { true }, {}, [_dst_pos, _dst_desc]] call ace_interact_menu_fnc_createAction;

		_actions pushBack [_action, [], _target];
	} forEach (_src_settings select 1);

	_actions
}, [_src, _src_settings]] call ace_interact_menu_fnc_createAction;

[_src, 0, ["ACE_MainActions"], _teleport_action_group] call ace_interact_menu_fnc_addActionToObject;