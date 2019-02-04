diag_log text "[LOG]Pre Initialization started!";
dtk_client = hasInterface;
dtk_server = !dtk_client;

/* Loades server side shit first you retards */
if (dtk_server)then {
	call compile preprocessFile "\MPMissions\functions\pre_init.sqf";
};

private ["_modules","_functions"];
dtk_fnc_total = 0;

dtk_active_modules = 
[
"Core",
"Network",
"Whitelist",
"Setup"
];

/*loads module functions*/
{
	call compile preprocessFile format["functions\%1\_module.variables",_x];
	_functions = call compile preprocessFile format ["functions\%1\_module.functions",_x];
	_module = _x;
	{
		call compile format['
		%1_%2 = compile preprocessFile "functions\%1\%1_%2.fnc";
		',_module,_x];
		dtk_fnc_num = _forEachIndex + 1;
	}forEach _functions;
	diag_log formatText ["Loaded Module - %1 With %2 Functions",_module,dtk_fnc_num];
	dtk_fnc_total = dtk_fnc_total + dtk_fnc_num;
}count dtk_active_modules;


diag_log formatText ["Total Modules: %2 Total Functions: %1",dtk_fnc_total,count dtk_active_modules];
diag_log text "[LOG]Pre Initialization finished!";
