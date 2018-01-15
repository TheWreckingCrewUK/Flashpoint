_action = ["SpawnVehicle","Spawn Vehicle","",{[_player] spawn twc_fnc_showSpawnableHelos},{true}] call ace_interact_menu_fnc_createAction;

[HeloSpawner,0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToObject;

_action = ["SpawnVehicle","Spawn Vehicle","",{[_player] spawn twc_fnc_showSpawnableVehicles},{true}] call ace_interact_menu_fnc_createAction;

[VehicleSpawner,0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToObject;