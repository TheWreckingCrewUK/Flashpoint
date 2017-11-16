params["_location","_type",["_markerstr","placeHolder"],["_start",0]];

_pos = getPos _location;
//if(count (nearestObjects [_pos,["House","Building"],100]) == 0)exitWith{};
if(_pos distance2D (getMarkerPos "respawn_West") < 500)exitWith{};
if(text _location in twc_dumbLocations)exitWith{};
if(_start == 1)then{
	_markerstr = createMarker [str (random 10000), (_pos)];
	_markerstr setMarkerShape "icon";
	_markerstr setMarkerType _type;
	_markerstr setMarkerColor "colorEast";
};
/*
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [600, 600, 0, false];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements ["this", format["[%1, '%2'] call twc_fnc_spawn%2; [(thisTrigger getVariable 'location'),%1, '%2','%3'] call twc_fnc_siteContested",_pos,_type,_markerstr], ""];

_trg setVariable ["location",_location];