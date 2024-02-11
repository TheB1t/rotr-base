private _sum = 0;

for "_i" from 0 to _this do {
    private _mid = round (random 100);
    _sum = _sum + random [0, _mid, 100];
};

round (_sum / _this)