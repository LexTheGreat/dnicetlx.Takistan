if !(call whitelist_canopen)exitWith {
true
};

private ["_unit"];
createDialog "whitelist";

{
	_index = lbAdd [26, format ["%1 - (%2)",name _x, getPlayerUid _x]];
	lbSetData [26, _index, format["%1", _x]];
}forEach playableUnits;

lbSetCurSel [26, 0];

true