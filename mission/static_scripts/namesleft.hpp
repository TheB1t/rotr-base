#include "common.hpp"
#define names_idc 99999
class HudMedic 
{
	idd = -1;
	fadeout=0;
	fadein=0;
	duration = 10000000000;
	name= "HudMedic";
	onLoad = "uiNamespace setVariable ['HudMedic', _this select 0]";
	class controlsBackground 
	{
		class HudMedic_1: RscStructuredText
		{
			idc = 66666;
			type = CT_STRUCTURED_TEXT;
            size = 0.040;
            x = (SafeZoneXAbs + SafeZoneW * 0.85);
            y = (SafeZoneY + SafeZoneH * 0.25);
            w = SafeZoneW * 0.15; h = SafeZoneH * 0.7;
            colorText[] = {1,1,1,1};
            lineSpacing = 3;
            colorBackground[] = {0,0,0,0};
            text = "";
            font = "PuristaLight";
            shadow = 2;
            class Attributes 
			{
                align = "left";
            };
        };
    };
};