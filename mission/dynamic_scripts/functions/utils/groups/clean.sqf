{
	private _units = units _x;
	if ((count _units) == 0) then {
		(format ["Removing empty group %1 at machine %2", groupID _x, clientOwner]) call A3RE_M_fnc_logServer;
		deleteGroup _x;
	};
} forEach allGroups;