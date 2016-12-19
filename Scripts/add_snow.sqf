[] spawn {
	snowWorking = true;
	while {snowWorking} do {
		_dist = random 1000;
		_dir = random 360;
		_pos = getpos player;
		_position = [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, 0]; 
		_isFlatArray = _position isFlatEmpty [-1, -1, 0.5, 10, -1];
		_isFlat = count _isFlatArray == 0;
		_snow = nearestObjects [_position, ["Snow"], 10];
		if (!_isFlat && count _snow == 0) then {
			"Snow" createVehicleLocal _position;
		};
		
		sleep 1;
	};
};