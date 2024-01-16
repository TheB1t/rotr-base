params ["_player", "_didJIP"];
["Initialize", [true]] call BIS_fnc_dynamicGroups;

private _shared_objects = [
	"zeus_add",
	"zeus_verify",
	"zeus_stats_init",
	"zeus_stats_draw",

	"arc_init",
	"arc_redBacta",
	"arc_stimulator",

	"credits_init",
	"credits_show",
	"credits_showPreview",

	"script_rank",
	"script_chatCommands",
	"script_medMenu",
	"script_playerSave",
	"script_weaponHand"
];

{
	_x call A3RE_M_fnc_makeShared;
} forEach _shared_objects;