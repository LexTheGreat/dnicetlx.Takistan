
{
	if (!isNil format["%1_jip",_x] && {_x != "Setup"})then {
		_this call call compile format["%1_jip",_x];
	};
}count dtk_active_modules;

if (dtk_server)then 
{
	{
		if (!isNil format["S_%1_jip",_x] && {_x != "Setup"})then {
			_this call call compile format["S_%1_jip",_x];
		};
	}count dtk_server_modules;
};
