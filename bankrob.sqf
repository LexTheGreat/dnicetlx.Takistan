#include "Awesome\Functions\macro.h"

_this = _this select 3;
_art  = _this select 0;
_safe = _this select 1;
	
if (_art == "ausrauben") then {
	_cont = true;

	call compile format["local_cash = robpool%1", _safe];

	if([west] call count_side < 3)exitwith{player groupchat "Robbing the bank requires 3 cops to be online."};
	if(local_cash < 50000 and !debug)exitwith{player groupchat "This safe is bricked."};

	if(!robenable and !debug)exitwith{player groupchat "you are already robbing the bank"};
	if(!(call INV_IsArmed) and !debug)exitWith{player groupChat localize "STRS_bank_rob_noweapon";};
	robenable = false;
	call compile format["robpool%1 = 0;publicvariable ""robpool%1"";", _safe];
	player groupChat format[localize "STRS_bank_rob_info", "<INSERT>"];

	format['[0,1,2,["opfer", %1]] execVM "bankrob.sqf";', _safe] call broadcast;
	player groupChat "Cracking Safe..";
	
	format ["%1 switchmove 'AinvPknlMstpSlayWrflDnon_medic';", player] call broadcast;
	sleep 5;
	for "_i" from 0 to 8 step 1 do {
		hint format["%1/60sec", (_i+1)*5];
		if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic") exitWith {
			_cont = false;
		};
		format ["%1 switchmove 'AinvPknlMstpSlayWrflDnon_medic';", player] call broadcast;
		sleep 5;
	};
	
	if (alive player && _cont) then {
		_stolenTotal = 0;
		
		for [{_c=0}, {_c < (count PlayerStringArray)}, {_c=_c+1;}] do {
			_player_variable_name = PlayerStringArray select _c;
			_player_variable = missionNamespace getVariable _player_variable_name;

			if(!isNil "_player_variable") then {
				if ([_player_variable] call player_exists) then {
					_stolen = _player_variable getVariable ["banklost", 0];
					if (_stolen > 0) then {
						private["_player_name"];
						_player_name = (name _player_variable);
						
						_stolenTotal = _stolenTotal + _stolen;
						
						player groupChat format["You stole %1 from %2", _stolen, _player_name];
					};
				};
			};
		};
		
		format['[0,1,2,["take"]] execVM "bankrob.sqf";', _safe] call broadcast;
		
		player groupChat format[localize "STRS_bank_rob_success"];
		player groupChat format["You got %1!", _stolenTotal];
		[player, 'money', _stolenTotal] call INV_AddInventoryItem;
		
		stolencash = stolencash + local_cash;

		local_useBankPossible = false;
		robenable = true;
		rblock = rblock + ((local_cash/50000)*60);
		_rblock = rblock;

		sleep 2;

		if(_rblock != rblock)exitwith{};

		for [{rblock}, {rblock > -1}, {rblock=rblock-1}] do {sleep 1;if ([player] call player_get_dead) exitWith {};};

		local_useBankPossible = true;
		stolencash = 0;
		rblock = 0;
	};
};

if (_art == "take") then {
	private["_takeCash"];
	_takeCash = player getVariable ["banklost", 0];
	player setVariable ["banklost", 0, true];
	_bank_account = [player] call get_bank_valuez;
	
	if (_bank_account-_takeCash < 0) exitWith {
		[player, 0] call set_bank_valuez;
		
		player groupChat "The Bank Robber took all of your money!";
	};
	
	[player, -(_takeCash)] call transaction_bank;
	_bank_account = [player] call get_bank_valuez;
	player groupChat format["The Bank Robber took %1, you have %2 left!", _takeCash, _bank_account];
};

if (_art == "opfer") then {
	private["_bank_account", "_insurances_inv", "_insurances_stor"];

	titleText [localize "STRS_bank_rob_titlemsg", "plain"];

	_safe say "Bank_alarm";
	copbase1 say "Bank_alarm";

	server globalchat format["Someone is robbing the bank!"];

	private["_bank_account", "_verlust", "_verlustA", "_verlustB"];
	_bank_account = [player] call get_bank_valuez;
	_verlust = round(_bank_account*Maxbankrobpercentlost);
	_verlustA = round(_bank_account*MaxbankrobpercentlostA);
	_verlustB = round(_bank_account*MaxbankrobpercentlostB);

	_bank_account = [player] call get_bank_valuez;
	_insurances_inv = [player, 'bankversicherung'] call INV_GetItemAmount;
	_insurances_stor = [player, 'bankversicherung', 'private_storage'] call INV_GetStorageAmount;
	
	
	if ((_bank_account <= _verlust) and (_bank_account >= 1) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		// [player, 0] call set_bank_valuez;	
		player groupChat localize "STRS_bank_rob_allmoneylost";
		player setVariable ["banklost", _verlust, true];
	};

	//Takes 5 percent from bank account if player has less than 100k (1/24/2012 IsHoOtYoUnOw)
	_bank_account = [player] call get_bank_valuez;
	if((_bank_account >  _verlust) and (_bank_account <= 99999) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		//[player, -(_verlust)] call transaction_bank;
		_bank_account = [player] call get_bank_valuez;
		player groupChat format[localize "STRS_bank_rob_somemoneylost", strM(_verlust), strM(_bank_account)];
		player setVariable ["banklost", _verlust, true];
	};

	//Takes 10 percent from bank account if player has 100k - 999k (1/24/2012 IsHoOtYoUnOw)	
	_bank_account = [player] call get_bank_valuez;
	if((_bank_account >  _verlust) and (_bank_account >= 100000) and (_bank_account <= 999999) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		//[player, -(_verlustA)] call transaction_bank;
		_bank_account = [player] call get_bank_valuez;
		player groupChat format[localize "STRS_bank_rob_somemoneylost", strM(_verlustA), strM(_bank_account)];
		player setVariable ["banklost", _verlustA, true];
	};

	//Takes 20 percent from bank account if player has 1mil or more (1/24/2012 IsHoOtYoUnOw)
	_bank_account =[player] call get_bank_valuez;
	if((_bank_account >  _verlust) and (_bank_account >= 1000000) and ((_insurances_inv + _insurances_stor) == 0)) exitWith {
		//[player, -(_verlustB)] call transaction_bank;
		_bank_account = [player] call get_bank_valuez;
		player groupChat format[localize "STRS_bank_rob_somemoneylost", strM(_verlustB), strM(_bank_account)];
		player setVariable ["banklost", _verlustB, true];
	};	

	if (_insurances_inv > 0) exitWith {
		player groupChat localize "STRS_bank_rob_lostnomoney";
		[player, 'bankversicherung', -(1)] call INV_AddInventoryItem;
	};
	
	if(_insurances_stor > 0) exitWith {
		player groupChat localize "STRS_bank_rob_lostnomoney";
		[player, 'bankversicherung', -(1), 'private_storage'] call INV_AddItemStorage;
	};
};

