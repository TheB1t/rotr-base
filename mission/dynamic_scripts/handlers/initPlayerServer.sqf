params ["_player", "_didJIP"];
["Initialize", [true]] call BIS_fnc_dynamicGroups;

private _machine = owner _player;

_machine call loader_share;