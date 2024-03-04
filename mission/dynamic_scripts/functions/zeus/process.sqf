private _var_name = _this+"Curator";

if (isNil _var_name) then {
	_var_name call zeus_curator_create;
};

private _curator = missionNamespace getVariable [_var_name, objNull];
private _player = missionNamespace getVariable [_this, objNull];
private _owner = owner _player;

(format ["_curator: %1, _player: %2 (%3), _owner %4", _curator, _player, _this, _owner]) call A3RE_M_fnc_logServer;

unassignCurator _curator;
sleep 0.4;
_player assignCurator _curator;

[_curator, {
	_this addEventHandler ["CuratorObjectPlaced", {
		params ["_curator", "_entity"];

		private _unit = getAssignedCuratorUnit _curator;

		if (isPlayer _unit) then {
			(format ["Curator (%1) placed: %2", name _unit, typeOf _entity]) call A3RE_M_fnc_logServer;
		} else {
			(format ["Curator (????) placed: %1", typeOf _entity]) call A3RE_M_fnc_logServer;
		};
	}];
}] remoteExec ["spawn", _owner];