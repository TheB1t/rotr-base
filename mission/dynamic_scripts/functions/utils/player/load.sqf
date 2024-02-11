private _loadout = profileNamespace getVariable ["ROTR_playerLoadout", []];
_this setUnitLoadout _loadout;

"Снаряжение загружено" call chat_logLocal;