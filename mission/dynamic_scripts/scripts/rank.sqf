_setRankIf = {
	params ["_unit", "_array", "_rank"];

	_namePlayer = name _unit;

	{
		if ((_namePlayer find _x != -1)) then {
			[_unit, _rank] remoteExec ["setRank", 0];
		};
	} forEach _array;
};

[_this, [
	"CPL", "CPS"
], "CORPORAL"] call _setRankIf;

[_this, [
	"SGT", "SSG", "SGM", "MSG", "FPO", "FMS", "MCPO"
], "SERGEANT"] call _setRankIf;

[_this, [
	"WO", "SPLT", "SLT", "LT", "Fl.LT", "LCM"
], "LIEUTENANT"] call _setRankIf;

[_this, [
	"CPT", "CMR"
], "CAPTAIN"] call _setRankIf;

[_this, [
	"MAJ", "COL", "CC", "Fl.COM", "Fl.CPT"
], "MAJOR"] call _setRankIf;

[_this, [
	"MC", "CMD", "VAM", "AM", "GEN", "SGEN", "HGEN", "Dir"
], "COLONEL"] call _setRankIf;