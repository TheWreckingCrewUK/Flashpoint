openMap [true, false];
hint "Select where you want to Rocket";
player setVariable ["twc_commanderRocketPos",[0,0,0]];

onMapSingleClick {
	params["_this","_pos","_units","_shift","_alt"];
	player setVariable ["twc_commanderRocketPos",_pos];
	hint format["Close Map to Rocket At %1",_pos];
};

waitUntil {!visibleMap};

if("[0,0,0]" != str (player getVariable "twc_commanderRocketPos"))then{
	_pos = player getVariable "twc_commanderRocketPos";
	hint format["Rocket At at %1",_pos];
	
	"ModuleOrdnanceRocket_F" createVehicle _pos;
	twc_bluScore = twc_bluScore - 10;
	
	
}else{
	hint "You didn't select anywhere to Rocket";
};
player setVariable ["twc_commanderRocketPos",nil];
onMapSingleClick {};