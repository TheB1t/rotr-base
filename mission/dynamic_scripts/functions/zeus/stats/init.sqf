stats_disableKick = true;

[missionNamespace, "OnDisplayRegistered", {	
	params ["_display", "_class"];

    if (_class == "RscDisplayCurator") then {
        _active_curators = missionNamespace getVariable ["active_curators", []];

        if (!(player in _active_curators)) then {
            _active_curators pushBack player;
            missionNamespace setVariable["active_curators", _active_curators, true];
        };

        [] remoteExec ["zeus_stats_draw", 0];
    };
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "OnDisplayUnregistered", {	
	params ["_display", "_class"];

    if (_class == "RscDisplayCurator") then {
        _active_curators = missionNamespace getVariable ["active_curators", []];
        _active_curators deleteAt (_active_curators find player);
        missionNamespace setVariable["active_curators", _active_curators, true];

        [] remoteExec ["zeus_stats_draw", 0];
    };
}] call BIS_fnc_addScriptedEventHandler;