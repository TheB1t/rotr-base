params ["_src", "_dst", "_dst_display_name"];

private _title = format ["Телепорт до %1", _dst_display_name];
private _desc = format ["Вы были телепортированы к %1", _dst_display_name];

_src addAction [_title, {
    params ["_target", "_caller", "_actionId", "_arguments"];

	_arguments params ["_dst", "_desc"];

    _pos = getpos _dst;
    _caller setposatl [_pos select 0, _pos select 1, _pos select 2]; 
    titleText [_desc, "BLACK FADED", 0.2];
}, [_dst, _desc], 1, true, true, "", "_this distance _target < 5"];