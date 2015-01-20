_save =
"
	accountToServerSave = _this;
	publicVariableServer 'accountToServerSave';
";

_log = 
"
	serverLogger = _this;
	publicVariableServer 'serverLogger';
";

fn_SaveToServer = compile _save;
fn_LogToServer = compile _log;

/*private["_uid"];
_uid = getplayerUID player;
_now = date;
_
["_connectionhistory", date, "WeaponsPlayerWest", weapons player] call fn_SaveToServer;
*/
