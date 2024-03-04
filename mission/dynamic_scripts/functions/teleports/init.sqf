_teleports = [
	["gar_kupol", "Спавн",
		["gar_rs"]
	],
	["gar_rs", "База RS",
		["gar_kupol"]
	],

	["merc_ship", "Корабль Наёмников",
		["merc_ground"]
	],
	["merc_ground", "Суша",
		["merc_ship"]
	]
];

{
	_x call teleports_bind;
} forEach _teleports;