private _basic = [];

_basic append (call arsenal_get_generic);
_basic append (call arsenal_get_vanilla);
_basic append (call arsenal_get_medical);

_basic append (call arsenal_get_magazines);
_basic append (call arsenal_get_supressors);
_basic append (call arsenal_get_laserSights);
_basic append (call arsenal_get_scopes);
_basic append (call arsenal_get_mines);

["RS",	"Republic Soldiers",			_basic] call arsenal_initBox;
["88",	"88 Legion",					_basic] call arsenal_initBox;
["99",	"99 Legion",					_basic] call arsenal_initBox;
["77",	"77 Legion",					_basic] call arsenal_initBox;
["104",	"104 Legion", 					_basic] call arsenal_initBox;
["RC",	"Recon Commandos",				_basic] call arsenal_initBox;
["ARC",	"Advanced Recon Commandos", 	_basic] call arsenal_initBox;