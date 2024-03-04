["roll", [], {
    _rand = (10 call utils_random);
    _text = format ["Удача благосклонна к %3 на %1%2", _rand, "%", name player];

    _text call chat_sayGlobal;
}] call chat_add_command;

["try", ["action"], {
    _argument = _this joinString " ";

    _rand = (10 call utils_random);
    _text = if (_rand >= 50) then {
        format ["%1 удачно %2", name player, _argument]
    } else {
        format ["%1 не удачно %2", name player, _argument]
    };

    _text call chat_sayGlobal;
}] call chat_add_command;

["do", ["env"], {
    _argument = _this joinString " ";
    _text = format ["Окружение %1", _argument];

    _text call chat_sayGlobal;
}] call chat_add_command;

["me", ["rp message"], {
    _act = _this joinString " ";
    _text = format ["RP %1: %2", name player, _act];

    _text call chat_sayGlobal;

}] call chat_add_command;

["nrp", ["nrp message"], {
    _argument = _this joinString " ";
    _text = format ["NRP %1: (( %2 ))", name player, _argument];

    _text call chat_sayGlobal;
}] call chat_add_command;

["save", [], {
    player call utils_player_save;
}] call chat_add_command;

["showtps", [], {
    [clientOwner, {
        (format ["Server TPS %1 (min %2)", diag_fps, diag_fpsMin]) remoteExec ["chat_logLocal", _this];
    }] remoteExec ["spawn", 2];
}] call chat_add_command;

["showfps", [], {
    (format ["Your FPS %1 (min %2)", diag_fps, diag_fpsMin]) call chat_logLocal;
}] call chat_add_command;