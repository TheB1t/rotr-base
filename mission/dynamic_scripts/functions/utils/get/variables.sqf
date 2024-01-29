private _size = count _this;
private _allVars = allVariables missionNamespace;
_allVars select {
	(_x select [0, _size]) isEqualTo _this;
};