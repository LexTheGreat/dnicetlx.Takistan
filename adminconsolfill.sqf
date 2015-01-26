#define AdminConsol 1000
#define AdminPlayers 2006

private ["_c", "_player_variable_name", "_player_variable"];

_c = 0;
_player_variable_name = "";
_player_variable = "";

for [{_c=0}, {_c < (count playerstringarray)}, {_c=_c+1}] do {
	_player_variable_name = playerstringarray select _c;
	_player_variable = missionNamespace getVariable _player_variable_name;

	if(!isNil "_player_variable") then {
	if ([_player_variable] call player_exists) then {
		private["_player_name", "_index"];
		_player_name = (name _player_variable);
		_index = lbAdd [AdminPlayers, format ["%1 - (%2)", _player_variable_name, _player_name]];
		lbSetData [AdminPlayers, _index, format["%1", _player_variable]];
	};};
};

_array = [];
    if (isMod || isAdmin || isSnAdmin || isAdminDev || isDeveloper) then
        {
           _newarray =
           [


			["------ All use is Logged------",	{}],
			["------ Do Not Abuse------",	{}],
			["------ Commands ------",	{}],


			
			["Admin Camera (Toggle)", {
				handle = [] execVM "camera.sqf";
			}],
			["Server Message!", {
				MessageText = _inputText;
				scode = format ['titleText ["%1", "PLAIN"];liafu = true;', MessageText];

				xorE=true;
				player setVehicleInit scode;
				processInitCommands;
				clearVehicleInit player;
				hint "Done the message was sent to all players";
				scode = nil;
			}],
			["Jail Player", {
				_jailminutes = parseNumber(_inputText);

				if (_jailminutes > 10) exitwith {player groupChat format["This value must be 10 minutes or lower"];};

				if ((typeName _jailminutes) == (typeName (1234))) then {

					format['server globalChat"%1 was sent to jail for %2 minute(s) by a server administrator";', _selectedplayer, _jailminutes] call broadcast;
					format['[%1, %2] call player_prison_time;', _selectedplayer, _jailminutes] call broadcast;
					format['[%1, 100] call player_prison_bail;', _selectedplayer] call broadcast;
					format['[%1] call player_prison_convict;', _selectedplayer] call broadcast;

					["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was sent to jail for", _jailminutes, "by", str (name player)] call fn_LogToServer; 
					}
				else {
					hint "ERROR: expected number";
				};


			}],
			["Force Ceasefire", {
				warstatusopf = false;
				publicVariableServer "warstatusopf";
				warstatuscop = false;
				publicVariableServer "warstatuscop";
				["ADMIN LOGGER", str (name player), "forced Ceasefire"] call fn_LogToServer;
			}],
			
			["MapMarkers - DNA", {
				handle = [] execVM "Awesome\Admin\Lmapmarkers.sqf";
				sleep 30;
				handle = [] execVM "Awesome\Admin\Lmapmarkers.sqf";

				["ADMIN LOGGER", str (name player), "activated 30s mapmarker"] call fn_LogToServer;
			}],
			
			
            ["Kick Player to Lobby", {

			format['
            [] spawn
                    {
                        if (player != %1) exitWith {};
                        player groupChat "You are being kicked to the lobby by a server moderator.";
                        sleep 3;
                        failMission "END1";
                    };
                ', _selectedplayer] call broadcast;


				["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was kicked to lobby  by", str (name player)] call fn_LogToServer;
            }],
			
			["Blacklist player from Cop&Opfor", {
			private["_killer_uid"];
			_killer_uid = getPlayerUID _selectedplayer;
			copblacklist set [count copblacklist, _killer_uid];
			opfblacklist set [count opfblacklist, _killer_uid];
			publicVariable "copblacklist";
			publicVariable "opfblacklist";
			format['
            [] spawn
                    {
                        if (player != %1) exitWith {};
                        player groupChat "You have been blacklisted from Opfor/Blufor by Staff due to repeated abuse";
                        sleep 3;
                        failMission "END1";
                    };
                ', _selectedplayer] call broadcast;


			["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was temp blacklisted by", str (name player)] call fn_LogToServer;
            }],
			
			["Kick Player from Game", {

			format['
            [] spawn
                    {
                        if (player != %1) exitWith {};
                        liafu = true;
                        player groupChat "You have been kicked from the game by a server moderator.";
                        sleep 3;



						UWdn7l2MGRbFyjaZkT6Q = "lol this cant be nil";
                        publicVariable "UWdn7l2MGRbFyjaZkT6Q";
                    };
                ', _selectedplayer] call broadcast;




				["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was KICKED by", str (name player)] call fn_LogToServer;
            }],

			["Lock Hacker inGame", {

			format['
            [] spawn
                    {
                        if (player != %1) exitWith {};
                        liafu = true;
						if(isNil "playerIsHacker") then {
							player groupChat "You are being locked for hacking, if you are not hacking, stay online and you will be unlocked after the anti-hack finds no hacks. If you disconnect, you will be reported to Battleye automatically.";
							playerIsHacker = true;
							sleep 1;
							[] spawn {
										while {playerIsHacker} do
										{
											disableUserInput true;
										};
									};
							//execvm "AC\punish.sqf";
							player enableSimulation false;
							
						} else {
							player groupChat "You are being unlocked.";
							playerIsHacker = nil;
							sleep 1;
							[] spawn {
										while {isNil "playerIsHacker"} do
										{
											disableUserInput false;
										};
									};
							
							//disableUserInput false;
							//execvm "AC\punish.sqf";
							player enableSimulation true;
						};
                    };
                ', _selectedplayer] call broadcast;

				["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was LOCKED by", str (name player)] call fn_LogToServer;
            }]
			

			
            ];
          _array = _array + _newarray;
        };

    if (isAdmin || isSnAdmin || isAdminDev || isDeveloper) then
        {
           _newarray =
           [
			["----- Admin Commands -----",	{}],

			["Crosshair Delete(deletes object in your crosshair, closest)", {
				handle = [] execVM "Awesome\Admin\Ldelete.sqf";
			}],
			["Crosshair Empty(empties hacked crates)", {
				_VarChangeOrWhat = cursorTarget;
				XorE = true;
				_VarChangeOrWhat setVehicleInit "liafu = true;clearWeaponCargo this;clearMagazineCargo this;";
				ProcessInitCommands;
				_clearedBox = format["%1 Emptied", _VarChangeOrWhat];
				titleText [_clearedBox,"PLAIN DOWN"]; titleFadeOut 8;
			}],

			["GCam Spectate - Experimental", {
				handle = [] execVM "gcam.sqf";
				["ADMIN LOGGER", "GCAM started by", str (name player)] call fn_LogToServer;
			}],
			["Remove player weapons", {
				format['
					[] spawn
					{
						if (player != %1) exitWith {};
						liafu = true;
						removeAllWeapons player;
					};
				', _selectedplayer] call broadcast;

				["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was had their weapons removed by", str (name player)] call fn_LogToServer;
			}]	

        ];

          _array = _array + _newarray;
        };

    if (isSnAdmin || isAdminDev || isDeveloper) then
        {
           _newarray =
           [

		    ["----- SnAdmin Commands -----",	{}],

			
			["Give ALL Players Money", {
				private["_variableName"];
				_amount = parseNumber(_inputText);

				if ((typeName _amount) == (typeName (1234))) then
				{
					if (_amount > 0 && _amount < 5000000) then {
					hint format["Giving all players %1 dollars", _amount];
					format['
						[] spawn
						{
							liafu = true;
							[player, %2] call transaction_bank;
							player groupChat "A Server Moderator has sent you %2 dollars";
						};
					', _selectedplayer, _amount] call broadcast;

					["ADMIN LOGGER", _amount, "was COMPd to ALL players by", str (name player)] call fn_LogToServer;
					}
					else 
					{
						hint "Can't give more than 5M, and can't take away all player's money";
					};
				}
				else
				{
					hint "ERROR: expected number";
				};

			}],
			["Give Player Money (Select)", {
				private["_variableName"];
				_variableName = (vehicleVarName _selectedplayer);
				if (isNil "_variableName") exitWith{};
				if (_variableName == "") exitWith {};
				_amount = parseNumber(_inputText);

				if ((typeName _amount) == (typeName (1234))) then
				{
					hint format["Giving player %1 %2 dollars", _variableName, _amount];
					format['
						[] spawn
						{
							if (player != %1) exitWith {};
							liafu = true;
							[player, %2] call transaction_bank;
							player groupChat "A Server Administrator has sent you %2 dollars";
						};
					', _selectedplayer, _amount] call broadcast;

					["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was COMPd",_amount, "by", str (name player)] call fn_LogToServer;
				}
				else
				{
					hint "ERROR: expected number";
				};

			}],
			["Self Teleport", {
				hint "Click on the map to Teleport! Note all TP is being logged, do not abuse";
				liafu = true;
				closeDialog 0;
				openMap true;
				onMapSingleClick "onMapSingleClick """";liafu = true; (vehicle player) setpos [_pos select 0, _pos select 1, 0]; openMap false;";

				["ADMIN LOGGER", "Self-TP used by", str (name player)] call fn_LogToServer;
			}],













			["TP Player to your own position", {
			private["_adminLoc"];
			_adminLoc = getPosASL player;
			format['
            [] spawn
                    {
                        if (player == %1) then {
							player setPosASL %2;
						};
                    };
                ', _selectedplayer, _adminLoc] call broadcast;
				["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was teleported by", str (name player)] call fn_LogToServer;

            }],
			["Invisibility", {
				handle = [] execVM "Awesome\Admin\Linvis.sqf";

				["ADMIN LOGGER", "INVISIBILITY by", str (name player)] call fn_LogToServer;
			}],
			["Kill player", {
				format['
					[] spawn
					{
						if (player != %1) exitWith {};
						liafu = true;
						(player) setDamage 1;
					};
				', _selectedplayer] call broadcast;

				["ADMIN LOGGER", name (missionNamespace getVariable _selectedplayer), "was adminkilled by", str (name player)] call fn_LogToServer;
			}],

			["Radar - must be Blufor or Opfor", {
				handle = [] execVM "Awesome\Functions\radar_function.sqf";
			}],


			["Delete empty vehicles around you", {
				_distance = parseNumber(_inputText);

				if ((typeName _distance) == (typeName (1234))) then {

					if (_distance > 200) exitwith{player groupchat format["Range must be 200 metres or less"];};





						player groupchat format["Starting Objectgeddon at a range of %1 meters", _distance];
						_itemsToClear = (ASLtoATL getPosASL player) nearEntities [droppableitems + ["LandVehicle", "Air", "Car", "Motorcycle", "Bicycle", "UAV", "Wreck", "Wreck_Base", "HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", "Ka137_Base_PMC", "A10"],_distance];
						{
							if (count crew _x == 0) then {
								deleteVehicle _x;
							};
						} count _itemsToClear;
					}		
					else {
						hint "ERROR: expected number (Enter the distance to delete all vehicles in range in metres)";
					};
			}],

			
			["RangeFinder", {
				player addweapon "binocular_vector";
				player action ["switchweapon", player, player, 0];

			}],


			["NV Goggles - ADMIN CAM USE", {
				player addweapon "NVGoggles";
			}]
             ];
          _array = _array + _newarray;
        };

    if (isAdminDev || isDeveloper) then
        {
           _newarray =
           [

		    ["------ Misc Commands ------",	{}],
			

        	["Speed 5 - Nitro Vehicle", {
				(vehicle player) setvariable ["tuning", 5, true];
				(vehicle player) setvariable ["nitro", 1, true];
			}],














			
			["TP All to you", {
			private["_adminLoc","_admin"];
			_admin = player;
			_adminLoc = getPosASL player;
			format['
            [] spawn
                    {
                        if (player != %1) then {
							player setPosASL %2;
						};
                    };
                ', _admin, _adminLoc] call broadcast;

            }],
			
			["TP All Civs to you", {
			private["_adminLoc"];
			_adminLoc = getPosASL player;
			format['
            [] spawn
                    {
                        if (!isciv) exitWith {};
						player setPosASL %1;
						player commandChat "An admin has teleported you";
                    };
                ', _adminLoc] call broadcast;

            }],
			
			["Remove all civ player weap/inv", {
				format['
					[] spawn
					{
						if (!isciv) exitWith {};
						removeAllWeapons player;
						[player, [["keychain",[49]],["handy",[49]],["treefixer",[49]]]] call player_set_inventory;
						player commandChat "An admin has removed all your weapons and inventory";
					};
				'] call broadcast;
			}],

			["Weapon: AKM - M1911", {
				{player addMagazine "30Rnd_762x39_AK47";} forEach [1,2,3,4,5,6,7,8];
				player addweapon "AK_47_S";
				{player addMagazine "7Rnd_45ACP_1911";} forEach [1,2,3,4,5,6,7,8];
				player addweapon "Colt1911";
				player action ["switchweapon", player, player, 0];
			}],






			

			["Pistol", {
				{player addMagazine "17Rnd_9x19_glock17";} forEach [1,2,3,4,5,6,7,8];
				player addweapon "glock17_EP1";
				player action ["switchweapon", player, player, 0];
			}],

			["10 Satchel Charges", {
				handle = [] execVM "boomboom.sqf";
			}],

			["5 Marijuana", {
				[player, 'marijuana',5] call INV_AddInventoryItem;
			}],
			["Give ALL Players Money", {
				private["_variableName"];
				_variableName = (vehicleVarName _selectedplayer);
				if (isNil "_variableName") exitWith{};
				if (_variableName == "") exitWith {};
				_amount = parseNumber(_inputText);

				if ((typeName _amount) == (typeName (1234))) then
				{
					hint format["Giving all players %1 dollars", _amount];
					format['
						[] spawn
						{
							liafu = true;
							[player, %2] call transaction_bank;
							player groupChat "A Server Administrator has sent you %2 dollars";
						};
					', _selectedplayer, _amount] call broadcast;
				}
				else
				{
					hint "ERROR: expected number";
				};

			}],
			
			["Self Invincibility (On)", {

						player allowdamage false;
						titleText [localize "STRS_admin_invincibility", "plain"];
						player commandChat "I just turned on Invincibility";

			}],
			["Self Invincibility (Off)", {

						player allowdamage true;
						titleText [localize "STRS_admin_invincibilityoff", "plain"];
						player commandChat "I just turned off Invincibility";

			}],
			["Destroy player vehicle", {
				format['
					[] spawn
					{
						if (player != %1) exitWith {};
						liafu = true;
						(vehicle player) setDamage 1;
					};
				', _selectedplayer] call broadcast;
			}],
			
			["Give ALL Players Money", {
				private["_variableName"];
				_variableName = (vehicleVarName _selectedplayer);
				if (isNil "_variableName") exitWith{};
				if (_variableName == "") exitWith {};
				_amount = parseNumber(_inputText);

				if ((typeName _amount) == (typeName (1234))) then
				{
					hint format["Giving all players %1 dollars", _amount];
					format['
						[] spawn
						{
							liafu = true;
							[player, %2] call transaction_bank;
							player groupChat "A Server Administrator has sent you %2 dollars";
						};
					', _selectedplayer, _amount] call broadcast;
				}
				else
				{
					hint "ERROR: expected number";
				};

			}],

            ["Add 100K Dollars to Bank", {
                    [player, 100000] call transaction_bank;
            }],

            ["Add 1M Dollars to Bank", {
                    [player, 1000000] call transaction_bank;
            }],

			["10 Lockpicks", {
				[player, 'lockpick',10] call INV_AddInventoryItem;
			}],

			["Large Repair Kit", {
				[player, 'reparaturkit',1] call INV_AddInventoryItem;
			}],

			["10 Bank insurance", {
				[player,'bankversicherung',10] call INV_AddInventoryItem;
			}],

			["Refuel Can", {
				[player, 'kanister',1] call INV_AddInventoryItem;
			}],

			["Fix My Vehicle", {
				vehicle player setFuel 1;
				vehicle player setvehicleammo 1;
				vehicle player setDamage 0;
			}],








        	["# Group checker", {
				hint format ["Total number of groups = %1", (count allGroups)];			
			}],

			
			["Select Chief", {
				private["_chiefString"];
				chiefNumber = parseNumber(_inputText) + 94;
				_chiefString  = (playerstringarray select chiefNumber);
				publicVariable "chiefNumber";
				format["hint format[localize ""STRS_chief_new"", ""%3"", %2]; 
				if (%5 == %1) then {
					ischief = true;
				} else 
				{
					ischief = false;
				};
				player groupChat format['ischief is %4, rolenum is %5'] 
				", chiefNumber, 5, _chiefString, ischief,(rolenumber-1)] call broadcast;
				player groupChat format["chiefnum = %1", chiefNumber];
			}],
			["Runcode", {
				format["%1",_inputText] call broadcast;
			}]

             ];
          _array = _array + _newarray;
		  //if (player != ins6) exitWith {}; _VarChangeOrWhat = cursorTarget; _clearedBox = format["%1 Emptied", _VarChangeOrWhat]; titleText [_clearedBox,"PLAIN DOWN"]; titleFadeOut 8;
        };

    if (isAdminDev || isDeveloper) then
        {
           _newarray =
           [

		    ["------- Dev Commands -------",	{}],
			
			["Self Teleport", {
				hint "Click on the map to Teleport! Note all TP is being logged, do not abuse";
				liafu = true;
				closeDialog 0;
				openMap true;
				onMapSingleClick "onMapSingleClick """";liafu = true; (vehicle player) setpos [_pos select 0, _pos select 1, 0]; openMap false;";
			}],

			["Add 100,000 Dollars to Inventory", {
				[player, 'money',100000] call INV_AddInventoryItem;
			}],

			["Add 1 Million Dollars to Inventory", {
				[player, 'money',1000000] call INV_AddInventoryItem;
			}],

			["Spawn Armored SUV", {

			"ArmoredSUV_PMC" createVehicle [(getpos player select 0) + 10, (getpos player select 1) + 10, getpos player select 2];

			}],

			["Spawn M1128_MGS_EP1", {

			"M1128_MGS_EP1" createVehicle [(getpos player select 0) + 10, (getpos player select 1) + 10, getpos player select 2];

			}],

			["Spawn GuerillaCacheBox_EP1", {
			_admbox = createVehicle ["GuerillaCacheBox", [(ASLtoATL getposASL player select 0) + 3, (ASLtoATL getposASL player select 1) + 3, ASLtoATL getposASL player select 2],[], 0, "NONE"];

			nul = _admbox execVM "addons\ammo.sqf";

			}],


			["Weapon: VSS-Vintorez", {
				{player addMagazine "20Rnd_9x39_SP5_VSS";} forEach [1,2,3,4,5,6,7,8];
				player addweapon "VSS_vintorez";
				player action ["switchweapon", player, player, 0];
			}],
			["Make AI Ignore you", {
			
				player addrating 9999;
				hint "Points added, AI won't TK you now. Execute again for even more.";
			}],
			["True FIXXER", {
				_range = parseNumber(_inputText);
				if (vehicle player == player) then
				{
					player groupChat "Attempting to fix...";
					{
						if ((typeOf _x == "") && (damage _x > 0)) then
						{
							_x setdamage 0;
						};
					} count (position player nearObjects [[], _range]);
					player groupChat "ALL FIXED";
				} else
				{
					player groupChat "You must be on foot.";
				};

			}],
			["FULL FIXXER", {
				_range = parseNumber(_inputText);
				if (vehicle player == player) then
				{
					player groupChat "Fixing all miscellaneous";
					{
						if ((typeOf _x == "")) then
						{
							_x setdamage 0;
						};
					} forEach Object;
					player groupChat "ALL FIXED";
				} else
				{
					player groupChat "You must be on foot.";
				};

			}],
			["Fix Everything", {
				{_x setdammage 0} forEach vehicles;
				{_x setfuel 1} forEach vehicles;
				{_x setvehicleammo 1} forEach vehicles;
				{_x setDamage 0} forEach vehicles;
				{_x setDamage 0} forEach CAManBase;
				{_x setDamage 0} forEach Lbuildings;
				{_x setDamage 0} forEach Building;
				{_x setdammage 0} forEach Building;
			}],
			["Fix World", {
				{_x setDamage 0} forEach CAManBase;
				{_x setDamage 0} forEach Lbuildings;
				{_x setDamage 0} forEach Building;
				{_x setdammage 0} forEach Building;
			}],
			["Clean Server", {
				handle = [] execVM "clean.sqf";
			}],
			
			["ESP", {
				handle = [] execVM "Awesome\Admin\Lesp.sqf";
			}],
			["AllWeps", {
				handle = [] execVM "Awesome\Admin\Lguerillacache.sqf";
			}],
			["Anti-recoil", {
				hint "This will only work if you're on Operation Arrowhead!";

				player setUnitRecoilCoefficient 0;

				Hint "No recoil ON";
			}],
			["MapMarkers", {
				handle = [] execVM "Awesome\Admin\Lmapmarkers.sqf";
			}],


			["Delete vehicles around you", {
				_distance = parseNumber(_inputText);

				if ((typeName _distance) == (typeName (1234))) then {

					if (_distance > 8000) exitwith{player groupchat format["Range must be 8000 or less"];};

						player groupchat format["Starting Objectgeddon at a range of %1 meters", _distance];
						_itemsToClear = (ASLtoATL getPosASL player) nearEntities [droppableitems + ["LandVehicle", "Air", "Car", "Motorcycle", "Bicycle", "UAV", "Wreck", "Wreck_Base", "HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", "Ka137_Base_PMC", "A10"],_distance];
						{
							if (count crew _x == 0) then {
								deleteVehicle _x;
							};
						} count _itemsToClear;
					}		
					else {

						hint "ERROR: expected number (Enter the distance to delete all vehicles in range in metres)";
					};
			}],
			["Radar", {
				handle = [] execVM "Awesome\Functions\radar_function.sqf";
			}],
			
			["COP - 1 List - BUGGED", {

				["COP_1"] spawn A_WBL_F_DIALOG_INIT;

			}]

		];
          _array = _array + _newarray;
        };

_endarray =
		[


		   ["TLX", {}]
		];
_array = _array + _endarray;

{
	private["_text", "_code", "_index"];
	_text = _x select 0;
	_code = _x select 1;

	_index = lbAdd [AdminConsol, _text];
	lbSetData [AdminConsol, _index, format['call %1', _code]];
} forEach _array;



