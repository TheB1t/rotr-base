params ["_player", "_didJIP"];
["Initialize", [true]] call BIS_fnc_dynamicGroups;

private _machine = owner _player;

_machine call A3RE_M_fnc_share;