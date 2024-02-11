private _title = "Использовать мед. дроида";

private _healerVars = "healer_" call utils_get_variables;

{
	private _obj = missionNamespace getVariable [_x, nil];

	if (isNil "_obj") exitWith {};

	_obj addAction [_title, {
		params ["_target", "_caller", "_actionId", "_arguments"];

		_caller call ace_medical_treatment_fnc_fullHealLocal;
	
		hint "Вы были полностью излечены";
		sleep 1;
		hintSilent "";
	}, [], 1, true, true, "", "_this distance _target < 5"];
} forEach _healerVars;