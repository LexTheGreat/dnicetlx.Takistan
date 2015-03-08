if (!isNil "statsLoaded") then {
	if(!isNil "get_bank_valuez") then {
		if (!saveinprogress) then {
			saveinprogress = true;
			private["_uid"];
			_uid = getplayerUID player;
			switch (playerSide) do
			{
					case west: 
					{
						[_uid, ["moneyAccountWest", ([player] call get_bank_valuez)], ["InventoryWest", ([player] call player_get_inventory)], ["WeaponsPlayerWest", weapons player], ["BackpackPlayerWest", typeOf unitBackpack player], ["BackWepPlayerWest", getWeaponCargo (unitBackpack player)], ["privateStorageWest", ([player, "private_storage"] call player_get_array)]] call fn_SaveAggToServer; sleep 0.1;

						if(!savedelay) then {
							[_uid, ["MagazinesPlayerWest", ((magazines player) - ["15Rnd_9x19_M9SD"])], ["BackMagPlayerWest", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
						};
					};
					
					case east:
					{
						[_uid, ["moneyAccountEast", ([player] call get_bank_valuez)], ["InventoryEast", ([player] call player_get_inventory)], ["WeaponsPlayerEast", weapons player], ["BackpackPlayerEast", typeOf unitBackpack player], ["BackWepPlayerEast", getWeaponCargo (unitBackpack player)], ["privateStorageEast", ([player, "private_storage"] call player_get_array)]] call fn_SaveAggToServer; sleep 0.1;

						if(!savedelay) then {
							[_uid, ["MagazinesPlayerEast", ((magazines player) - ["15Rnd_9x19_M9SD"])], ["BackMagPlayerEast", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
						};
						
					};
					
					case resistance:
					{
						[_uid, ["moneyAccountRes", ([player] call get_bank_valuez)], ["InventoryRes", ([player] call player_get_inventory)], ["WeaponsPlayerRes", weapons player], ["BackpackPlayerRes", typeOf unitBackpack player], ["BackWepPlayerRes", getWeaponCargo (unitBackpack player)], ["privateStorageRes", ([player, "private_storage"] call player_get_array)]] call fn_SaveAggToServer; sleep 0.1;

						if(!savedelay) then {
							[_uid, ["MagazinesPlayerRes", magazines player], ["BackMagPlayerRes", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
						};

					};
					
					case civilian:
					{
						[_uid, ["moneyAccountCiv", ([player] call get_bank_valuez)], ["InventoryCiv", ([player] call player_get_inventory)], ["WeaponsPlayerCiv", weapons player], ["BackpackPlayerCiv", typeOf unitBackpack player], ["BackWepPlayerCiv", getWeaponCargo (unitBackpack player)], ["privateStorageCiv", ([player, "private_storage"] call player_get_array)]] call fn_SaveAggToServer; sleep 0.1;

						if(!savedelay) then {
							[_uid, ["MagazinesPlayerCiv", magazines player], ["BackMagPlayerCiv", getMagazineCargo (unitBackpack player)]] call fn_SaveAggToServer; sleep 0.1;
						};
					};
			};
			saveinprogress = false;
			if (!savedelay) then {
				savedelay = true;
				sleep 20;
				savedelay = false;
			};
		};
	};
};