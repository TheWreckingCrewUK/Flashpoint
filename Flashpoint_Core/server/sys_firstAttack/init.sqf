//A relativley simple script to get the intial attack to get blu to not mess around

//Gets pos and time for use in scripts
_pos = getMarkerPos "respawn_west"; 
_time = time;
 
//Hint to alert players of their impending doom
"Independents have located your base and will attack in 5 Minutes" remoteExecCall ["hint",0];

//Sorts flags by ditance so we select the nearest one.
_array = [];
{
 _distance = (_x getVariable "townPos") distance2D _pos;
 _array = _array + [[_distance,_x]];
}forEach twc_flags;
_array sort true;

_attackFrom = [0,0,0];
{
	if(str ((_x select 1) getVariable "townSide") == "GUER")exitWith{_attackFrom = (_x select 1) getVariable "townPos"};
}forEach _array;

_road = [_attackFrom,200] call bis_fnc_nearestroad;
_dir = [(getPos _road),_pos] call bis_fnc_dirTo;
_vehicleArray = [];

_group = createGroup independent;
_brdm = twc_greenforUnitBRDM createVehicle (getPos _road);
_brdm setDir _dir;
_vehicleArray pushback _brdm;

createVehicleCrew _brdm;
_crew = crew _brdm;
_crew join _group;

for "_i" from 1 to 2 do{
	_truck = twc_greenforUnitUAZ createVehicle (getPos _road);
	_truck setDir _dir;
	_vehicleArray pushback _truck;

	_newGroup = [getPos _road,independent,twc_greenforUnitSquadUAZ] call bis_fnc_spawnGroup;
	{
		if(_forEachIndex == 0)then{
			_x moveInDriver _truck;
		}else{
			_x moveInCargo _truck;
		};
	}forEach units _newGroup;
	(units _newGroup) join _group;
};

_wp = _group addWaypoint [_pos,0];
_wp setWaypointType "UNLOAD";

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerTimeout [1,1,1,false];
_trg setTriggerActivation ["GUER", "NOT PRESENT", false];
_trg setTriggerStatements ["this && (thisTrigger getVariable 'triggerTime') < time", "{deleteVehicle _x}forEach (thisTrigger getVariable 'triggerVehicles'); {deleteVehicle _x}forEach (thisTrigger getVariable 'triggerUnits')", ""];

_trg setVariable ["triggerTime",_time + 10];
_trg setVariable ["triggerUnits",(units _group)];
_trg setVariable ["triggerVehicles",_vehicleArray];