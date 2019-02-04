private ["_unit"];

_unit = call compile lbData [26, lbCurSel 26];

["SERVER",[player,_unit],"s_whitelist_fetch",false,false]call network_mpexec;
