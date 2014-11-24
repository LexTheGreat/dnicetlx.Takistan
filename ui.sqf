/*
The Roleplay Project: Reloaded
Copyright (C) 2011  Matthew Simms
*/

[] spawn {

	while {true} do
	{
			private["_health", "_healthtextcol","_war","_warcol"];
			disableSerialization;
			100 cutRsc ["RPP_Dlg_ui", "PLAIN"];
			//_money = ([player,"money"] call INV_GetItemAmount);
			_health = 100 - (round ((damage player)*100));
			//_maxbank = ([player,"bankaccount"] call bank_get_value);
			if(_health >= 80) then {
				_healthtextcol = "#347c17";
			}
			else {
				if(_health >= 30) then {
					_healthtextcol = "#ffff00";
				}
				else {
					_healthtextcol = "#ff0000";
				};
			};
			
			if(_health <= 0) then{
				_healthtextcol = "#ff0000";
				_health = "DEAD";
			};
			if(!warstatus) then {
				_war = "PEACE";
				_warcol = "#347c17";
			}
			else {
				if(peacecomps) then {
					_war = "CEASFIRE";
					_warcol = "#ffff00";
				}
				else {
					_war = "WAR ACTIVE";
					_warcol = "#ff0000";
				};
			};
			
			((RPP_display_ui select 0) displayCtrl 1) ctrlSetStructuredText parseText format["<t align='right' size='1.15'><t shadow='1'shadowColor='#000000'><t color='#347c17'>Health: <t color='%2'>%1 <t color='#ff8400'><br/>Server Uptime: %3 Min <br/><t color='%4'>%5<br/><t color='#E8E06F'> Teamspeak: 107.150.61.10</t></t>", _health, _healthtextcol, (round(time/60)),_warcol,_war];
			sleep 1;
	};
};
