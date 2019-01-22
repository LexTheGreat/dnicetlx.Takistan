startmoneh = 1000000;
supportermoneh = 1000000;
silvermoneh = 1000000;
goldmoneh = 1000000;
platinummoneh = 1000000;
vipmoneh = 1000000;
//adminmoneh = 80000000;

/*if (isStaff) then {
	startmoneh = adminmoneh;
	INV_CarryingCapacity = 1000;
};*/

private["_uid"];
_uid = getPlayerUID player;

if (_uid in supporters1) then {
    startmoneh = supportermoneh;
}
else { if (_uid in supporters2) then {
    startmoneh = silvermoneh;
	INV_CarryingCapacity = 100;
}
else { if (_uid in supporters3) then {
    startmoneh = goldmoneh;
	INV_CarryingCapacity = 200;
}
else { if (_uid in supporters4) then {
	INV_CarryingCapacity = 300;
    startmoneh = platinummoneh;
}
else { if (_uid in supportersVIP) then {
    startmoneh = VIPmoneh;
	INV_CarryingCapacity = 500;
};};};};};

if (isAdmins) then {
	INV_CarryingCapacity = 1000;
};

//sleep 1;
//player groupChat "Initializing Loading Player Stats If your stats has not yet loaded after this process please relog.";
//sleep 1;
hint "Loading Stats... Please Wait";
//player groupChat "Loading";
//Requests info from server in order to download stats
//player groupChat "Loading. .";
//hint "Stats Loading 10%";
//player groupChat "Loading. . .";
//sleep 1;
//hint "Stats Loading 20%";
//hint "Stats Loading";

sleep 2;
switch (playerSide) do
{
	case west:
	{
		[player, _uid, "moneyAccountWest", "SCALAR"] call sendToServer;
		[player, _uid, "MagazinesPlayerWest", "ARRAY"] call sendToServer;
		[player, _uid, "WeaponsPlayerWest", "ARRAY"] call sendToServer;
		[player, _uid, "LicensesWest", "ARRAY"] call sendToServer;
		[player, _uid, "InventoryWest", "ARRAY"] call sendToServer;
    	[player, _uid, "privateStorageWest", "ARRAY"] call sendToServer;
		[player, _uid, "FactoryWest", "ARRAY"] call sendToServer;
		[player, _uid, "positionPlayerWest", "ARRAY"] call sendToServer;
		[player, _uid, "BackpackPlayerWest", "STRING"] call sendToServer;
		[] spawn {
			sleep 5;
			_uid = getPlayerUID player;
			[player, _uid, "BackWepPlayerWest", "ARRAY"] call sendToServer;
			[player, _uid, "BackMagPlayerWest", "ARRAY"] call sendToServer;
		};
	};

	case east:
	{
		[player, _uid, "moneyAccountEast", "SCALAR"] call sendToServer;
		[player, _uid, "MagazinesPlayerEast", "ARRAY"] call sendToServer;
		[player, _uid, "WeaponsPlayerEast", "ARRAY"] call sendToServer;
		[player, _uid, "LicensesEast", "ARRAY"] call sendToServer;
		[player, _uid, "InventoryEast", "ARRAY"] call sendToServer;
    	[player, _uid, "privateStorageEast", "ARRAY"] call sendToServer;
		[player, _uid, "FactoryEast", "ARRAY"] call sendToServer;
		[player, _uid, "positionPlayerEast", "ARRAY"] call sendToServer;
		[player, _uid, "BackpackPlayerEast", "STRING"] call sendToServer;
		[] spawn {
			sleep 5;
			_uid = getPlayerUID player;
			[player, _uid, "BackWepPlayerEast", "ARRAY"] call sendToServer;
			[player, _uid, "BackMagPlayerEast", "ARRAY"] call sendToServer;
		};
	};

	case resistance:
	{
		[player, _uid, "moneyAccountRes", "SCALAR"] call sendToServer;
		[player, _uid, "MagazinesPlayerRes", "ARRAY"] call sendToServer;
		[player, _uid, "WeaponsPlayerRes", "ARRAY"] call sendToServer;
		[player, _uid, "LicensesRes", "ARRAY"] call sendToServer;
		[player, _uid, "InventoryRes", "ARRAY"] call sendToServer;
		[player, _uid, "privateStorageRes", "ARRAY"] call sendToServer;
		[player, _uid, "FactoryRes", "ARRAY"] call sendToServer;
		[player, _uid, "positionPlayerRes", "ARRAY"] call sendToServer;
		[player, _uid, "BackpackPlayerRes", "STRING"] call sendToServer;
		[] spawn {
			sleep 5;
			_uid = getPlayerUID player;
			[player, _uid, "BackWepPlayerRes", "ARRAY"] call sendToServer;
			[player, _uid, "BackMagPlayerRes", "ARRAY"] call sendToServer;
		};
	};

	case civilian:
	{
		[player, _uid, "moneyAccountCiv", "SCALAR"] call sendToServer;
		[player, _uid, "MagazinesPlayerCiv", "ARRAY"] call sendToServer;
		[player, _uid, "WeaponsPlayerCiv", "ARRAY"] call sendToServer;
		[player, _uid, "LicensesCiv", "ARRAY"] call sendToServer;
		[player, _uid, "InventoryCiv", "ARRAY"] call sendToServer;
    	[player, _uid, "privateStorageCiv", "ARRAY"] call sendToServer;
		[player, _uid, "FactoryCiv", "ARRAY"] call sendToServer;
		[player, _uid, "positionPlayerCiv", "ARRAY"] call sendToServer;
		[player, _uid, "BackpackPlayerCiv", "STRING"] call sendToServer;
		[] spawn {
			sleep 5;
			_uid = getPlayerUID player;
			[player, _uid, "BackWepPlayerCiv", "ARRAY"] call sendToServer;
			[player, _uid, "BackMagPlayerCiv", "ARRAY"] call sendToServer;
		};
	};
};

sleep 8;
player groupChat "Player Stats Loading Complete. If your stats have not yet loaded please relog immediately or risk losing your previous stats";

hint "Loading COMPLETE!";
sleep 10;
if (isNil "bankstatsareloaded") then {
        player groupChat "No bank account stats found. Setting default starting money.";
		[player, startmoneh] call set_bank_valuez;
};
statsLoaded = 1;

if ((isSup) && !("supporter" call INV_HasLicense)) then {
INV_LicenseOwner = INV_LicenseOwner + ["supporter"];
server globalchat "supporter ACCOUNT DETECTED: supporter License Added";};

if ((isVip) && !("viplicense" call INV_HasLicense)) then {
INV_LicenseOwner = INV_LicenseOwner + ["viplicense"];
server globalchat "VIP supporter ACCOUNT DETECTED: VIP supporter License Added";};

if ((isPmc) && !("pmc_license_journeyman" call INV_HasLicense) && (playerside == civilian)) then {INV_LicenseOwner = INV_LicenseOwner + ["pmc_license_journeyman"];
			server globalchat "PMC ACCOUNT DETECTED: PMC License Added"};


// Custom License
mgslicense = [
	"76561198068079024",
	"76561198000426604",
	"76561198094294502",
	"76561198154237291"
];
jarlicense = [
	"76561198047477296",
	"76561198080206289",
	"76561198072033337",
	"76561198114597817",
	"76561198068098093",
	"76561198141964948",
	"76561198094294502",
	"76561198154237291",
	"76561198161493575",
	"76561198112447364",
	"76561198133995263"
];
bonglicense = [
	"76561198046673227",
	"76561198155614911",
	"76561198118377646",
	"76561198094294502",
	"76561198154237291"
];
SSLicense = [
	"76561198084473560",
	"76561198078405272",
	"76561198094294502",
	"76561198154237291"
];
colelicense = [
	"76561198139401322",
	"76561198094294502",
	"76561198154237291"
];
recklicense = [
	"76561198079002512",
	"76561198094294502",
	"76561198154237291"
];
karmalicense = [
	"76561198081926401",
	"76561198094294502",
	"76561198154237291"
];
nordlicense = [
	"76561198053580599",
	"76561198094294502",
	"76561198154237291"
];
drunklicense = [
	"76561198063832142",
	"76561198000426604",
	"76561198094294502",
	"76561198154237291"
];
sheplicense = [
	"76561198133658655",
	"76561198094294502",
	"76561198154237291"
];
wolflicense = [
	"76561198074752188",
	"76561198000426604",
	"76561198094294502",
	"76561198154237291"
];

// ------------

if((getPlayerUID player) in mgslicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["mgslicense"];
	server globalchat "FOXHOUND MEMBER DETECTED: METAL GEAR License Added";
};

if((getPlayerUID player) in jarlicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["jarlicense"];
	server globalchat "A wild Jarhead appears: Jarhead License Added";
};

if((getPlayerUID player) in bonglicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["bonglicense"];
	server globalchat "Friendly Neighborhood Drug Dealer Identified: Bong Reseller License Added";
};

if((getPlayerUID player) in SSLicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["grelllicense"];
	server globalchat "SS Totenkopf Identified: SS License Added";
};

if((getPlayerUID player) in colelicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["colelicense"];
	server globalchat "The Name is Bond: Bond License Added";
};

if((getPlayerUID player) in recklicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["recklicense"];
	server globalchat "Reck License Added";
};

if((getPlayerUID player) in karmalicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["karmalicense"];
	server globalchat "Don't be a bitch, cause Karma's a bitch: KarmaIsABitch License Added";
};

if((getPlayerUID player) in nordlicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["nordlicense"];
	server globalchat "Nordic License Added";
};

if((getPlayerUID player) in drunklicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["drunklicense"];
	server globalchat "Drunk Minister License Added";
};

if((getPlayerUID player) in sheplicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["sheplicense"];
	server globalchat "Shep Herder License Added";
};

if((getPlayerUID player) in wolflicense) then {
	INV_LicenseOwner = INV_LicenseOwner + ["wolflicense"];
	server globalchat "Wolfgang License Added";
};

if (isDog) then {
	server globalchat "Warning: You are going to loose all your gear!";
	server globalchat "Warning: Dog's can't carry weapons!";

	removeAllWeapons player;
	player addWeapon "ItemMap";
	player addweapon "NVGoggles";
	if (side player == west) then {
		[player, "Pastor", false] spawn C_change;
	} else {
		[player, "Fin", false] spawn C_change;
	};
};
