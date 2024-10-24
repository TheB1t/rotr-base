private _reinit_sequence = [
	["utils_richPersense_set_state",	"Dead"],
	["utils_richPersense_update",		[]],
];

{
	_x call A3RE_M_fnc_call;
} forEach _reinit_sequence;