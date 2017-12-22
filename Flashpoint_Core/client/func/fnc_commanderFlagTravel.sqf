openMap [true, false];
hint "Select A blufor Controlled location to travel to.";
player setVariable ["twc_commanderTravelPos",getPos player];

onMapSingleClick {
	params["_this","_pos","_units","_shift","_alt"];
	_flag = _pos nearestObject twc_flagClassname;
	if(_flag in twc_bluforBases)then{
		hint "Good Pos. Close to Move";
		player setVariable ["twc_commanderTravelPos",(getPos _flag)];
	}else{
		hint "Invalid Pos. You can only move to blufor Controlled locations";
		player setVariable ["twc_commanderTravelPos",getPos player];
	};
};
waitUntil {!visibleMap};
player setPos (player getVariable "twc_commanderTravelPos");
player setVariable ["twc_commanderTravelPos",nil];
onMapSingleClick {};