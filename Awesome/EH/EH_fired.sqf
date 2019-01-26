// fired event handler script
// EH_fired.sqf

_unit 			= _this select 0;
_weapon			= _this select 1;
_muzzle			= _this select 2;
_mode			= _this select 3;
_ammo			= _this select 4;
_magazine		= _this select 5;
_projectile		= _this select 6;

liafu2 = true;

///////////////
// Distance checks
///////////////

_bullet = nearestObject [getpos player, _ammo];

if (isInSafeZone) exitwith {
	deletevehicle _bullet;
	if (firestrikes == 0) exitwith {
		[player] call player_reset_gear;
		firestrikes = totalstrikes;
	};
	firestrikes = firestrikes - 1;
	format['hint "WARNING %1: DO NOT FIRE INSIDE THE %4! %2/%3 chances left.";', name _unit, firestrikes, totalstrikes, isInSafeZoneMessage] call broadcast;
};

///////////////
// STUN EFFECTS
///////////////

if ((_magazine == "15Rnd_9x19_M9SD") && ((_weapon == "M9") || (_weapon == "M9SD"))) then {
		[1, _unit] execVM "Awesome\Scripts\Stun.sqf"; 		
	};
if ((_magazine == "15Rnd_9x19_M9SD") && ((_weapon == "glock17_EP1") || (_weapon == "M9SD"))) then {
		[1, _unit] execVM "Awesome\Scripts\Stun.sqf"; 		
	};
/*if (_weapon == "M1014") then {
		[1, _unit] execVM "Awesome\Scripts\Stun.sqf"; 		
	};
if ((_magazine == "8Rnd_B_Saiga12_74Slug") && (_weapon == "Saiga12K")) then {
		[2, _unit] execVM "Awesome\Scripts\Stun.sqf"; 		
	};
if ((_magazine == "Rnd_B_AA12_74Slug") && (_weapon == "AA12_PMC")) then {
		[2, _unit] execVM "Awesome\Scripts\Stun.sqf"; 		
	};*/

///////////////
// Tear Gas
///////////////
[_this, _bullet] execVM "Awesome\Scripts\Smoke.sqf";