_baseListAction = ["BaseListAction","Base","", {},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _baseListAction] call ace_interact_menu_fnc_addActionToObject;

_actionSpawnPoint = ["FlashpointSetSpawn","Set Respawn","",{"respawn_West" setMarkerPos (getPos player); twc_respawnDir = getDir player; publicVariable "twc_respawnDir"},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","BaseListAction"], _actionSpawnPoint] call ace_interact_menu_fnc_addActionToObject;

_actionAmmoBox = ["FlashpointSetAmmoSpawn","Set AmmoBox","",{"crate" setMarkerPos (getPos player); crateBox disableCollisionWith player; crateBox setPosATL (getMarkerPos "crate"); hint "You have 5 seconds until collison with ammobox is enabled"; []spawn{sleep 5; crateBox enableCollisionWith player}},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","BaseListAction"], _actionAmmoBox] call ace_interact_menu_fnc_addActionToObject;

_actionVehicleSpawn = ["FlashpointVehicleSpawn","Set Vehicle Spawn","",{vehicleSpawnPad setPos (getPos player); vehicleSpawnPad setDir (getDir player)},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","BaseListAction"], _actionVehicleSpawn] call ace_interact_menu_fnc_addActionToObject;

_actionHelicopterSpawn = ["FlashpointHelicopterSpawn","Set Helicopter Spawn","",{helicopterSpawnPad setPos (getPos player); helicopterSpawnPad setDir (getDir player)},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","BaseListAction"], _actionHelicopterSpawn] call ace_interact_menu_fnc_addActionToObject;

_actionFinishBase = ["FlashpointFinishBase","Finish Base","",{Hint "Base Finished"; twc_baseDone = true; publicVariable "twc_baseDone"},{[_player] call twc_fnc_isBaseValid}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","BaseListAction"], _actionFinishBase] call ace_interact_menu_fnc_addActionToObject;

_actionRestartBase = ["FlashpointRestartBase","Restart","",{{_x setPos (getPos StartingStand)}forEach allPlayers;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","BaseListAction"], _actionRestartBase] call ace_interact_menu_fnc_addActionToObject;

waitUntil {twc_baseDone};

{
	_x setPos (getMarkerPos "respawn_West");
	_x setDir twc_respawnDir;
}forEach allPlayers;

twc_bluforBaseFlagPole setPos (getMarkerPos "respawn_West");
twc_flags pushback twc_bluforBaseFlagPole;
twc_bluforBaseFlagPole  setVariable ["townSide",West];
twc_bluforBaseFlagPole setVariable ["twc_transportDistance",twc_baseTransportDistance];
twc_bluforBaseFlagPole setVariable ["twc_mainBase",true];
twc_bluforBaseFlagPole setVariable ["townPos",(getMarkerPos "respawn_West")];
twc_bluforBaseFlagPole setVariable ["townValue",100];
twc_bluforBaseFlagPole setVariable ["connectedToBase",true,true];
twc_bluforBases pushback twc_bluforBaseFlagPole;

[player,1,["ACE_SelfActions","BaseListAction","FlashpointSetSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointSetAmmoSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointVehicleSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointHelicopterSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointFinishBase"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointRestartBase"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction"]] call ace_interact_menu_fnc_removeActionFromObject;