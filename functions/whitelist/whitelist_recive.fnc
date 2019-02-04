private ["_player","_unit","_whitelist","_value"];

_player = _this select 0;
_unit = _this select 1;
_whitelist = _this select 2;
_value = _this select 3;

missionNamespace setVariable [_whitelist,_value];

if (_value)then {
	systemchat format ["%1 whitelisted you for %2",name _player,_whitelist];
}else{
	systemchat format ["%1 removed you from %2 whitelist",name _player,_whitelist];
};