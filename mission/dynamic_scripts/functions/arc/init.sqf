systemChat "ARC Scripts initialized!";

player addAction ["<t color='#2ECC71'>Вколоть боевой стимулятор</t>", {
	call arc_stimulator;
}, [], 10, false, true, "", "'JLTS_drugs_stimulant_battle' call utils_player_has"];

player addAction ["<t color='#42AAFF'>Использовать красную бакту</t>", {
	call arc_redBacta;
}, [], 10, false, true, "", "'JLTS_drugs_bacta_red' call utils_player_has"];