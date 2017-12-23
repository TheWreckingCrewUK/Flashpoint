params["_flag","_thisList"];

_marker = _flag getVariable "townMarker";
_side = _flag getVariable "townSide";

if(west countSide _thisList == 0)exitWith{
	_pos = _flag getVariable "townPos";
	
	_color = "colorEast";
	if(_side == independent)then{_color = "colorIndependent"};
	_marker setMarkerColor _color;
	
	{
		if(str (_x getVariable "twc_unitFlag") == str _flag)then{
			{
				if((vehicle _x) != _x)then{deleteVehicle (vehicle _x)};
				deleteVehicle _x
			}forEach units _x;
		};
	}forEach allGroups;
	{
		deleteVehicle _x
	}forEach allDeadMen;
	_trg = createTrigger ["EmptyDetector", _pos];
	_trg setTriggerArea [800, 800, 0, false];
	_trg setTriggerActivation ["WEST", "PRESENT", false];
	_trg setTriggerStatements ["this", "[thisTrigger getVariable 'triggerflag'] call twc_fnc_createSite", ""];

	_trg setVariable ["triggerFlag",_flag];
};

_marker setMarkerColor "colorWest";
_flag setVariable ["townSide",West];
_flag setFlagTexture twc_flagTextureBlufor;
twc_bluforBases pushback _flag;
if(_side == east)then{
	twc_opforBases = twc_opforBases - [_flag];
}else{
	twc_greenBases = twc_greenBases - [_flag];
};
remoteExecCall ["twc_fnc_updateTownLines",0];