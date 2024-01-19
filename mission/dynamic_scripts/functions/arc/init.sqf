systemChat "ARC Scripts initialized!";

player addAction ["<t color='#2ECC71'>Вколоть боевой стимулятор</t>", {
	["arc_stimulator",	[]] call A3RE_M_fnc_call;
}, [], 10, false, true, "", "'JLTS_drugs_stimulant_battle' in (items player)"];

player addAction ["<t color='#42AAFF'>Использовать красную бакту</t>", {
	["arc_redBacta",	[]] call A3RE_M_fnc_call;
}, [], 10, false, true, "", "'JLTS_drugs_bacta_red' in (items player)"];