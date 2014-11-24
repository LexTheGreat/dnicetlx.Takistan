waitUntil {!isNil "statsLoaded"};
sleep 120;
while {true} do
{
	switch (playerSide) do
	{
		sleep 120;
		//player groupChat " [STATS SAVING] DO NOT EXIT ";
		private["_uid"];
		_uid = getplayerUID player;
		case west: 
		{
			private["_uid"];
			_uid = getplayerUID player;
			[_uid, _uid, "moneyAccountWest", ([player] call get_bank_valuez)] call fn_SaveToServer;
			[_uid, _uid, "MagazinesPlayerWest", magazines player] call fn_SaveToServer;
			if(count INV_LicenseOwner > 0) then {
				[_uid, _uid, "LicensesWest", INV_LicenseOwner] call fn_SaveToServer;
			};
			[_uid, _uid, "InventoryWest", ([player] call player_get_inventory)] call fn_SaveToServer;
			[_uid, _uid, "privateStorageWest", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[_uid, _uid, "FactoryWest", INV_Fabrikowner] call fn_SaveToServer;
			[_uid, _uid, "WeaponsPlayerWest", weapons player] call fn_SaveToServer;
			[_uid, _uid, "positionPlayerWest", ASLtoATL (getPosASL player)] call fn_SaveToServer;
			player groupChat " [STATS SAVED] ";
		};
		
		case east:
		{
			private["_uid"];
			_uid = getplayerUID player;
			[_uid, _uid, "moneyAccountEast", ([player] call get_bank_valuez)] call fn_SaveToServer;		
			[_uid, _uid, "MagazinesPlayerEast", magazines player] call fn_SaveToServer;
			if(count INV_LicenseOwner > 0) then {
				[_uid, _uid, "LicensesEast", INV_LicenseOwner] call fn_SaveToServer;
			};
			[_uid, _uid, "InventoryEast", ([player] call player_get_inventory)] call fn_SaveToServer;
			[_uid, _uid, "privateStorageEast", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[_uid, _uid, "FactoryEast", INV_Fabrikowner] call fn_SaveToServer;
			[_uid, _uid, "WeaponsPlayerEast", weapons player] call fn_SaveToServer;
			[_uid, _uid, "positionPlayerEast", ASLtoATL (getPosASL player)] call fn_SaveToServer;
			player groupChat " [STATS SAVED] ";
		};
		
		case resistance:
		{
			private["_uid"];
			_uid = getplayerUID player;
			[_uid, _uid, "moneyAccountRes", ([player] call get_bank_valuez)] call fn_SaveToServer;
			[_uid, _uid, "MagazinesPlayerRes", magazines player] call fn_SaveToServer;
			if(count INV_LicenseOwner > 0) then {
				[_uid, _uid, "LicensesRes", INV_LicenseOwner] call fn_SaveToServer;
			};
			[_uid, _uid, "InventoryRes", ([player] call player_get_inventory)] call fn_SaveToServer;
			[_uid, _uid, "privateStorageRes", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[_uid, _uid, "FactoryRes", INV_Fabrikowner] call fn_SaveToServer;
			[_uid, _uid, "WeaponsPlayerRes", weapons player] call fn_SaveToServer;
			[_uid, _uid, "positionPlayerRes", ASLtoATL (getPosASL player)] call fn_SaveToServer;
			player groupChat " [STATS SAVED] ";
		};
		
		case civilian:
		{
			private["_uid"];
			_uid = getplayerUID player;
			[_uid, _uid, "moneyAccountCiv", ([player] call get_bank_valuez)] call fn_SaveToServer;
			[_uid, _uid, "MagazinesPlayerCiv", magazines player] call fn_SaveToServer;
			if(count INV_LicenseOwner > 0) then {
				[_uid, _uid, "LicensesCiv", INV_LicenseOwner] call fn_SaveToServer;
			};
			[_uid, _uid, "InventoryCiv", ([player] call player_get_inventory)] call fn_SaveToServer;
			[_uid, _uid, "privateStorageCiv", ([player, "private_storage"] call player_get_array)] call fn_SaveToServer;
			[_uid, _uid, "FactoryCiv", INV_Fabrikowner] call fn_SaveToServer;
			[_uid, _uid, "WeaponsPlayerCiv", weapons player] call fn_SaveToServer;
			[_uid, _uid, "positionPlayerCiv", ASLtoATL (getPosASL player)] call fn_SaveToServer;
			player groupChat " [STATS SAVED] ";
		};
		
	
	};
};
