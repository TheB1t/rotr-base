systemChat "RC Armor script activated!";

_cooldownArmorRC = player getVariable ["cooldownArmorRC", 0];
_timerCD = 600;
_timerUpTime = 300;

if (_cooldownArmorRC == 0) then {
	addCamShake [20, 12, 4];
    hint parseText format ["<t color='#00FF00'>Броня активирована</t>"];
    _endUptimeArmor = time + _timerUpTime;

    player setVariable["cooldownArmorRC", _timerCD];

    while {time <= _endUptimeArmor && alive player} do {
        sleep 1;
        player call ace_medical_treatment_fnc_fullHealLocal;
    };

    hint parseText format ["<t color='#00FF00'>Батарея разрядилась</t>"];

    for [{private _i = _timerCD}, {_i >= 0 }, {_i = _i - 1}] do {
        sleep 1;
        player setVariable ["cooldownArmorRC", _i];
    };

} else {
    if (_cooldownArmorRC == _timerCD) then {
        hint parseText format ["<t color='#00FF00'>Броня уже активирована</t>"];
    } else {
        hint parseText format ["<t color='#00FF00'>Батарея зарядится через %1</t>", _cooldownArmorRC];
    };
}