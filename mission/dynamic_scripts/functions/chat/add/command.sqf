params ["_command", "_numArgs", "_code"];

private _commands = missionNamespace getVariable ["chat_commands", []];
_commands pushBack [_command, _numArgs, _code];
missionNamespace setVariable ["chat_commands", _commands, true];