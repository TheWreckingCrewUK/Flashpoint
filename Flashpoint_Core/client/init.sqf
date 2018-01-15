#include "func\init.sqf";
#include "sys_player\init.sqf";
#include "sys_diary\init.sqf";
#include "sys_vehicles\init.sqf";

execVM "Flashpoint_Core\client\sys_commander\init.sqf";

_action = ["StartMission","Start Flashpoint","",{[_player] spawn twc_fnc_playerChooseBase;_return},{leader _player == _player && ((count units group player >= 4) || count allPlayers < 4)}] call ace_interact_menu_fnc_createAction;

["Land_InfoStand_V2_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;