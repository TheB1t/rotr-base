private _basic = [];

_basic append (call arsenal_get_generic);
_basic append (call arsenal_get_vanilla);
_basic append (call arsenal_get_medical);

_basic append (call arsenal_get_magazines);
_basic append (call arsenal_get_supressors);
_basic append (call arsenal_get_laserSights);
_basic append (call arsenal_get_scopes);
_basic append (call arsenal_get_explosives);
_basic append (call arsenal_get_grenades);

private _dummy	= [];

private _rs		= call arsenal_get_subdiv_rs;
private _212	= call arsenal_get_subdiv_212;
private _99		= call arsenal_get_subdiv_99;
private _88		= call arsenal_get_subdiv_88;
private _77		= call arsenal_get_subdiv_77;
private _rc		= call arsenal_get_subdiv_rc;
private _arc	= call arsenal_get_subdiv_arc;

["RS",	"Republic Soldiers",			_basic, _rs]	call arsenal_initBox;
["88",	"88 Legion",					_basic, _88]	call arsenal_initBox;
["99",	"99 Legion",					_basic, _99] 	call arsenal_initBox;
["77",	"77 Legion",					_basic, _77]	call arsenal_initBox;
["212",	"212 Legion", 					_basic, _212]	call arsenal_initBox;
["104",	"104 Legion", 					_basic, _dummy] call arsenal_initBox;
["RC",	"Recon Commandos",				_basic, _rc]	call arsenal_initBox;
["ARC",	"Advanced Recon Commandos", 	_basic, _arc]	call arsenal_initBox;