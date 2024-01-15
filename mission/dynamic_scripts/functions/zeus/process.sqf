params ["_player_name"];
private _var_name = _player_name+"Curator";
		
if (isNil _var_name) then {
	[_var_name] call zeus_curator_create;
};

private _curator = missionNamespace getVariable [_var_name, objNull];
private _player = missionNamespace getVariable [_player_name, objNull];

(format ["_curator: %1, _player: %2 (%3)", _curator, _player, _player_name]) remoteExec ["diag_log", 2];

unassignCurator _curator;
sleep 0.4;
_player assignCurator _curator;