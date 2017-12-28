params["_flag"];

_flag setVariable ["TownCombat",true];

_pos = _flag getVariable "townPos";
_points = twc_greenScore;
_power = _points * (count twc_greenBases);
_playerCount = count allPlayers;
_playerCount = ceil (_playerCount / 6);

_spawnPos = [_pos,[100,200],random 360,0,[1,100]] call SHK_pos;
_group = [_spawnPos,independent,twc_greenforSquadAA] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
[_group,_spawnPos, 200,5,"MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;

_spawnPos = [_pos,[100,200],random 360,0,[1,100]] call SHK_pos;
_group = [_spawnPos,independent,twc_greenforSquadAT] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
[_group,_spawnPos, 200,5,"MOVE","SAFE","YELLOW","LIMITED","COLUMN"] call CBA_fnc_taskPatrol;

_homeArray = nearestObjects [_pos, ["House"], 400];
for "_i" from 1 to _playerCount do{

	_home = _homeArray call bis_fnc_selectRandom;
	_spawnPos = getPos _home;
	_group = [_spawnPos,independent,twc_greenforSquad] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	{_group setVariable ["twc_unitFlag",_flag]}forEach units _group;
	[_group,_spawnPos,100,3,false,false] call CBA_fnc_taskDefend;
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

[_flag] spawn twc_fnc_greenCombatBrain;

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerActivation ["ANY", "PRESENT", false];
_trg setTriggerStatements ["West countSide thisList == 0 || Independent countSide thisList < 4", "[thisTrigger getVariable 'triggerflag',thisList] call twc_fnc_siteDeciding", ""];

_trg setVariable ["triggerFlag",_flag];