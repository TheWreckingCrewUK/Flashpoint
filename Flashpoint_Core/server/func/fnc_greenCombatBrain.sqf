/*
*	Function for Greenfor AI Decision Making During Flag Combat
*
* Params
* 1: Flag <OBJECT>
*
* Example:
* [flag] spawn twc_fnc_greenCombatBrain
*
* Returns NOTHING
*/
params["_flag"];

_pos = _flag getVariable "townPos";
systemChat "Greenfor combat Brain started";

//Initial Random Sleeps to Simulate Hostiles Sending Radio Transmissions
sleep 30;
uiSleep (random 60);

//Combat Brain Loop
while{_flag getVariable "townCombat"}do{
	[_pos,_flag]call{
		params["_pos","_flag"];
		//First Thing is if blufor Tanks it wants to send a rocket plane at them
		_allTanks = nearestObjects [_pos, ["Tank"], 600];
		_bluTanks = [];
		{
			if(side _x == West)then{
				_bluTanks pushback _x;
			};
		}forEach _allTanks;
		_rand = random 100;
		if(count _bluTanks > 0 && _rand < 33 && twc_greenScore > 100)exitWith{
			systemChat "Hostiles have called in an Aircraft";
			_target = _bluTanks call bis_fnc_selectRandom;
			twc_greenScore = twc_greenScore - 100;
			[_target,"I_Plane_Fighter_03_CAS_F",1] call twc_fnc_bombRun;
			if(true)then{
				sleep 2;
				[_target,"I_Plane_Fighter_03_CAS_F",1] call twc_fnc_bombRun;
			};
		};
		//If Forces are low it sends in More
		_allUnits = nearestObjects [_pos,["Man"],600];
		_numGreen = independent countSide _allUnits;
		_rand = random 100;
		if(_numGreen < 20 && twc_greenScore > 50 && _rand < 66)exitwith{
			systemChat "Hostiles have called in reinforcements";
			twc_greenScore = twc_greenScore - 50;
			_spawnPos = [_pos,[800,1000],random 360,0,[1,100]] call SHK_pos;
			_group = [_spawnPos,independent,twc_greenforSquad] call BIS_fnc_spawnGroup;
			_group deleteGroupWhenEmpty true;
			[_group, _pos, 100] call CBA_fnc_taskAttack;
			{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
		};
		systemChat format["Flag at %1 has chosen to do nothing",_flag getVariable "townPos"];
	};
	//This code is bad, but we needed a sleep where it couldn't double brain
	_num = 0;
	while{_flag getVariable "townCombat" && _num < 60}do{
		sleep 1;
		_num = _num + 1;
	};
};

systemChat "Greenfor Combat brain ended";