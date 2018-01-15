openMap [true, false];
hint "Select where you want to Recon";
player setVariable ["twc_commanderReconPos",[0,0,0]];

onMapSingleClick {
	params["_this","_pos","_units","_shift","_alt"];
	player setVariable ["twc_commanderReconPos",_pos];
	hint format["Close Map to Recon At %1",_pos];
};

waitUntil {!visibleMap};

if("[0,0,0]" != str (player getVariable "twc_commanderReconPos"))then{
	_pos = player getVariable "twc_commanderReconPos";
	hint format["Recon at %1",_pos];
	_time = call cTab_fnc_currentTime;
	
	_vehicles = nearestObjects [_pos,["Car","Truck","Tank"],1000];
	_men = nearestObjects [_pos,["Man"],1000];
	{
		if(side _x != west)then{
			["b",[(getPos _x),3,0,0,_time]]call cTab_fnc_addUserMarker;
		};
	}forEach _vehicles;
	{
		if(leader _x == _x && side _x != west)then{
			["b",[(getPos _x),0,0,0,_time]]call cTab_fnc_addUserMarker;
		};
	}forEach _men;
	hint "Hostile Positions marked on the CTAB";
	twc_bluScore = twc_bluScore - 10;
}else{
	hint "You didn't select anywhere to Recon";
};
player setVariable ["twc_commanderReconPos",nil];
onMapSingleClick {};