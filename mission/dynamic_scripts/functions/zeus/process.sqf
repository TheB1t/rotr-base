private _var_name = _this+"Curator";
		
if (isNil _var_name) then {
	["zeus_curator_create", _var_name] call A3RE_M_fnc_call;
};

private _curator = missionNamespace getVariable [_var_name, objNull];
private _player = missionNamespace getVariable [_this, objNull];

(format ["_curator: %1, _player: %2 (%3)", _curator, _player, _this]) remoteExec ["diag_log", 2];

unassignCurator _curator;
sleep 0.4;
_player assignCurator _curator;