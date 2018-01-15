openMap [true, false];
hint "Select where you want to Bomb";
player setVariable ["twc_commanderBombPos",[0,0,0]];

onMapSingleClick {
	params["_this","_pos","_units","_shift","_alt"];
	player setVariable ["twc_commanderBombPos",_pos];
	hint format["Close Map to Bomb At %1",_pos];
};

waitUntil {!visibleMap};

if("[0,0,0]" != str (player getVariable "twc_commanderBombPos"))then{
	_pos = player getVariable "twc_commanderBombPos";
	hint format["CAS At at %1",_pos];
	
	[_pos,"B_Plane_CAS_01_Cluster_F",3] remoteExecCall ["twc_fnc_bombRun",2];
	twc_bluScore = twc_bluScore - 10;
	
	
}else{
	hint "You didn't select anywhere to Bomb";
};
player setVariable ["twc_commanderBombPos",nil];
onMapSingleClick {};