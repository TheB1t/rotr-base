_log = {
	systemChat format ["<ChatCore> %1", _this];
};

private _inputType = typeName _this;

switch (_inputType) do {
	case ("ARRAY"): {
		{
			_x call _log;
		} forEach _this;
	};

	case ("STRING"): {
		_this call _log;
	};

	default {
		diag_log format ["Can't log value with type %1! Ignoring...", _inputType];
	};
};