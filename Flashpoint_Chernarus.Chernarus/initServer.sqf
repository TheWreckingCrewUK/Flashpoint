//This file defines all of the units used. To change to a new map you mostly only have to change this file.

/*
Known other changes occur in:
server\sys_cache\cacheLoadout.sqf
server\sys_vehicles\VBIED.sqf
*/
twc_bluforBases = [];
twc_greenBases = [];
twc_opforBases = [];

twc_bluScore = 100;
twc_redScore = 500;
twc_greenScore = 0;

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

twc_bluforPoints = 200;
publicVariable "twc_bluforPoints";
twc_redforPoints = 1000;
publicVariable "twc_redforPoints";
twc_greenforPoints = 50;
publicVariable "twc_greenforPoints";

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

twc_baseTransportDistance = 1000;
publicVariable "twc_baseTransportDistance";
twc_villageTransportDistance = 2000;
twc_townTransportDistance = 3000;
twc_CityTransportDistance = 4000;
twc_flagClassname = "FlagPole_F";
twc_flagTextureBlufor = "\A3\Data_F\Flags\Flag_nato_CO.paa";
twc_flagTextureRedfor = "\A3\Data_F\Flags\Flag_csat_CO.paa";
twc_flagTextureIndependent = "\A3\Data_F\Flags\Flag_green_CO.paa";
twc_flags = [];

twc_bluforControlledLocations = ["base_1","base_2","base_3","base_4","base_5","base_6","base_7","base_8","base_9","base_10"];

twc_baseDone = false;
publicVariable "twc_baseDone";
twc_fnc_redBaseComplete = false;
publicVariable "twc_fnc_redBaseComplete";
twc_missionInitComplete = false;
publicVariable "twc_missionInitComplete";

twc_bluforAAMarkers = [];

// event handlers run in the non-scheduled environment (can't be execVM)
[] call compile preprocessFile "Flashpoint_Core\server\init.sqf";