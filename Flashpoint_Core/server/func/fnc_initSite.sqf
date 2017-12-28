params["_location","_type","_transportDistance","_value"];

//Gets position from the given location
_pos = getPos _location;

//Filters out the rest of defined dumb locations
//if(text _location in twc_dumbLocations)exitWith{};

//Creates the super flag which stores all the towns information
_flag = twc_flagClassname createVehicle _pos;
_flag setVariable ["townPos",_pos];
_flag allowDamage false;
twc_flags pushback _flag;
_markerstr = createMarker [str (random 10000), (_pos)];
_markerstr setMarkerShape "icon";
_markerstr setMarkerType _type;
_flag setVariable ["townMarker",_markerstr];
_flag setVariable ["townValue",_value];
_flag setVariable ["TownCombat",false];

//Sets the flags transport distance
_flag setVariable ["twc_transportDistance",_transportDistance];

//Figures out if it starts red or blue or Independent
if((getMarkerPos "respawn_east") distance2D _pos < 400)then{
	_markerstr setMarkerColor "colorEast";
	_flag setFlagTexture twc_flagTextureRedfor;
	_flag setVariable ["townSide",EAST];
	twc_opforBases pushback _flag;
}else{
	if((getMarkerPos "respawn_west") distance2D _pos < 400)then{
		_markerstr setMarkerColor "colorWest";
		_flag setVariable ["townSide",West];
		_flag setFlagTexture twc_flagTextureBlufor;
		twc_bluforBases pushback _flag;
	}else{
		_markerstr setMarkerColor "colorIndependent";
		_flag setVariable ["townSide",Independent];
		_flag setFlagTexture twc_flagTextureIndependent;
		twc_greenBases pushback _flag;
	};
};


_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [800, 800, 0, false];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements ["this", "[thisTrigger getVariable 'triggerflag'] call twc_fnc_createSite", ""];

_trg setVariable ["triggerFlag",_flag];