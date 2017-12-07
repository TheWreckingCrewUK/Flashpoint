params["_location","_type",["_markerstr","placeHolder"],["_start",0]];

_pos = getPos _location;
//if(count (nearestObjects [_pos,["House","Building"],100]) == 0)exitWith{};
if(_pos distance2D (getMarkerPos "respawn_West") < 500)exitWith{};
if(text _location in twc_dumbLocations)exitWith{};
if(_start == 1)then{
	_flag = "rhs_Flag_Russia_F" createVehicle _pos;
	_flag setVariable ["townPos",_pos];
	twc_flags pushback _flag;
	_markerstr = createMarker [str (random 10000), (_pos)];
	_markerstr setMarkerShape "icon";
	_markerstr setMarkerType _type;
	if((getMarkerPos "base") distance _pos > 2000)then{
		_markerstr setMarkerColor "colorEast";
		_flag setVariable ["townSide","East"];
	}else{
		_markerstr setMarkerColor "colorWest";
		_flag setVariable ["townSide","West"];
	};
};
/*
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [600, 600, 0, false];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements ["this", format["[%1, '%2'] call twc_fnc_spawn%2; [(thisTrigger getVariable 'location'),%1, '%2','%3'] call twc_fnc_siteContested",_pos,_type,_markerstr], ""];

_trg setVariable ["location",_location];