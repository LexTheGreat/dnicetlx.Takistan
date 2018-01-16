_bullet			= _this select 1;
_this			= _this select 0;


_unit 			= _this select 0;
_weapon			= _this select 1;
_muzzle			= _this select 2;
_mode			= _this select 3;
_ammo			= _this select 4;
_magazine		= _this select 5;
_projectile		= _this select 6;

if ( (typeName _bullet) != "OBJECT") exitwith {};

_Tear_gas =
{
	_pos = _this select 0;
	_timenow = time;
	while{time < (_timenow + 20) || (!(isnull _pos))}do{
		sleep 1;
		if(!(isnull _pos))then {
			{
				_player_variable_name = _x;
				_player_variable = missionNamespace getVariable _player_variable_name;
				
				if(!isNil "_player_variable") then {
					if ([_player_variable] call player_exists) then {
						if (_pos distance (getPos _player_variable) <= 10) then {
							private["_player_name"];
							_player_name = (name _player_variable);
							
							_hasMask = _player_variable getvariable ["gasmask", false];
							if (!_hasMask) then {
								_player_variable setVariable ["flashed", true, true];
							} else {
								_player_variable setVariable ["flashed", false, true];
							};
						};
					};
				};
			} count PlayerStringArray;
		};
	};
};



_BPos = [];

while {!isNull _bullet and ((velocity _bullet)select 0 > 0.1)} do {
	_BPos = getPosATL _bullet;
};

switch (_ammo) do
{
    case "SmokeShell":
    {
		[_bullet] spawn _Tear_gas;
    };   
    case "G_40mm_Smoke":
    {
		[_bullet] spawn _Tear_gas;
    };   
	case "SmokeShellVehicle":
	{
		[_bullet] spawn _Tear_gas;
	};
};