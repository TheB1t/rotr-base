private _player = _this call utils_player_get;

if (isNil "_player") exitWith { "Unknown" };
(_player select 1)