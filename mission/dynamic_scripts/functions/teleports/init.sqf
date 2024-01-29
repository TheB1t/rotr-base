_teleports = [
	["gar_spawn", "Спаун",
		["gar_sob", "gar_jedi", "gar_nrp", "gar_rs"]
	],
	["gar_sob", "База БСО",
		["gar_spawn"]
	],
	["gar_jedi", "Храм Джедаев",
		["gar_spawn"]
	],
	["gar_nrp", "NONRP Зона",
		["gar_spawn"]
	],
	["gar_rs", "База RS",
		["gar_spawn"]
	]
];

{
	_x call teleports_bind;
} forEach _teleports;