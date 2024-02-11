LEO_FFF_minHeight = 100;

if (missionNamespace getVariable ["LEO_FFF_perFrameEH", -1] >= 0) exitWith {};

LEO_FFF_perFrameEH = addMissionEventHandler ["EachFrame", {
	call freefallFix_perFrameEH;
}];