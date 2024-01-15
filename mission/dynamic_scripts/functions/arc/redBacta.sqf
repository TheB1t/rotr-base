_cooldownArmorArc = player getVariable ["cooldownArmorArc", 0];
_timerCD = 300;
_timerUpTime = 30;

if (_cooldownArmorArc == 0) then {
	player removeItem "JLTS_drugs_bacta_red";
	player say3D "ACE_hit_Male06ENG_high_1";

    _endUptimeArmor = time + _timerUpTime;
    player setVariable ["cooldownArmorArc", _timerCD];

	hint "Бакта использованна. Она активна 30 секунд.";
	sleep 1;
	hintSilent "";

    while {time <= _endUptimeArmor && alive player} do {
        player call ace_medical_treatment_fnc_fullHealLocal;
		sleep 3.5;
    };

    for [{private _i = _timerCD}, {_i >= 0 }, {_i = _i - 1}] do {
        sleep 1;
        player setVariable ["cooldownArmorArc", _i];
    };
} else {
    if (_cooldownArmorArc == _timerCD) then {
		hint parseText format ["<t color='#00FF00'>Больше красная бакта не даст эффекта</t>"]
	} else {
		hint parseText format ["<t color='#00FF00'>Отдохните ещё %1 секунд</t>", _cooldownArmorArc]
	};
};