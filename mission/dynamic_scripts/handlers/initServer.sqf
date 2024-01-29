"loader_generateLoadList"	call A3RE_M_fnc_loadFunction;
"loader_load"				call A3RE_M_fnc_loadFunction;
"loader_share"				call A3RE_M_fnc_loadFunction;

call loader_generateLoadList;
call loader_load;

call zeus_init;
call teleports_init;