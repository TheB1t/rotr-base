"loader_generateLoadList"	call A3RE_M_fnc_loadFunction;
"loader_load"				call A3RE_M_fnc_loadFunction;
"loader_share"				call A3RE_M_fnc_loadFunction;

call loader_generateLoadList;
call loader_load;

call utils_groups_initGC;

call arsenal_init;

call zeus_init;
call teleports_init;