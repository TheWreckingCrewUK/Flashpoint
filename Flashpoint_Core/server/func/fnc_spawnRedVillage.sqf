params["_flag"];

_pos = _flag getVariable "townPos";
_points = twc_redScore;
_power = _points * (count twc_opforBases);
_playerCount = count allPlayers;
_playerCount = ceil (_playerCount / 6);

_spawnPos = [_pos,[100,200],random 360,0,[1,100]] call SHK_pos;
_group = [_spawnPos,east,twc_redforSquadAA] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
[_group,_spawnPos, 200,5,"MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;

_spawnPos = [_pos,[100,200],random 360,0,[1,100]] call SHK_pos;
_group = [_spawnPos,east,twc_redforSquadAT] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
[_group,_spawnPos, 200,5,"MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;

_homeArray = nearestObjects [_pos, ["House"], 400];
hint str _homeArray;
for "_i" from 1 to _playerCount do{

	_home = _homeArray call bis_fnc_selectRandom;
	_spawnPos = getPos _home;
	_group = [_spawnPos,east,twc_redforSquad] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos,100,3,false,false] call CBA_fnc_taskDefend;
};

if(_power > 500 && _power < 750)then{
	_spawnPos = [_pos,[0,100],random 360,0,[1,100]] call SHK_pos;
	_veh = twc_redforBTR createVehicle _spawnPos;
	createVehicleCrew _veh;
	_group = (group (driver _veh));
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos, 200,5,"MOVE","AWARE","YELLOW"] call CBA_fnc_taskPatrol;
};

if(_power > 750)then{
	_spawnPos = [_pos,[0,100],random 360,0,[1,100]] call SHK_pos;
	_veh = twc_redforBMP createVehicle _spawnPos;
	createVehicleCrew _veh;
	_group = (group (driver _veh));
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos, 200,5,"MOVE","AWARE","YELLOW"] call CBA_fnc_taskPatrol;
};

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", true];
_trg setTriggerStatements ["West countSide thisList == 0 ||  East countSide thisList < 4", "[thisTrigger getVariable 'triggerflag',thisList] call twc_fnc_siteDeciding", ""];

_trg setVariable ["triggerFlag",_flag];

_detectTrg = createTrigger ["EmptyDetector", _pos];
_detectTrg setTriggerArea [800, 800, 0, false];
_detectTrg setTriggerActivation ["WEST", "EAST D", false];
_detectTrg setTriggerTimeout [1,1,1,false];
_detectTrg setTriggerStatements ["this", "hint 'detected';[thisTrigger getVariable 'triggerflag'] spawn twc_fnc_redCombatBrain", ""];

_trg setVariable ["detectTrigger",_detectTrg];
_detectTrg setVariable ["triggerFlag",_flag];