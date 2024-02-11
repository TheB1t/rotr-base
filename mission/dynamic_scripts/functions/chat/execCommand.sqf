params ["_command", "_prefix", "_args"];
_command params ["_name", "_argsNames", "_code"];

private _passedArgs		= count _args;
private _numArgs		= count _argsNames;
private _isEnoughArgs	= _passedArgs >= _numArgs;

if (!_isEnoughArgs) exitWith {
	(format ["Not enough arguments for call '%1' (excepted %2, passed %3)", _name, _numArgs, _passedArgs]) call chat_logLocal;

	private _cmdArgs = []; 

    {
        _cmdArgs pushBack format ["[%1]", _x];
    } forEach _argsNames;

    (format ["Usage: %1%2 %3", _prefix, _name, _cmdArgs joinString " "]) call chat_logLocal;

	true
};

(format ["Executing command '%1' with args %2 on machine %3", _name, _args, clientOwner]) call A3RE_M_fnc_logServer;
_args call _code;