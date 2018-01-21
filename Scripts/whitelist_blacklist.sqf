// Contains whitelist/blacklist arrays!

private["_uid"];
_uid = getPlayerUID player;

// Remember the Array format! No comma on last item in array!

// Developers

A_LIST_DEVS     =
[
	"76561198093358722" // Giovanni
];

A_LIST_TESTERS =
[
	"76561198065161712" //Stridey
];

// Directors and Deputy Directors

A_LIST_DERPS	= [];

// Senior Admins

A_LIST_SNADMINS	=
[
	"76561198134919635" // Wookie
];

// Remember the Array format! No comma on last item in array!

// Admins

A_LIST_ADMINS	=
[
	"76561198071078533", // Rogue
	"76561198044511240" // Comrade
];

// Remember the Array format! No comma on last item in array!

// Moderators

A_LIST_MODS	= 
[
	"76561198101499715", // Rex
	"76561198159209074", // Steven
	"76561198110382331", // Beans
	"76561198174971281", // Elementz
	"76561198069000590" // Elliot Wood
];

isDeveloper = (getPlayerUID player) in A_LIST_DEVS;
isTester = (getPlayerUID player) in A_LIST_TESTERS;
isAdminDev = (getPlayerUID player) in A_LIST_DERPS;
isSnAdmin = (getPlayerUID player) in A_LIST_SNADMINS;

isAdmin = (getPlayerUID player) in A_LIST_ADMINS;
isMod = (getPlayerUID player) in A_LIST_MODS;
isAdmins = (isAdmin||isSnAdmin||isAdminDev||isDeveloper);
isStaff = (isAdminDev || isSnAdmin || isAdmin || isMod || isDeveloper);


// Remember the Array format! No comma on last item in array!

// Whitelisting
pmcwhitelist = [
"169460806", //TLXGOD
"245049094", // Fyodor
"251317574", //KillerKris
"254861574" //KillaCali3
];


//if (!(_uid in isStaff) && (call player_blufor;) && (    )) then {call kick_whitelist};


// Remember the Array format! No comma on last item in array!

// Blacklisting
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

isSup = ((_uid in supporters1) || (_uid in supporters2) || (_uid in supporters3) || (_uid in supporters4) || (_uid in supportersVIP));
isVip = ((_uid in supportersVIP));
// isPmc = ((_uid in pmcwhitelist) or (isStaff) or (isSup)); BEtter way

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
/*if(_uid in opfcmdblacklist) then {
	if (rolenumber >= 73 && rolenumber <= 74) then {
		player groupChat "You are Blacklisted from Opfor Command Slots!";
		sleep 7;
		failMission "END1";
	};
};*/
