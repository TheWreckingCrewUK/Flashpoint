//This file defines all of the units used. To change to a new map you mostly only have to change this file.

/*
Known other changes occur in:
server\sys_cache\cacheLoadout.sqf
server\sys_vehicles\VBIED.sqf
*/

//Enable or Disable Debug
twc_serverDebug = false;

twc_surrenderVote = false;

/*
* Denotes the style of building to be used, for dynamic compositions.
* For example: the IED factory.
*
* Known Types:
* "Med" - Mediterranean
* "MidEast" - Middle East
* "IRA" - Irish
*/
TWC_Building_Style = "Med";

_script = execVM "Flashpoint_Core\SHK_pos\shk_pos_init.sqf";
waitUntil{scriptDone _script};

twc_flashpointDifficulty = "easy";
publicVariable "twc_flashpointDifficulty";

//Sets up the Extra Sites:
twc_capitalFlag = "Faction_CUP_CDF";
twc_cityFlag = "mil_circle";
twc_villageFlag = "c_unknown";
twc_airportFlag = "o_plane";
twc_localFlag = "o_installation";
twc_radioFlag = "loc_Transmitter";
twc_powerFlag = "loc_Power";

twc_radioTowers = ["Land_Telek1","Land_A_TVTower_Base","Land_Vysilac_FM"];
twc_powerPlants = ["Land_Trafostanica_velka"];

twc_outpostNames = ["outpost_1"];
twc_radioNames = ["radio_1"];
twc_installationNames = ["factory_1"];

twc_dumbLocations = ["Cap Golova","Drakon","Otmel","Krutoy Cap"];

twc_townTransportDistance = 8000;
twc_flags = [];

twc_bluforControlledLocations = ["base_1","base_2","base_3","base_4","base_5","base_6","base_7","base_8","base_9","base_10"];

//Sets up the unit Caching. I have no idea why i have to sleep and wait.
[]spawn{sleep 120;
["CAManBase","init",{
	if(leader (_this select 0) == (_this select 0))then{
		[false,(group (_this select 0)),1000] spawn twc_fnc_initAICache
	};
}, true, nil, true] call CBA_fnc_addClassEventHandler;

["AllVehicles","init",{
	[false,(_this select 0),1000] spawn twc_fnc_initVehicleCache
}, true, ["Man","Static"], true] call CBA_fnc_addClassEventHandler;
};
// event handlers run in the non-scheduled environment (can't be execVM)

twc_baseDone = false;
publicVariable "twc_baseDone";

[] call compile preprocessFile "Flashpoint_Core\server\init.sqf";