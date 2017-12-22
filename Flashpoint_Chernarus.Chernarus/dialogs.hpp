class twc_sandBag_Dialog
{
	idd = 9999;
	movingEnabled = false;
	
	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by jayman, v1.063, #Xojihu)
////////////////////////////////////////////////////////

class twc_rsc_picture_background: RscPicture
{
	idc = 1200;

	text = "#(argb,8,8,3)color(01,0.647,0,0.75)";
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.37125 * safezoneW;
	h = 0.462 * safezoneH;
};
class twc_rsc_button_spawn: RscButton
{
	idc = 1600;
	action = "closeDialog 0; player setVariable [""twc_spawnFromBox"", true];";

	text = "SPAWN"; //--- ToDo: Localize;
	x = 0.597969 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
};
class twc_rsc_button_close: RscButton
{
	idc = 1601;
	action = "closeDialog 0";

	text = "CANCEL"; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
};
class twc_rsc_listBox: RscListBox
{
	idc = 1500;

	x = 0.324687 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.165 * safezoneW;
	h = 0.418 * safezoneH;
};
class twc_rsc_picture_item: RscPicture
{
	idc = 1201;

	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.510312 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.286 * safezoneH;
};
class twc_rsc_text_cost: RscText
{
	idc = 1001;
	
	text="COST";
	align = "center";
	x = 0.510312 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class twc_flashpoint_Dialog
{
	idd = 10000;
	movingEnabled = false;
	
	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by jayman, v1.063, #Micize)
////////////////////////////////////////////////////////

class twc_rsc_flashpoint_background: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(01,0.647,0,0.75)";
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.2475 * safezoneW;
	h = 0.396 * safezoneH;
};
class twc_rsc_flashpoint_save: RscButton
{
	idc = 1600;
	action = "closeDialog 0";
	text = "SAVE & Quit"; //--- ToDo: Localize;
	x = 0.536094 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.066 * safezoneH;
};
class twc_rsc_flashpoint_difficulty: RscButton
{
	idc = 1601;
	action = "if(ctrlText 1601 == ""Difficulty: EASY"")then{ctrlSetText [1601,""Difficulty: HARD""]; twc_flashpointDifficulty = ""hard""; publicVariable ""twc_flashpointDifficulty""}else{ctrlSetText [1601,""Difficulty: EASY""]; twc_flashpointDifficulty = ""easy""; publicVariable ""twc_flashpointDifficulty""};";
	text = "Difficulty: EASY"; //--- ToDo: Localize;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.077 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};

class twc_commander_dialog
{
	idd = 8000;
	movingEnabled = false;
	
	class controls
	{
		
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by jayman, v1.063, #Zijuvu)
////////////////////////////////////////////////////////

class twc_flashpoint_commandermenu_background: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(01,0.647,0,0.75)";
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.273281 * safezoneW;
	h = 0.374 * safezoneH;
};
class twc_flashpoint_commandermenu_cancel: RscButton
{
	idc = 1600;
	text = "Close"; //--- ToDo: Localize;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
	action = "closeDialog 0;";
};
class twc_flashpoint_commandermenu_recon: RscButton
{
	idc = 1601;
	text = "UAV Recon"; //--- ToDo: Localize;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.044 * safezoneH;
	action = "closeDialog 0; [] spawn twc_fnc_commanderUAV;";
};
class twc_flashpoint_commandermenu_airstrike: RscButton
{
	idc = 1602;
	text = "Airstrike"; //--- ToDo: Localize;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.044 * safezoneH;
	action = "closeDialog 0; [] spawn twc_fnc_commanderCasBomb;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class twc_flashpoint_flagmenu_dialog
{
	idd = 9000;
	movingEnabled = false;
	
	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by jayman, v1.063, #Bonogu)
////////////////////////////////////////////////////////

class twc_flashpoint_flagmenu_background: RscPicture
{
	idc = 1202;
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.268125 * safezoneW;
	h = 0.407 * safezoneH;
	text = "#(argb,8,8,3)color(01,0.647,0,0.75)";
};
class twc_flashpoint_flagMenu_Close: RscButton
{
	idc = 1600;
	text = "Close"; //--- ToDo: Localize;
	x = 0.561875 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
	action = "closeDialog 0;";
};
class twc_flashpoint_flagmenu_aaunit: RscButton
{
	idc = 1601;
	text = "AA Unit"; //--- ToDo: Localize;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.055 * safezoneH;
	action = "[] call twc_fnc_spawnFlagAA";
};
class twc_flashpoint_flagmenu_supplies: RscButton
{
	idc = 1602;
	text = "Supplies Box"; //--- ToDo: Localize;
	x = 0.396875 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.044 * safezoneH;
	action = """twc_SuppliesBox"" createVehicle (position player);";
};
class twc_flashpoint_flagmenu_editBase: RscButton
{
	idc = 1603;
	text = "Edit Base"; //--- ToDo: Localize;
	x = 0.402031 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.044 * safezoneH;
	action = "if((getPos player)distance2D (getPos twc_bluforBaseFlagPole) < 50)then{closeDialog 0; [] spawn twc_fnc_editBase}else{hint ""You can only edit the blufor main base""};";
};
class twc_flashpoint_flagmenu_commanderTravel: RscButton
{
	idc = 1604;
	text = "Commander Travel"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.055 * safezoneH;
	action = "closeDialog 0; [] spawn twc_fnc_commanderFlagTravel;";
};
class twc_flashpoint_flagmenu_buyUnits: RscButton
{
	idc = 1605;
	text = "Units"; //--- ToDo: Localize;
	x = 0.525781 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.055 * safezoneH;
	action = "hint ""Not Yet Implemented""";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};