private["_position", "_max_height", "_inVehicle"];
_max_height = 5;
_position = getPosATL player;
_inVehicle = ((vehicle player) != player);

if ((_position select 2) > _max_height && _inVehicle) exitWith {
  player groupChat format["Suicide bombs can only be used at ground level"];
};

if ((player distance (getmarkerpos "respawn_civilian")) < 130) exitWith {
  player groupchat "Some supernatural force prevents you from detonating a bomb in this holy place!"
};

"hint localize ""STRS_inv_item_selbstmordbombe_globalmsg_dog"";" call broadcast;
liafu = true;
for [{_i=5}, {_i >= 0}, {_i=_i-1}] do {
  titletext [format ["Bombcountdown: -->*%1*<--", _i],"plain"];
  sleep 1;
};

if (!(alive player)) exitWith {};
call compile format ["liafu = true; autobombe%2 = createVehicle [""Bo_GBU12_LGB"", (%1), [], 0, ""NONE""];",(getpos player), (round (random 2000))];
