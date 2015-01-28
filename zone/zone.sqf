zones = ["opforZone", "centerZone", "bluforZone"];
capturing = false;
lockpos = false;

if(!warstatus) then {
	{
        _x setMarkerAlphaLocal 0
    } foreach zones;
};

zone_capture = {
    if(capturing) exitWith {
        hint "Please Wait!";
    };
    
    private["_curOwner", "_zone"];
    _zone = _this select 0;
    _flag = format["%1Flag",_zone];
    
    _curOwner = [_zone] call zone_getOwner;

    if(_curOwner == side player && side player != civilian && side player != resistance) exitWith {
        hint "You can't capture this, incorrect team!";
    };
    
    if(!warstatus) exitWith {
        hint "You can't capture this, war is not active!";
    };
    
    capturing = true;
    lockpos = position player;
    hint "Capturing! 15s";
    format ["%1 switchmove 'AinvPknlMstpSlayWrflDnon_medic';", player] call broadcast;
	sleep 5;
	format ["%1 switchmove 'AinvPknlMstpSlayWrflDnon_medic';", player] call broadcast;
	sleep 5;
	format ["%1 switchmove 'AinvPknlMstpSlayWrflDnon_medic';", player] call broadcast;
	sleep 5;
    capturing = false;
    
    // Check if near, if not cancel. Should stop it from cap'n if killed
    if (player distance lockpos > 1) exitWith {
        hint 'Flag Capture canceled';
    };
    lockpos = false;
    [_zone, side player] call zone_setOwner;
    format["player sideChat '%2 captured %1!'; ", _zone, side player] call broadcast;
};

zone_setOwner = {
    private["_checkTeam", "_zone"];
    _zonestOwn = _this select 0;
    _chkTeamOwn = _this select 1;
    
    if(_chkTeamOwn == east) then {
    	_zonestOwn setMarkerColor "ColorRed";
    };
    
    if(_chkTeamOwn == west) then {
        _zonestOwn setMarkerColor "ColorBlue";
    };
};

zone_getOwner = {
    private["_checkTeam", "_team"];
    _chkZone = _this select 0;
    
    // Treat Civ like null ie if owner == civilian then no one owns it
    _teamown = civilian;
    
    if(getMarkerColor _chkZone == "ColorRed") then {
        _teamown = east;
    };
    
    if(getMarkerColor _chkZone == "ColorBlue") then {
        _teamown = west;
    };
    
    _teamown
};

zone_getCount = {
    private["_checkTeam", "_count"];
    _chkTeamcnt = _this select 0;
    _count = 0;
    
    {
        if([_x] call zone_getOwner == _chkTeamcnt) then {
            _count = _count + 1
        }
    } foreach zones;
    
    _count
};