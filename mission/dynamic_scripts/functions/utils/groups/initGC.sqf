[30, [], {
	[[], {
		{
			private _units = units _x;
			if ((count _units) == 0) then {
				(format ["Removing empty group %1", groupID _x]) call A3RE_M_fnc_logServer;
				deleteGroup _x;
			};
		} forEach allGroups;
	}] remoteExec ["spawn", 0];
}, false] call A3RE_M_fnc_addTask;