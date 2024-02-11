private _loadout = getUnitLoadout _this;
profileNamespace setVariable ["ROTR_playerLoadout", _loadout];

"Снаряжение сохранено" call chat_logLocal;