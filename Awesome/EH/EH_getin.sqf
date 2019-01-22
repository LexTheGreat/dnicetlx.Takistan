private["_vehicle", "_invpos", "_unit", "_source", "_projectile"];
_vehicle = _this select 0;
_invpos =  _this select 1;
_unit = _this select 2;

_restrained = _unit getVariable ["restrained", false];
_isstunned = _unit getVariable ["isstunned", false];

if (_restrained or _isstunned) then {
	_unit groupChat "Warning entering a vehicle while subdued is rule breaking!";
	_unit action ["Eject",vehicle _unit];
};