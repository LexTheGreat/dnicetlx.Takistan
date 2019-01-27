_art = _this select 0;

if (_art == "use") then {
	_item   = _this select 1;
	_deleted = 0;
	
	if (vehicle player == player) then{
		{
			deleteVehicle _x;
			_deleted = _deleted + 1;
		} forEach (nearestObjects [player, ["Suitcase"], 5]);

		player groupChat format[localize "STRS_inv_items_weapondeleted", _deleted];
	} else {
		format ["clearWeaponCargo %1; clearMagazineCargo %1;", (vehicle player)] call broadcast;
		player groupChat "STRS_inv_items_weaponcargocleared";
		_deleted = 1;
	};
	if (_deleted > 0) then {
		[player, _item, -(1)] call INV_AddInventoryItem;
	};
};