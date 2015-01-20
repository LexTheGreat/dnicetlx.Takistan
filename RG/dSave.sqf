
if(!isNil "get_bank_valuez") then {

		private["_uid"];
		_uid = getplayerUID player;
		switch (playerSide) do
		{
				case west: 
				{
					[_uid, _uid, "moneyAccountWest", ([player] call get_bank_valuez)] call fn_SaveToServer;
					[_uid, _uid, "MagazinesPlayerWest", magazines player] call fn_SaveToServer;
					if(count INV_LicenseOwner > 0) then {
						[_uid, _uid, "LicensesWest", INV_LicenseOwner] call fn_SaveToServer;
					};
					[_uid, _uid, "InventoryWest", ([player] call player_get_inventory)] call fn_SaveToServer;
					[_uid, _uid, "WeaponsPlayerWest", weapons player] call fn_SaveToServer;
					[_uid, _uid, "positionPlayerWest", getMarkerPos "respawn_west"] call fn_SaveToServer;
					[_uid, _uid, "BackpackPlayerWest", typeOf unitBackpack player] call fn_SaveToServer;
					[_uid, _uid, "BackWepPlayerWest", getWeaponCargo (unitBackpack player)] call fn_SaveToServer;
					[_uid, _uid, "BackMagPlayerWest", getMagazineCargo (unitBackpack player)] call fn_SaveToServer;
				};
				
				case east:
				{
					[_uid, _uid, "moneyAccountEast", ([player] call get_bank_valuez)] call fn_SaveToServer;		
					[_uid, _uid, "MagazinesPlayerEast", magazines player] call fn_SaveToServer;
					if(count INV_LicenseOwner > 0) then {
						[_uid, _uid, "LicensesEast", INV_LicenseOwner] call fn_SaveToServer;
					};
					[_uid, _uid, "InventoryEast", ([player] call player_get_inventory)] call fn_SaveToServer;
					[_uid, _uid, "WeaponsPlayerEast", weapons player] call fn_SaveToServer;
					[_uid, _uid, "positionPlayerEast", getMarkerPos "respawn_east"] call fn_SaveToServer;
					[_uid, _uid, "BackpackPlayerEast", unitBackpack player] call fn_SaveToServer;
					[_uid, _uid, "BackWepPlayerEast", getWeaponCargo (unitBackpack player)] call fn_SaveToServer;
					[_uid, _uid, "BackMagPlayerEast", getMagazineCargo (unitBackpack player)] call fn_SaveToServer;
				};
				
				case resistance:
				{
					[_uid, _uid, "moneyAccountRes", ([player] call get_bank_valuez)] call fn_SaveToServer;
					[_uid, _uid, "MagazinesPlayerRes", magazines player] call fn_SaveToServer;
					if(count INV_LicenseOwner > 0) then {
						[_uid, _uid, "LicensesRes", INV_LicenseOwner] call fn_SaveToServer;
					};
					[_uid, _uid, "InventoryRes", ([player] call player_get_inventory)] call fn_SaveToServer;
					[_uid, _uid, "WeaponsPlayerRes", weapons player] call fn_SaveToServer;
					[_uid, _uid, "positionPlayerRes", getMarkerPos "respawn_guerrila"] call fn_SaveToServer;
					[_uid, _uid, "BackpackPlayerRes", unitBackpack player] call fn_SaveToServer;
					[_uid, _uid, "BackWepPlayerRes", getWeaponCargo (unitBackpack player)] call fn_SaveToServer;
					[_uid, _uid, "BackMagPlayerRes", getMagazineCargo (unitBackpack player)] call fn_SaveToServer;
				};
				
				case civilian:
				{
					[_uid, _uid, "moneyAccountCiv", ([player] call get_bank_valuez)] call fn_SaveToServer;
					[_uid, _uid, "MagazinesPlayerCiv", magazines player] call fn_SaveToServer;
					if(count INV_LicenseOwner > 0) then {
						[_uid, _uid, "LicensesCiv", INV_LicenseOwner] call fn_SaveToServer;
					};
					[_uid, _uid, "InventoryCiv", ([player] call player_get_inventory)] call fn_SaveToServer;
					[_uid, _uid, "WeaponsPlayerCiv", weapons player] call fn_SaveToServer;
					[_uid, _uid, "positionPlayerCiv", getMarkerPos "respawn_civilian"] call fn_SaveToServer;
					[_uid, _uid, "BackpackPlayerCiv", unitBackpack player] call fn_SaveToServer;
					[_uid, _uid, "BackWepPlayerCiv", getWeaponCargo (unitBackpack player)] call fn_SaveToServer;
					[_uid, _uid, "BackMagPlayerCiv", getMagazineCargo (unitBackpack player)] call fn_SaveToServer;
				};
		};
};
