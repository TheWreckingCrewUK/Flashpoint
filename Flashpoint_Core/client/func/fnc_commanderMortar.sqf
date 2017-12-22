openMap [true, false];
hint "Select where you want to Call in Mortar Strike";
player setVariable ["twc_commanderMortarPos",[0,0,0]];

onMapSingleClick {
	params["_this","_pos","_units","_shift","_alt"];
	player setVariable ["twc_commanderMortarPos",_pos];
	hint format["Close Map to Fire Mortars At %1",_pos];
};

waitUntil {!visibleMap};

if("[0,0,0]" != str (player getVariable "twc_commanderMortarPos"))then{
	_pos = player getVariable "twc_commanderMortarPos";
	hint format["Firing at %1",_pos];
	
	_null = [_pos,100,8,"HE",5] spawn twc_fnc_virtualMortar;
}else{
	hint "You didn't select anywhere to Fire";
};
player setVariable ["twc_commanderMortarPos",nil];
onMapSingleClick {};