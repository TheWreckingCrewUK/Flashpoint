if((getplayerUID player) != "_SP_PLAYER_" && (getplayerUID player) != "76561198070630639")exitWith{};

waituntil {!isnull (finddisplay 46)};

//(findDisplay 46) displayRemoveEventHandler ["KeyDown", twc_commanderTMenu];

twc_commanderTMenu = (findDisplay 46) displayAddEventHandler ["KeyDown", {
	params["_display","_key","_shift","_ctrl","_alt"];
	if(_key == 20)then{
		createDialog "twc_commander_dialog";
	};
}];

//removeAllActions player;

player addAction ["Flag Control",{
	params["_target","_caller","_id","_arguments"];
	createDialog "twc_flashpoint_flagmenu_dialog";
	
},nil,6,false,false,"","count (nearestObjects [player,[twc_flagClassname],10]) > 0",-1,false,""];