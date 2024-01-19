["roll",{
    _r0 = round (random 20);
    _r1 = round (random 20);
    _r2 = round (random 20);
    _r3 = round (random 20);
    _r4 = round (random 20);
    _allR = _r0 + _r1 + _r2 + _r3 + _r4;
    _rShans = format ["Удача благосклонна к %3 на %1%2", _allR, "%", name player];
    [_rShans] remoteExec ["systemChat"];
}] call CAU_xChat_fnc_addCommand;

["try",{
    _argument = _this joinString " ";
    _r0 = round (random 20);
    _r1 = round (random 20);
    _r2 = round (random 20);
    _r3 = round (random 20);
    _r4 = round (random 20);
    _allR = _r0 + _r1 + _r2 + _r3 + _r4;
    private _msg = if (_allR >= 50) then {format ["%1 удачно %2", name player, _argument]} else {format ["%1 не удачно %2", name player, _argument]};
    [_msg] remoteExec ["systemChat"];
}] call CAU_xChat_fnc_addCommand;

["do",{
    _argument = _this joinString " ";
    _msg = format["Окружение: %1", _argument];
    [_msg] remoteExec ["systemChat"];
}] call CAU_xChat_fnc_addCommand;

["me",{
    _act = _this joinString " ";
    _rpchat = format ["RP  %1: %2", name player, _act];
    [_rpchat] remoteExec ["systemChat"];
}] call CAU_xChat_fnc_addCommand;

["nrp",{
    _argument = _this joinString " ";
    _nrpchat = format ["NRP  %1: (( %2 ))", name player, _argument];
    [_nrpchat] remoteExec ["systemChat"];
}] call CAU_xChat_fnc_addCommand;

["save",{
   ["script_playerSave", []] call A3RE_M_fnc_call;
}] call CAU_xChat_fnc_addCommand;