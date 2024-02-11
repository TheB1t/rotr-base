private _is_rc = 'RC' call utils_player_hasInName;
private _is_arc = 'ARC' call utils_player_hasInName;

if (_is_rc && !_is_arc) then {
	"RC Scripts initialized!" call chat_logLocal;

	player addAction ["<t color='#00FF00'>Усилить броню</t>", {
		call rc_armor;
	}, [], 10, false, true, "", ""];
};