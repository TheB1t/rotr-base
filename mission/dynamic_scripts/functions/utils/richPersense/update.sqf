[[], {
	if (isServer) exitWith {};

	private _title = missionNamespace getVariable "rich_persense_title";
	private _state = missionNamespace getVariable "rich_persense_state";

	if (isNil "_title" || isNil "_state") exitWith {
		(format ["Failed to update Discord Rich Persense status"]) call A3RE_M_fnc_logServer;
	};

	[
		["UpdateDetails",		_title],
		["UpdateState",			_state],
		["UpdatePartySize",		count playableUnits],
		["UpdatePartyMax",		getNumber (missionConfigFile >> "Header" >> "maxPlayers")]
	] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);
}] remoteExec ["spawn", 0];