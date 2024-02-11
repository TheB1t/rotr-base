_teleports = [
	["gar_hangar", "Венатор Ангар",
		["gar_mostik", "gar_control_room"]
	],
	["gar_mostik", "Венатор Мостик",
		["gar_hangar", "gar_control_room"]
	],
	["gar_control_room", "Венатор Контрольная рубка",
		["gar_hangar", "gar_mostik"]
	]
];

{
	_x call teleports_bind;
} forEach _teleports;