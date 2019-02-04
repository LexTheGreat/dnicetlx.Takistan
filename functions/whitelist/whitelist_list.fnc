lbClear 56;

{
	_index = lbAdd [56, format ["%1 - %2",_x select 0, _this select _ForEachIndex]];
	lbSetData [56, _index, format["%1", [_this select _ForEachIndex,_x select 1]]];
}forEach whitelist_data;
