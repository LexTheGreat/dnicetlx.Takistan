// fired event handler script
// EH_fired_vehicle.sqf

_this set [4, "SmokeShellVehicle"];

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

_bullets = (vehicle player) nearObjects ["SmokeShellVehicle", 100];

if (_unit distance (getmarkerpos "respawn_west") < 100) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
	
if ( ((_unit distance (getmarkerpos "respawn_civilian")) < 130) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};

if ( ((_unit distance (getmarkerpos "respawn_east")) < 100) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
	
if ( ((_unit distance (getmarkerpos "respawn_guerrila")) < 100) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
if ( ((_unit distance (getmarkerpos "cop_supporter_area")) < 90) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
if ( ((_unit distance (getmarkerpos "civ_supporter_area")) < 90) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
if ( ((_unit distance (getmarkerpos "ins_supporter_area")) < 90) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
if ( ((_unit distance (getmarkerpos "opf_supporter_area")) < 90) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
if ( ((_unit distance (getmarkerpos "vip_supporter_area")) < 90) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};
if ( ((_unit distance (getmarkerpos "vip_supporter_area_1")) < 90) ) exitwith {
		{
			deleteVehicle _x;
		} count _bullets;
	};

_passthrough = _this;
{
	_t = [_passthrough, _x] execVM "Awesome\Scripts\Smoke.sqf";
} count _bullets;