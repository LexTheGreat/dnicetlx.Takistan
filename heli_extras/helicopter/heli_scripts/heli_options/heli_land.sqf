// Name:		heli_land_tn.sqf
// Developer:	Tyler
// Date:		10/26/2011
// Usage:		Makes the Heli land without the crew getting out

//private variables

private "_heli";

//get the heli

_heli = call FDKTZ_Find_Heli;

if (isNull _heli) then
{
	if (FDKTZ_Heli_Extras_Debug == 1) then
	{
		hint "Null returned to the heli_land_tn.sqf Script";
	};
}
else
{
	//use a loop to check if the helicopter is ready for a land command

	while { ( (alive _heli) && !(unitReady _heli) ) } do
	{
		//put a delay for rechecking the above command
		sleep 1;
	};

	//issue the order

	if (alive _heli) then
	{
		_heli land "LAND";
	};

	//Send a message to the player
	player sideChat "Roger, We will land at the marked position, Over";
};

