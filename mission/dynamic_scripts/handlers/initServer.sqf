private _functions = [
	"zeus_init",
	"zeus_add",
	"zeus_verify",
	"zeus_process",
	"zeus_curator_init",
	"zeus_curator_create",
	"zeus_stats_init",
	"zeus_stats_draw",

	"arc_init",
	"arc_redBacta",
	"arc_stimulator",

	"credits_init",
	"credits_show",
	"credits_showPreview"
];

private _scripts = [
	"rank",
	"chatCommands",
	"medMenu",
	"playerSave",
	"weaponHand"
];

{
	_x call A3RE_M_fnc_loadFunction;
} forEach _functions;

{
	_x call A3RE_M_fnc_loadScript;
} forEach _scripts;

["zeus_init",		[]] call A3RE_M_fnc_call;