private ["_units","_find"];

_units = call core_units;
_units set [count _units,"server"];
_find = if (isServer)then {"server"}else{str player};

MPID = format ["MP%1",(_units find _find)];
{
	format ["MP%1",_ForEachIndex] addPublicVariableEventHandler {(_this select 1) call network_Run;};
}ForEach _units;

"PGRE" addPublicVariableEventHandler {call compile (_this select 1);};	
