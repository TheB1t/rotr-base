private _teleportVars = "teleport_" call utils_get_variables;

{
	_x call teleports_build;
} forEach _teleportVars;