private _commands	= missionNamespace getVariable "chat_commands";
private _prefix		= profileNamespace getVariable "chat_prefix";

if (isNil "_commands") then {
	missionNamespace setVariable ["chat_commands", []];
};

if (isNil "_prefix") then {
	_prefix = "/";
	profileNamespace setVariable ["chat_prefix", _prefix];
};

addMissionEventHandler ["HandleChatMessage", {
	params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType", "_params"];

	private _commands	= missionNamespace getVariable "chat_commands";
	private _prefix		= profileNamespace getVariable "chat_prefix";

	private _args		= _text splitString " ";
	private _cmd		= _args deleteAt 0;

	if (isNil "_cmd") exitWith { true };

	private _first		= _cmd select [0, 1];
	if (!(_first isEqualTo _prefix)) exitWith { false };

	if (_owner == clientOwner) then {
		_cmd = _cmd select [1, (count _cmd) - 1];

		private _commandPos = _commands findIf { (_x select 0) == _cmd };

		if (_commandPos != -1) then {
			private _command = _commands select _commandPos;
			[_command, _prefix, _args] call chat_execCommand;
		} else {
			(format ["Failed to find command '%1'", _cmd]) call chat_logLocal;
		};
	};

	true;
}];

private _enabledChannels = [0, 1, 3, 5];
for "_i" from 0 to 6 do {
	if (!(_i in _enabledChannels)) then {
		_i enableChannel false;
	};
};

["help", [], {
    private _commands = missionNamespace getVariable "chat_commands";
    private _commandsNames = [];

    {
        _commandsNames pushBack (_x select 0);
    } forEach _commands;

    (format ["Available commands: %1", _commandsNames joinString ", "]) call chat_logLocal;
}] call chat_add_command;

[
	format ["Loaded! Command prefix '%1'. For help use command '%1help'", _prefix],
	"If you find any error/bug please contact with Bit in Discord."
] call chat_logLocal;