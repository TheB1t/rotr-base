general_sector = "Мадригал";
general_system = "Алтис";

west_sector = general_sector;
west_system = general_system;
resistance_sector = general_sector;
resistance_system = general_system;
east_sector = general_sector;
east_system = general_system;

onScreenTime = 3;
creditsLines = [];

creditsLines pushBack [
	"Добро пожаловать на Revenge of the Republic|Arma 3", 
	[profileName]
];

creditsLines pushBack [
	"Игровой проект Revenge of the Republic", 
	["Created by ROTR Team"]
];

creditsLines pushBack [
	"Разработчики...(мы работаем)",
	["ROTR Team"]
];

creditsLines pushBack [
	"Присоединяйтесь в Discord", 
    ["https://discord.gg/revenge-of-the-republic-arma-3-795084260083236874"]
];

creditsLines pushBack [
    "Удачной игры!",
    [profileName]
];

publicVariable "west_sector";
publicVariable "west_system";
publicVariable "resistance_sector";
publicVariable "resistance_system";
publicVariable "east_sector";
publicVariable "east_system";

publicVariable "onScreenTime";
publicVariable "creditsLines";

"credits_show" call A3RE_M_fnc_loadFunction;
"credits_showPreview" call A3RE_M_fnc_loadFunction;