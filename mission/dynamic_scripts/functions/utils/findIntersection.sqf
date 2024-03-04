params ["_array1", "_array2"];
private _result = [];
    
{
    if (_x in _array2) then {
        _result pushBack _x;
    }
} forEach _array1;
    
_result