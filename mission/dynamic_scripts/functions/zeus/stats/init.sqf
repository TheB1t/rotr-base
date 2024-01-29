[missionNamespace, "OnDisplayRegistered", {	
	params ["_display", "_class"];

    if (_class == "RscDisplayCurator") then {
        _active_curators = missionNamespace getVariable ["active_curators", []];
        _curator = [player, clientOwner];

        if (!(_curator in _active_curators)) then {
            _active_curators pushBack _curator;
            missionNamespace setVariable ["active_curators", _active_curators, true];
        };

        _active_curators remoteExec ["zeus_stats_draw", 0];
    };
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "OnDisplayUnregistered", {	
	params ["_display", "_class"];

    if (_class == "RscDisplayCurator") then {
        _active_curators = missionNamespace getVariable ["active_curators", []];
        _curator = [player, clientOwner];

        _active_curators deleteAt (_active_curators find _curator);
        missionNamespace setVariable ["active_curators", _active_curators, true];

        _active_curators remoteExec ["zeus_stats_draw", 0];
    };
}] call BIS_fnc_addScriptedEventHandler;