//Stuff that happens on player respawnVehicle

//If player isn't west then kick them. Apparently players respawning as civ is an issue?
if(side player != west)then{
	call BIS_fnc_endMission;
};

//Make sure medics are medics
if(typeOf player in ["Modern_British_Medic","Modern_USMC_Medic"])then{
	player setVariable ["ace_medical_medicClass",1];
};

//Sets Direction
player setPos (getMarkerPos "respawn_West");
if(!(isNil "twc_respawnDir"))then{
	player setDir twc_respawnDir;
};