params ["_unit"];

_setRankIf = {
	params ["_unit", "_array", "_rank"];

	_namePlayer = name _unit;

	{
		if ((_namePlayer find _x != -1)) then {
			[_unit, _rank] remoteExec ["setRank", 0];
		};
	} forEach _array;
};

[_unit, [
	"CPL", "CPS"
], "CORPORAL"] call _setRankIf;

[_unit, [
	"SGT", "SSG", "SGM", "MSG", "FPO", "FMS", "MCPO"
], "SERGEANT"] call _setRankIf;

[_unit, [
	"WO", "SPLT", "SLT", "LT", "Fl.LT", "LCM"
], "LIEUTENANT"] call _setRankIf;

[_unit, [
	"CPT", "CMR"
], "CAPTAIN"] call _setRankIf;

[_unit, [
	"MAJ", "COL", "CC", "Fl.COM", "Fl.CPT"
], "MAJOR"] call _setRankIf;

[_unit, [
	"MC", "CMD", "VAM", "AM", "GEN", "SGEN", "HGEN", "Dir"
], "COLONEL"] call _setRankIf;