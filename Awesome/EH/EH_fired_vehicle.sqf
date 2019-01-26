// fired event handler script
// EH_fired_vehicle.sqf

_unit 			= _this select 0;
_weapon			= _this select 1;
_muzzle			= _this select 2;
_mode			= _this select 3;
_ammo			= _this select 4;
_magazine		= _this select 5;
_projectile		= _this select 6;


///////////////
// Distance checks
///////////////

_bullet = nearestObject  [getpos player, _ammo];
_bullets = nearestObjects  [getpos player, [_ammo], 10];

if (isInSafeZone) exitwith {
	{
		deleteVehicle _x;
	} forEach _bullets;
	deletevehicle _bullet;
};