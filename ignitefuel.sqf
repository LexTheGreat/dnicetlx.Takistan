_art = _this select 0;
if (_art == "use") then {
	_item   = _this select 1;
	_anzahl = _this select 2;
	if (player == vehicle player)  exitWith {
		player groupChat localize "STRS_inv_items_ignite_ignite_notincar";
	};

	if ((damage vehicle player) == 1) exitWith {
		player groupChat localize "STRS_inv_items_repair_notneeded";
	};																							   

	vehicle player setDamage 0.95;
	liafu2 = true;
	player groupchat localize "STRS_inv_items_ignite_ignite";
	[player, _item, -1] call INV_AddInventoryItem;
};