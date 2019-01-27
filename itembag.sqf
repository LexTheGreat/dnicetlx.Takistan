_art = _this select 0;

if (_art == "use") then {
	_item   = _this select 1;
	_deleted = 0;
	
	if (vehicle player == player) then{
		{
			deleteVehicle _x;
			_deleted = _deleted + 1;
		} forEach (nearestObjects [player, ["Suitcase"], 5]);

		player groupChat format[localize "STRS_inv_items_itemdeleted", _deleted];
	} else {
		player groupchat "you must be on foot";
	};
	if (_deleted > 0) then {
		[player, _item, -(1)] call INV_AddInventoryItem;
	};
};