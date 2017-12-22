hint "Base Edit Options have been added to ACE Self Interact";

twc_baseDone = false;
publicVariable "twc_baseDone";

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

_actionFinishBase = ["FlashpointFinishBase","Finish Base","",{Hint "Base Finished"; twc_baseDone = true; publicVariable "twc_baseDone"},{(getPos player) distance2D (getMarkerPos "respawn_West") < 400 && (getPos player) distance2D (getPos crateBox) < 400 && (getPos player) distance2D (getPos vehicleSpawnPad) < 400 && (getPos player) distance2D (getPos helicopterSpawnPad) < 400}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","BaseListAction"], _actionFinishBase] call ace_interact_menu_fnc_addActionToObject;

waitUntil {twc_baseDone || (player distance2D (getMarkerPos "respawn_West") > 1000)};

twc_bluforBaseFlagPole setPos (getMarkerPos "respawn_West");
twc_bluforBaseFlagPole setVariable ["townPos",(getMarkerPos "respawn_West")];

remoteExecCall ["twc_fnc_updateTownLines",0];

[player,1,["ACE_SelfActions","BaseListAction","FlashpointSetSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointSetAmmoSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointVehicleSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointHelicopterSpawn"]] call ace_interact_menu_fnc_removeActionFromObject;
ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointFinishBase"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction","FlashpointRestartBase"]] call ace_interact_menu_fnc_removeActionFromObject;
[player,1,["ACE_SelfActions","BaseListAction"]] call ace_interact_menu_fnc_removeActionFromObject;