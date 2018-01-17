private["_loadFromDBClient", "_sendToServer"];

_loadFromDBClient =
"
	private['_array','_varName','_varValue', '_uid'];
	_array = _this;
	_uid = _array select 0;
	if((getplayerUID player) != _uid) exitWith {};
	player commandChat format ['Stats found, Loading... please wait'];
	_varName = _array select 1;
	_varValue = _array select 2;
	
	
	if(playerSide == west) then
	{
		if(!isNil '_varValue') then {
		if(_varName == 'moneyAccountWest') then {
                player commandChat format ['Bank account West found. Loading!'];
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
		};
		if(typeName _varValue == 'ARRAY') then {
			if(count _varValue != 0) then {
				if(_varName == 'MagazinesplayerWest') then {{player addMagazine _x} forEach _varValue;};
				if(_varName == 'WeaponsplayerWest') then {{player addWeapon _x} forEach _varValue;};		
				if(_varName == 'LicensesWest') then {INV_LicenseOwner = _varValue;};
				if(_varName == 'InventoryWest') then {[player, _varValue] call player_set_inventory;};
				if(_varName == 'privateStorageWest') then {[player,'private_storage', _varValue] call player_set_array;};
				if(_varName == 'FactoryWest') then {INV_Fabrikowner = _varValue;};
				if(_varName == 'positionPlayerWest') then {player setPosATL _varValue;};
				if(_varName == 'BackWepPlayerWest') then {  {unitBackpack player addWeaponCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
				if(_varName == 'BackMagPlayerWest') then {{unitBackpack player addMagazineCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
			};
		};
		if(typeName _varValue == 'STRING') then {
			if(_varName == 'BackpackPlayerWest' && _varValue != '<NULL-object>') then {player addBackpack _varValue;};
		};
		};
	};
	if(playerSide == east) then
	{
		if(!isNil '_varValue') then {
		if(_varName == 'moneyAccountEast') then {
                player commandChat format ['Bank account East found. Loading!'];
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
			
		};
		if(typeName _varValue == 'ARRAY') then {
		if(count _varValue != 0) then {
		if(_varName == 'LicensesEast' && count _varValue > 0) then {INV_LicenseOwner = _varValue;};
		if(_varName == 'InventoryEast') then {[player, _varValue] call player_set_inventory;};
		if(_varName == 'WeaponsplayerEast') then {{player addWeapon _x} forEach _varValue;};	
		if(_varName == 'MagazinesplayerEast') then {{player addMagazine _x} forEach _varValue;};
		if(_varName == 'privateStorageEast') then {[player, 'private_storage', _varValue] call player_set_array;};
		if(_varName == 'FactoryEast') then {INV_Fabrikowner = _varValue;};
		if(_varName == 'positionPlayerEast') then {player setPosATL _varValue;};
		if(_varName == 'BackWepPlayerEast') then {  {unitBackpack player addWeaponCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
		if(_varName == 'BackMagPlayerEast') then {{unitBackpack player addMagazineCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
		};
		};
		if(typeName _varValue == 'STRING') then {
		if(_varName == 'BackpackPlayerEast' && _varValue != '<NULL-object>') then {player addBackpack _varValue;};
		};
		};
	};
	if(playerSide == resistance) then
	{
		if(!isNil '_varValue') then {
		if(_varName == 'moneyAccountRes') then {
                player commandChat format ['Bank account Resistance found. Loading!'];
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
		};
		if(typeName _varValue == 'ARRAY') then {
		if(count _varValue != 0) then {
		if(_varName == 'WeaponsplayerRes') then {{player addWeapon _x} forEach _varValue;};	
		if(_varName == 'MagazinesplayerRes') then {{player addMagazine _x} forEach _varValue;};	
		if(_varName == 'LicensesRes' && count _varValue > 0) then {INV_LicenseOwner = _varValue;};
		if(_varName == 'InventoryRes') then {[player, _varValue] call player_set_inventory;};
		if(_varName == 'privateStorageRes') then {[player, 'private_storage', _varValue] call player_set_array;};
		if(_varName == 'FactoryRes') then {INV_Fabrikowner = _varValue;};
		if(_varName == 'positionPlayerRes') then {player setPosATL _varValue;};
		if(_varName == 'BackWepPlayerRes') then {  {unitBackpack player addWeaponCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
		if(_varName == 'BackMagPlayerRes') then {{unitBackpack player addMagazineCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
		};
		};
		if(typeName _varValue == 'STRING') then {
		if(_varName == 'BackpackPlayerRes' && _varValue != '<NULL-object>') then {player addBackpack _varValue;};
		};
		};
	};
	if(playerSide == civilian) then
	{
		if(!isNil '_varValue') then {
		if(_varName == 'moneyAccountCiv') then {
                player commandChat format ['Bank account Civilian found. Loading!'];
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
			
		};
		if(typeName _varValue == 'ARRAY') then {
		if(count _varValue != 0) then {
		if(_varName == 'WeaponsplayerCiv') then {{player addWeapon _x} forEach _varValue;};	
		if(_varName == 'MagazinesplayerCiv') then {{player addMagazine _x} forEach _varValue;};	
		if(_varName == 'LicensesCiv' && count _varValue > 0) then {INV_LicenseOwner = _varValue;};
		if(_varName == 'InventoryCiv') then {[player, _varValue] call player_set_inventory;};
	    if(_varName == 'privateStorageCiv') then {[player, 'private_storage', _varValue] call player_set_array;};
		if(_varName == 'FactoryCiv') then {INV_Fabrikowner = _varValue;};
		if(_varName == 'positionPlayerCiv') then {player setPosATL _varValue;};
		if(_varName == 'BackWepPlayerCiv') then {  {unitBackpack player addWeaponCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
		if(_varName == 'BackMagPlayerCiv') then {{unitBackpack player addMagazineCargoGlobal [(_varValue select 0) select _forEachIndex, (_varValue select 1) select _forEachIndex];} forEach (_varValue select 0);};
		};
		};
		if(typeName _varValue == 'STRING') then {
		if(_varName == 'BackpackPlayerCiv' && _varValue != '<NULL-object>') then {player addBackpack _varValue;};
		};
		};
	};
";

loadFromDBClient = compile _loadFromDBClient;
//===========================================================================
_sendToServer =
"
	accountToServerLoad = _this;
	publicVariableServer 'accountToServerLoad';
";

sendToServer = compile _sendToServer;
//===========================================================================
"accountToClient" addPublicVariableEventHandler 
{
	(_this select 1) spawn loadFromDBClient;
};
//===========================================================================
statFunctionsLoaded = 1;
