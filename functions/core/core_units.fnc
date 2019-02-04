private ["_amount","_return","_i","_id","_class","_name","_subamount","_s","_sub"];
_amount = getNumber(missionConfigFile  >> "Mission" >> "Groups" >> "items");
_return = [];

for "_i" from 0 to _amount do 
{
	_id = format["Item%1",_i];
	_subamount = getNumber(missionConfigFile  >> "Mission" >> "Groups" >> _id >> "Vehicles" >> "items");

	for "_s" from 0 to _subamount do 
	{
		_sub = format["Item%1",_s];
		_class = getText(missionConfigFile  >> "Mission" >> "Groups" >> _id >> "Vehicles" >> _sub >> "player");
		if (_class != "")then {
			_name = getText(missionConfigFile  >> "Mission" >> "Groups" >> _id >> "Vehicles" >> _sub >> "text");
			if (_name != "")then {
			_return set [count _return,_name];
			};
		 };
	};
};
_return