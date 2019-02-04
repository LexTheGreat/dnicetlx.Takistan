private ["_Target","_Prams","_Sceduled","_Function","_OnClient","_Allowed","_MPPaket"];

_Target = (_this select 0);
_Prams = (_this select 1);
_Function = (_this select 2);
_Sceduled = (_this select 3);
_OnClient = (_this select 4);
_MPPaket = [_Prams,_Function,_Sceduled,name player];

switch(typeName _target)do
{
	case "OBJECT":
	{
		if (local _target)then
		{
			[_Prams,_Function,_Sceduled]call network_Run;
		}
		else
		{
			if (_OnClient)then {
			[_Prams,_Function,_Sceduled]call  network_Run;
			};
			
			if (dtk_server)then {
				_owner = owner _target;
				missionNamespace setVariable [MPID,_MPPaket];
				_owner publicVariableClient MPID;
			}else{
				["SERVER",_this,"network_MPExec",false,false]call network_MPExec;
			};
		};
	};
	case "STRING":
	{
		if (_OnClient)then {
		[_Prams,_Function,_Sceduled]call  network_Run;
		};
	
		if (_target == "SERVER")then
		{
			missionNamespace setVariable [MPID,_MPPaket];
			publicVariableServer MPID;
		};
		if (_target == "ALL")then
		{
			missionNamespace setVariable [MPID,_MPPaket];
			publicVariable MPID;
		};
	};
	default {diag_log formatText ['[ERROR] MPFRAMEWORK | INVALID TARGET | %1',_this]; };
};
