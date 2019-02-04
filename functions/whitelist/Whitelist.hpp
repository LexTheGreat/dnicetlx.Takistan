class whitelist
{
	idd = -1;
	
	class ControlsBackground{};
	class Controls
	{
		class Control1613797786 : RscListBox
		{
			type = 5;
			idc = 56;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.1775;
			h = safeZoneH * 0.44;
			style = 16;
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLBSelChanged = "call whitelist_add";
		};
		class Control1736259676 : RscCombo
		{
			type = 4;
			idc = 26;
			x = safeZoneX + safeZoneW * 0.4175;
			y = safeZoneY + safeZoneH * 0.70333334;
			w = safeZoneW * 0.173125;
			h = safeZoneH * 0.03777778;
			style = 16;
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorSelectBackground[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onLBSelChanged = "call whitelist_update";

		};
		class dummybutton : RscDummy 
		{
			idc = 2;
			
		};
		class RscBackground_2202 : RscBackground 
		{
			idc = 2202;
			x = safeZoneX + safeZoneW * 0.40625;
			y = safeZoneY + safeZoneH * 0.23111112;
			w = safeZoneW * 0.19875;
			h = safeZoneH * 0.52;
			
		};
		class RscBackground_2203 : RscBackground 
		{
			idc = 2203;
			x = safeZoneX + safeZoneW * 0.40625;
			y = safeZoneY + safeZoneH * 0.20111112;
			w = safeZoneW * 0.199375;
			h = safeZoneH * 0.03444445;
			text = "Whitelist Panel";
			colorBackground[] = {0.294,0.325,0.125,1};
			
		};
		
	};
	
};
