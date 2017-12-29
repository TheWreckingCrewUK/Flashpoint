params["_unit"];
[]spawn{
_startPos = getPos _unit;
_veh = createVehicle ["B_Heli_Transport_03_F",_startPos,[],0,"Fly"];
_veh allowDamage false;
createVehicleCrew _veh;
_pos = getPos _veh;
hint str (player distance _Veh);
while{([_veh,600] call cba_fnc_nearPlayer)}do{
	_pos = getPos _veh;
	_veh setPos [(_pos select 0) + 500,_pos select 1, _pos select 2];
};

_dir = [_pos,_startPos] call bis_fnc_dirTo;
_veh setDir _dir;

_group = group (driver _veh);
_wp = _group addWaypoint [[(_startPos select 0) - 70, _startPos select 1] ,0];
_wp setWaypointStatements ["true","_pos = getPos (vehicle this);_parachute = 'b_parachute_02_F' createVehicle _pos; _box = 'twc_SuppliesBox' createVehicle _pos; _box setPos _pos; _parachute attachTo [_box,[0,0,0]]; _group = group this; _wp = _group addWaypoint [[(getpos this select 0) + 1000,(getPos this select 1),0],0]; _wp setWaypointStatements ['true','deleteVehicle (Vehicle this); {deleteVehicle _x}forEach thisList']"];
}