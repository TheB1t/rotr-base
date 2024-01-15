waitUntil {local player};
player enableAimPrecision false;
Weapon_AIM_Coef = addMissionEventHandler ["EachFrame", {
	player setCustomAimCoef 0;
}];