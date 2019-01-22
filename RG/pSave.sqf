waitUntil {!isNil "statsLoaded"};
sleep 120;
while {true} do
{
	private["_uid"];
	_uid = getplayerUID player;
	switch (playerSide) do
	{
		sleep 120;
		saveinprogress = true;
		player groupChat " [STATS SAVING] DO NOT EXIT ";
		case west: 
		{
			[_uid, ["moneyAccountWest", ([player] call get_bank_valuez)], ["InventoryWest", ([player] call player_get_inventory)], ["positionPlayerWest", ASLtoATL (getPosASL player)], ["BackpackPlayerWest", typeOf unitBackpack player], ["BackWepPlayerWest", getWeaponCargo (unitBackpack player)], ["BackMagPlayerWest", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
			[_uid, "MagazinesPlayerWest", ((magazines player) - ["15Rnd_9x19_M9SD"])] call fn_SaveToServer; sleep 0.1;
			if(count INV_LicenseOwner > 0) then {
				[_uid, ["privateStorageWest", ([player, "private_storage"] call player_get_array)], ["LicensesWest", INV_LicenseOwner], ["WeaponsPlayerWest", weapons player], ["FactoryWest", INV_Fabrikowner]] call fn_SaveAggToServer; sleep 0.1;
			}
			else {
				[_uid, ["privateStorageWest", ([player, "private_storage"] call player_get_array)], ["WeaponsPlayerWest", weapons player]] call fn_SaveAggToServer; sleep 0.1;
			};
			player groupChat " [STATS SAVED] ";
		};
		
		case east:
		{
			[_uid, ["moneyAccountEast", ([player] call get_bank_valuez)], ["InventoryEast", ([player] call player_get_inventory)], ["positionPlayerEast", ASLtoATL (getPosASL player)], ["BackpackPlayerEast", typeOf unitBackpack player], ["BackWepPlayerEast", getWeaponCargo (unitBackpack player)], ["BackMagPlayerEast", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
			[_uid, "MagazinesPlayerEast", ((magazines player) - ["15Rnd_9x19_M9SD"])] call fn_SaveToServer; sleep 0.1;
			if(count INV_LicenseOwner > 0) then {
				[_uid, ["privateStorageEast", ([player, "private_storage"] call player_get_array)], ["LicensesEast", INV_LicenseOwner], ["WeaponsPlayerEast", weapons player], ["FactoryEast", INV_Fabrikowner]] call fn_SaveAggToServer; sleep 0.1;
			}
			else {
				[_uid, ["privateStorageEast", ([player, "private_storage"] call player_get_array)], ["WeaponsPlayerEast", weapons player]] call fn_SaveAggToServer; sleep 0.1;
			};			player groupChat " [STATS SAVED] ";
		};
		
		case resistance:
		{
			[_uid, ["moneyAccountRes", ([player] call get_bank_valuez)], ["InventoryRes", ([player] call player_get_inventory)], ["positionPlayerRes", ASLtoATL (getPosASL player)], ["BackpackPlayerRes", typeOf unitBackpack player], ["BackWepPlayerRes", getWeaponCargo (unitBackpack player)], ["BackMagPlayerRes", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
			[_uid, "MagazinesPlayerRes", magazines player] call fn_SaveToServer; sleep 0.1;
			if(count INV_LicenseOwner > 0) then {
				[_uid, ["privateStorageRes", ([player, "private_storage"] call player_get_array)], ["LicensesRes", INV_LicenseOwner], ["WeaponsPlayerRes", weapons player], ["FactoryRes", INV_Fabrikowner]] call fn_SaveAggToServer; sleep 0.1;
			}
			else {
				[_uid, ["privateStorageRes", ([player, "private_storage"] call player_get_array)], ["WeaponsPlayerRes", weapons player]] call fn_SaveAggToServer; sleep 0.1;
			};
			player groupChat " [STATS SAVED] ";
		};
		
		case civilian:
		{
			[_uid, ["moneyAccountCiv", ([player] call get_bank_valuez)],
			["InventoryCiv", ([player] call player_get_inventory)],
			["positionPlayerCiv", ASLtoATL (getPosASL player)], ["BackpackPlayerCiv", typeOf unitBackpack player],
			["BackWepPlayerCiv", getWeaponCargo (unitBackpack player)], ["BackMagPlayerCiv", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
			[_uid, "MagazinesPlayerCiv", magazines player] call fn_SaveToServer; sleep 0.1;
			[_uid, "WarrantsCiv", [] call player_save_warrants] call fn_SaveToServer;
			if(count INV_LicenseOwner > 0) then {
				[	_uid,
					["privateStorageCiv", ([player, "private_storage"] call player_get_array)],
					["LicensesCiv", INV_LicenseOwner],
					["WeaponsPlayerCiv", weapons player],
					["FactoryCiv", INV_Fabrikowner]
				] call fn_SaveAggToServer; sleep 0.1;
			}
			else {
				[_uid, ["privateStorageCiv", ([player, "private_storage"] call player_get_array)], ["WeaponsPlayerCiv", weapons player]] call fn_SaveAggToServer; sleep 0.1;
			};
			player groupChat " [STATS SAVED] ";
		};
		
	
	};
	saveinprogress = false;
};
