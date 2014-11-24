// Contains whitelist/blacklist arrays!

//hint "test";




private["_uid"];
_uid = getPlayerUID player;

// Remember the Array format! No comma on last item in array!

// Developers

A_LIST_DEVS     =
[
	"76561198101924418", // Addition for testing. (REMOVE BEFORE PUBLISH)
	"245049094", // Fyodor
	"247857670", //lilpwn
	"76561198134427407" // Ja
];

// Directors and Deputy Directors

A_LIST_DERPS	=
[
	"245049094" // Fyodor
];

// Senior Admins

A_LIST_SNADMINS	=
[
		//"76561198018896118" //TalfieWillig
];

// Remember the Array format! No comma on last item in array!

// Admins

A_LIST_ADMINS	=
[
	"171689606", //Greasy
	"76561198056078549", //SAM ITALY
	"76561198093831210",//Turtles
	"76561198136955920", //Justin //add as mod
	"76561198130424832", //Aidan //ad as mod
	"76561198043681651", //Mez
	"76561198135899866", //BakedPotato
	"136274630" // SS Jarhead
];

// Remember the Array format! No comma on last item in array!

// Moderators

A_LIST_MODS	=
[
	"243766406", //Switch
	//"76561198083468675", //DexTer
	//"76561198049714505", //Laptopwarrior/GriswoldLog
	"76561198107780908", //Chris/Psycho
	"76561198093692248", //Oooohkillem
	"76561197969949094", //Mmetully
	"76561198114718805", //Nosce
	"76561198124176578", //1st Lt Monkey
	"76561198119216004", //Heaven
	"76561198119475641", //Riskii
	"76561198154237291",
	"76561198098170503" //King Akbur
];

isDeveloper = (getPlayerUID player) in A_LIST_DEVS;
isAdminDev = (getPlayerUID player) in A_LIST_DERPS;
isSnAdmin = (getPlayerUID player) in A_LIST_SNADMINS;

isAdmin = (getPlayerUID player) in A_LIST_ADMINS;
isMod = (getPlayerUID player) in A_LIST_MODS;
isAdmins = (isAdmin||isSnAdmin||isAdminDev||isDeveloper);
isStaff = (isAdminDev || isSnAdmin || isAdmin || isMod || isDeveloper);


// Remember the Array format! No comma on last item in array!

// Whitelisting
pmcwhitelist = [
	"76561198101924418", // Addition for testing. (REMOVE BEFORE PUBLISH)
//"92792966",
"169460806", //TLXGOD
"245049094", // Fyodor
"76561198093831210",//Turtles
"76561198057472060", //booty
"76561198098170503", //King Akbur
"76561198083468675", //DexTer
"76561198096698490", //Battlefieldproject
"76561198114718805", //Nosce
"251317574", //KillerKris
"254861574" //KillaCali3
];


//if (!(_uid in isStaff) && (call player_cop;) && (    )) then {call kick_whitelist};


// Remember the Array format! No comma on last item in array!

// Blacklisting
if(isNil "copblacklist") then {
	copblacklist = [];
};
if(isNil "opfblacklist") then {
	opfblacklist = [];
};
if(isNil "insblacklist") then {
	insblacklist = [];
};
pmcblacklist = [];

isdon = ((_uid in donators1) || (_uid in donators2) || (_uid in donators3) || (_uid in donators4) || (_uid in donatorsVIP) || (isDeveloper)); // Addition for testing, REMOVE BEFORE PUBLISH
isvip = ((_uid in donatorsVIP) or (isDeveloper)); // Addition for testing, REMOVE BEFORE PUBLISH
ispmc = ((_uid in pmcwhitelist) or (isStaff) or (isdon));

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
	
if((!ispmc) && (isciv) && rolenumber >= 60) then {
	player groupChat "You cannot join a PMC slot without donator privileges!";
	sleep 7;
	failMission "END1";};
if((!isAdmins) && rolenumber == 76) then {
	player groupChat "You cannot join a Admin slot without being an admin!";
	sleep 7;
	failMission "END1";};
if((!isvip) && rolenumber >=74 && rolenumber <= 75) then {
	player groupChat "You cannot join a VIP slot without VIP privileges!";
	sleep 7;
	failMission "END1";};
if((!isdon) && rolenumber >=71 && rolenumber <= 73) then {
	player groupChat "You cannot join a donator slot without donator privileges!";
	sleep 7;
	failMission "END1";};
if((!isdon) && rolenumber == 77) then {
	player groupChat "You cannot join a donator slot without donator privileges!";
	sleep 7;
	failMission "END1";};





