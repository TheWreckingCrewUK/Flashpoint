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
	
	_vehicles = nearestObjects [_pos,["Car","Truck","Tank"],1000];
	_men = nearestObjects [_pos,["Man"],1000];
	_numVehicles = {side _x != west}count _vehicles;
	_numMen = {side _x != west}count _men;
	hint format ["Vehicles : %1 \n Men : %2",_numVehicles,_numMen];
}else{
	hint "You didn't select anywhere to Recon";
};
player setVariable ["twc_commanderReconPos",nil];
onMapSingleClick {};