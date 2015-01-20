private["_display","_channelDisplay","_text1","_channel","_micDisplay","_mic1"];
        disableSerialization;
        _channelDisplay = findDisplay 63;
		_micDisplay = findDisplay 55;
        if( !isNull _channelDisplay && !isNull _micDisplay) then {
				_text1 = ctrlText (_micDisplay displayCtrl 101);
				_mic1 = '\ca\ui\textures\mikrak.paa';
                _channel = ctrlText (_channelDisplay displayCtrl 101);
                if( _channel == "Global channel" && _text1 == _mic1) then {
						if(!(isNil "global_voice_warnings")) exitWith { };
						global_voice_warnings = 0;
						//player enableSimulation false
                        while{global_voice_warnings <= 5} do {
							_text1 = ctrlText (_micDisplay displayCtrl 101);
							_channel = ctrlText (_channelDisplay displayCtrl 101);
							if( _channel == "Global channel" && _text1 == _mic1) then {
								player commandchat format ["GET OFF GLOBAL VOICE %1 OR YOU'LL BE KICKED ",name player] call broadcast;
								hint format["STAY OFF GLOBAL VOICE %1",name player] call broadcast;
								sleep 0.5;
								if(global_voice_warnings >= 5) then {
									player commandchat format ["You were warned %1... Enjoy your kick",name player] call broadcast;
									UWdn7l2MGRbFyjaZkT6Q = "lol this cant be nil";
									publicVariable "UWdn7l2MGRbFyjaZkT6Q";
								};
							}
							else {
								global_voice_warnings = nil;
							};
							global_voice_warnings = global_voice_warnings + 1;
							//player enableSimulation true;
							};
						};			
                };