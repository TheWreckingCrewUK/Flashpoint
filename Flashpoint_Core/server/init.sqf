#include "func\init.sqf";
#include "sys_units\init.sqf";
//Waits until players set up the base
waitUntil{twc_baseDone};
#include "sys_bluforBase\init.sqf";
execVM "Flashpoint_core\server\sys_redBase\init.sqf";
//waits until the redfor base is made
waitUntil{twc_fnc_redBaseComplete};
#include "sys_sites\init.sqf";

//Waits until all objectives are set up
waitUntil{twc_missionInitComplete};
remoteExecCall ["twc_fnc_updateTownLines",0];

//Starts Innitial GreenforAttack
execVM "Flashpoint_core\server\sys_firstAttack\init.sqf";

//The main Loop
execVM "Flashpoint_Core\server\sys_main\init.sqf";


/*
_bluScore = 0;
_redScore = 0;
_independentScore = 0;
{
	_value = 1;
	if(str (_x getVariable "townPos") == str (getPos twc_capitalLocation))then{
		_value = 100;
	};
	if((_x getVariable "townSide") == "west")then{
		_bluScore = _bluScore + _value;
	};
if((_x getVariable "townSide") == "east")then{
		_redScore = _redScore + _value;
	}; 
if((_x getVariable "townSide") == "independent")then{
		_independentScore = _independentScore + _value;
	}; 	

}forEach twc_flags;

systemChat str _bluScore;
systemChat str _redScore;
systemChat str _independentScore;