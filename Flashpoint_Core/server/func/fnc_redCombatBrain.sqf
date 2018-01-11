/*
*	Function for Redfor AI Decision Making During Flag Combat
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
systemChat "Redfor combat Brain started";

//Initial Random Sleeps to Simulate Hostiles Sending Radio Transmissions just as awful as below
_num = -30 - (random -60);
while{_flag getVariable "townCombat" && _num < 0}do{
	sleep 1;
	_num = _num + 1;
};

//Combat Brain Loop
while{_flag getVariable "townCombat"}do{
	[_pos,_flag]call{
		params["_pos","_flag"];
		//First Thing is if blufor Tanks it wants to send a rocket plane at them
		_allTanks = nearestObjects [_pos, ["Tank"], 800];
		_bluTanks = [];
		{
			if(side _x == West)then{
				_bluTanks pushback _x;
			};
		}forEach _allTanks;
		_rand = random 100;
		if(count _bluTanks > 0 && _rand < 33 && twc_redScore > 100)exitWith{
			systemChat "Hostiles have called in an Aircraft";
			_target = _bluTanks call bis_fnc_selectRandom;
			twc_redScore = twc_redScore - 100;
			[_target,"O_Plane_CAS_02_F",1] call twc_fnc_bombRun;
			if(true)then{
				sleep 2;
				[_target,"O_Plane_CAS_02_F",1] call twc_fnc_bombRun;
			};
		};
		//If Forces are low it sends in More
		_allUnits = nearestObjects [_pos,["Man"],800];
		_numRed = east countSide _allUnits;
		_rand = random 100;
		if(_numRed < 20 && twc_redScore > 50 && _rand < 66)exitwith{
			systemChat "Hostiles have called in reinforcements";
			twc_redScore = twc_redScore - 50;
			_spawnPos = [_pos,[800,1000],random 360,0,[1,100]] call SHK_pos;
			_group = [_spawnPos,east,twc_redforSquad] call BIS_fnc_spawnGroup;
			_group deleteGroupWhenEmpty true;
			[_group, _pos, 100] call CBA_fnc_taskAttack;
			{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
		};
		//If they have the points they will try to flank attack with a btr and inf
		if(twc_redScore > 200)exitWith{
		systemChat "Hostiles have deciding a flanking attack";
		twc_redScore = twc_redScore - 200;
		_bluUnits = [];
		{
			if(side _x == west)then{
				_bluUnits pushback _x;
			};
		}forEach _allUnits;
		_randUnit = _bluUnits call bis_fnc_selectRandom;
		_dir = [_flag,_randUnit] call bis_Fnc_dirTo;
		_rand = random 100;
		if(_rand > 50)then{_dir = _dir + 30}else{_dir = _dir - 30};
		_spawnPos = [_pos,[600,800],_dir,0,[0,100]] call SHK_pos;
		_btr = twc_redforBTR createVehicle _spawnPos;
		createVehicleCrew _btr;
		_group = group (driver _btr);
		_group deleteGroupWhenEmpty true;
		{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
		_wp =_group addWaypoint [getPos _randUnit, 0];
		};
		//If blufor is grouped up and known about call in a mortar
		_bluUnits = [];
		{
			if(side _x == west)then{
				_bluUnits pushback _x;
			};
		}forEach _allUnits;
		_randUnit = _bluUnits call bis_fnc_selectRandom;
		_nearBlu = nearestObjects[(getPos _randUnit),["Man"],200];
		if(east knowsAbout _randUnit > 1 && twc_redScore > 25 && west countSide _nearBlu > 4)exitWith{
			twc_redScore = twc_redScore - 25;
			[(getPos _randUnit),100,4,"HE",3] spawn twc_fnc_virtualMortar;
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