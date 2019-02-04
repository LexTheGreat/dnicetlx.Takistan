

{
	missionNamespace setVariable [_x select 1,_this select _forEachIndex];
	systemchat format ["Whitelist loaded: %1 - %2",_x select 1,_this select _forEachIndex];
}forEach whitelist_data;

isAdmins = (isAdmin||isSnAdmin||isAdminDev||isDeveloper);
isStaff = (isAdminDev or isSnAdmin || isAdmin || isMod || isDeveloper);

systemchat str isStaff;


isSup = (supporters1 || supporters2 || supporters3 || supporters4 || supportersVIP);
isVip = supportersVIP;

if(isNil "copblacklist") then {
	copblacklist = [
	
	];
};
if(isNil "opfblacklist") then {
	opfblacklist = [
	
	];
};
if(isNil "opfcmdblacklist") then {
	opfcmdblacklist = [

	];
};
if(isNil "insblacklist") then {
	insblacklist = [

	];
};
pmcblacklist = [

];

_side = playerSide;
if((_uid in copblacklist) && (_side == west)) then {
	player groupChat "You are Blacklisted from Blufor!";
	sleep 7;
	failMission "END1";
};

if((_uid in opfblacklist) && (_side == east)) then {
	player groupChat "You are Blacklisted from Opfor!";
	sleep 7;
	failMission "END1";};

if((_uid in insblacklist) && (_side == resistance)) then {
	player groupChat "You are Blacklisted from Insurgent!";
	sleep 7;
	failMission "END1";};

if(isPmc && !isSup) then {
	player groupChat "!!!!WARNING!!!!";
	player groupChat "PMC requires you to have [PMC] in your name. You are required to be on teamspeak, with police training!";
	player groupChat "This message is because you are not a supporter. Supporters don't need the police training to play as PMC.";
	//sleep 7;
	// failMission "END1";
};
if((!isAdmins) && isAdmSlot) then {
	player groupChat "You cannot join a Admin slot without being an admin!";
	sleep 7;
	failMission "END1";};
if((!isVip) && isVipSlot) then {
	player groupChat "You cannot join a VIP slot without VIP privileges!";
	sleep 7;
	failMission "END1";};
_notAllowed = false;
if(!isSup && isSupSlot) then {
	player groupChat "You cannot join a supporter slot without supporter privileges!";
	sleep 7;
	failMission "END1";
};
if(!(isStaff || isTester)) then {
	if(isAdmSlot) then {
		player groupChat "You cannot join a Developer slot without Developer privileges!";
		sleep 7;
		failMission "END1";
	};
};