params["_unit"];

//Position Where the player called in the box
_startPos = getPos _unit;

//Creating the helicopter
_group = createGroup civilian;
_array = [_startPos,0,"B_Heli_Transport_03_F",_group] call bis_fnc_spawnVehicle;
_veh = _array select 0;
_veh allowDamage false;
_pos = getPos _veh;

//Moving it out of range for immersion
while{([_veh,600] call cba_fnc_nearPlayer)}do{
	_pos = getPos _veh;
	_veh setPos [(_pos select 0) + 500,_pos select 1, _pos select 2];
};

//Sets dir cuz pilots are retarded
_dir = [_pos,_startPos] call bis_fnc_dirTo;
_veh setDir _dir;

//Waypoints for dropoff and then later move and deletion
_wp = _group addWaypoint [[(_startPos select 0) - 70, _startPos select 1] ,0];
_wp setWaypointStatements ["true","_pos = getPos (vehicle this); _box = 'twc_SuppliesBox' createVehicle _pos; _box setPos _pos; _group = group this; _wp = _group addWaypoint [[(getpos this select 0) + 1000,(getPos this select 1),0],0]; _wp setWaypointStatements ['true','deleteVehicle (Vehicle this); {deleteVehicle _x}forEach thisList']"];