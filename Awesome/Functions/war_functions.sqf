
_art = ((_this select 3) select 0);

if (_art == "start_war") then
{
	warstatus = true;
	publicVariableServer "warstatus";
};
if (_art == "start_martial") then
{
	if(isNil 'martialstatus') then {
		martialstatus = false;
	};
	if(martialstatus) then {
		MessageText = "Martial Law has been lifted in Rasman ";
		scode = format ['titleText ["%1", "PLAIN"];', MessageText];
		player setVehicleInit scode;
		processInitCommands;
		clearVehicleInit player;
		scode = nil;
		martialstatus = false;
	}
	else {
		MessageText = "Martial Law has been declared in Rasman \n Civilians, you may be searched and held by the police at will";
		scode = format ['titleText ["%1", "PLAIN"];', MessageText];
		player setVehicleInit scode;
		processInitCommands;
		clearVehicleInit player;
		scode = nil;
		martialstatus = true;
	};
};