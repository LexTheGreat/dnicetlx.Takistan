/*_t1 = diag_tickTime;
// ... code to test
(diag_tickTime - _t1, "NAME") call _fnc_dump;
*/
slowest_fps = 0;
//[diag_tickTime - _t1, "SRVR LOOP SCRIPT"] call fnc_fps_hi_log; 
fnc_fps_hi_log = {
	if (_this select 0 > slowest_fps) then {
		slowest_fps = _this select 0;
		diag_log str _this;
	};
};

fnc_fps_log = {
		diag_log str _this;
};