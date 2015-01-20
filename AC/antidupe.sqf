private ["_oldBank","_newBank","_difference","_duper","_dupeid","_side","_don"];
_duper = str (name player);
_dupeid = str (getPlayerUID player);

waitUntil {!isNil "statsLoaded"};
sleep 20;
_side = str (playerSide);
_don = "Regular";
if (isdon) then {
	_don = "Donator";
};
if (isvip) then {
	_don = "VIP";
};
_don = str (_don);
while {true} do 
{
//make sure they are alive...
	while {alive player} do 
	{
	// lets get their position and their position 1 second from now...
		_oldBank = [player] call player_get_total_money;//get_bank_valuez;
		sleep 10;
		_newBank = [player] call player_get_total_money;
		_difference = _newBank - _oldBank;
		//player commandchat format ['%1, %2, %3', str (getPlayerUID player), name player, _difference];
	
// bank difference(editable) 
			if  (_difference > 2000000) then 
			{
				if(_oldBank > 100000) then {
					["DUPING LOGGER", _dupeid, _duper, _side, _don, _difference] call fn_LogToServer;
					//execVM "AC\punish.sqf";					
				};
			};
	};
};



	