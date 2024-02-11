private _curator = dedmenCurators_group createUnit ["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];

_curator setVariable ["showNotification", false];
_curator setCuratorCoef ["place", 0];
_curator setCuratorCoef ["delete", 0];

missionNamespace setVariable [_this, _curator, true];
publicVariable "dedmenCurators_group";
unassignCurator _curator;

_cfg = (configFile >> "CfgPatches");
_newAddons = [];

for "_i" from 0 to((count _cfg) - 1) do {
	_name = configName (_cfg select _i);
	_newAddons pushBack _name;
};

if (count _newAddons > 0) then {
	_curator addCuratorAddons _newAddons;
};