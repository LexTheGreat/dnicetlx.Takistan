_art = _this select 0;
_range = 50;

if (_art == "use") then
{
	if (vehicle player == player) then
	{
		player groupChat "Attempting to fix...";
		player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
		{
			if ((typeOf _x == "") && (damage _x > 0)) then
			{
				_x setdamage 0;
				[player, "money", treefixreward] call INV_AddInventoryItem;
				player groupchat format["You received $%1 for repairing this object!", treefixreward];
			};
		} forEach (nearestObjects [player,[], _range]);
		player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	} else
	{
		player groupChat "You must be on foot.";
	};
};
