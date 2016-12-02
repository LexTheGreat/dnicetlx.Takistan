_art = _this select 0;

if (_art == "use") then {

	_item   = _this select 1;
	_anzahl = _this select 2;

	[player, _item, -1] call INV_AddInventoryItem;
	if(vehicle player != player)exitwith{player groupchat "You can't use this in a vehicle!"};
	if(!(player call INV_Heal))exitwith{};
};
