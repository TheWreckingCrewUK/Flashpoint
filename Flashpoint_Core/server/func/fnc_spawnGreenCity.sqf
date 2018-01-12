params["_flag"];

_flag setVariable ["TownCombat",true];

_pos = _flag getVariable "townPos";
_points = twc_greenScore;
_power = _points * (count twc_greenBases);
_playerCount = count allPlayers;
_playerCount = ceil (_playerCount / 3);

for "_i" from 0 to 2 do{
	_spawnPos = [_pos,[100,200],random 360,0,[1,100]] call SHK_pos;
	_group = [_spawnPos,independent,twc_greenforSquadAA] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos, 200,5,"MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;
};

for "_i" from 0 to 2 do{
	_spawnPos = [_pos,[100,200],random 360,0,[1,100]] call SHK_pos;
	_group = [_spawnPos,independent,twc_greenforSquadAT] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos, 200,5,"MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;
};

for "_i" from 0 to 4 do {
	_spawnPos = [_pos,[100,400],random 360,0,[1,100]] call SHK_pos;
	_group = [_spawnPos,independent,twc_greenforSquad] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos, 200,5,"MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;
};

_homeArray = nearestObjects [_pos, twc_stationaryBuildings, 400];
_num = 0;
while{count _homeArray > 0}do{
	_building = _homeArray call bis_fnc_selectRandom;
	_homeArray = _homeArray - [_building];
	
	_className = typeOf _building;
	hint _className;
	{
		if((_x select 0) == _className)then{
			
			_index = _forEachIndex;
			_group = [_pos,independent,twc_greenforSquad] call BIS_fnc_spawnGroup;
			{
				_x setPosATL (_building modeltoWorld (twc_stationaryDefenseBuildingPos select _index select 1 select _forEachIndex));
			}forEach units _group;
			_group deleteGroupWhenEmpty true;
			{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
			[leader _group] spawn twc_fnc_stationaryUnits;
			
		};
	}forEach twc_stationaryDefenseBuildingPos;
	_num  = _num + 1;
	
};

if(_power > 500 && _power < 750)then{
	_spawnPos = [_pos,[0,100],random 360,0,[1,100]] call SHK_pos;
	_veh = twc_greenforBTR60 createVehicle _spawnPos;
	createVehicleCrew _veh;
	_group = (group (driver _veh));
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos, 200,5,"MOVE","AWARE","YELLOW"] call CBA_fnc_taskPatrol;
};

if(_power > 750)then{
	_spawnPos = [_pos,[0,100],random 360,0,[1,100]] call SHK_pos;
	_veh = twc_greenforT72 createVehicle _spawnPos;
	createVehicleCrew _veh;
	_group = (group (driver _veh));
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos, 200,5,"MOVE","AWARE","YELLOW"] call CBA_fnc_taskPatrol;
};

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", false];
_trg setTriggerStatements ["West countSide thisList == 0 || Independent countSide thisList < 4", "[thisTrigger getVariable 'triggerflag',thisList,thisTrigger getVariable 'detectTrigger'] call twc_fnc_siteDeciding", ""];

_trg setVariable ["triggerFlag",_flag];

_detectTrg = createTrigger ["EmptyDetector", _pos];
_detectTrg setTriggerArea [800, 800, 0, false];
_detectTrg setTriggerActivation ["WEST", "GUER D", false];
_detectTrg setTriggerTimeout [1,1,1,false];
_detectTrg setTriggerStatements ["this", "hint 'detected';[thisTrigger getVariable 'triggerflag'] spawn twc_fnc_greenCombatBrain", ""];

_trg setVariable ["detectTrigger",_detectTrg];
_detectTrg setVariable ["triggerFlag",_flag];