private ["_data","_unit","_value","_whitelist"];


_data = call compile lbData [56, lbCurSel 56];
_unit = call compile lbData [26, lbCurSel 26];

_value = _data select 0;
_whitelist = _data select 1;
_condition = whitelist_data select (lbCurSel 56)select 2;

if !(call _condition)exitWith {
	systemchat format ["%1 you are not a hight enought rank to whitelist people for %2",name player,_whitelist];
};


["SERVER",[player,_unit,_whitelist,!_value],"s_whitelist_add",false,false]call network_MPExec;