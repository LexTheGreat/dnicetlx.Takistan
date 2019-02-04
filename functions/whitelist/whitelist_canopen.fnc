private ["_return"];

_return = {
	if (call (_x select 2))exitWith {
		true
	};
	false
}forEach whitelist_data;
_return