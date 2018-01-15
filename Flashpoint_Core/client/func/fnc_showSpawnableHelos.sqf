params["_player","_target","_params"];
disableSerialization;
_array = twc_spawnableHelos;

player setVariable ["twc_spawningHelo",false];

createDialog "twc_spawnHeloDialog";

waitUntil{!isNull (findDisplay 9998);};

_ctrl = (findDisplay 9998) displayCtrl 1500;

{
	_string = str (_array select _foreachindex select 1);
	_index = _ctrl lbAdd (getText (configFile >> "cfgVehicles" >> _x select 0 >> "displayName"));
	_ctrl lbSetData [_index, _x select 0];
}forEach _array;
	
_classname = "";
_selectedIndex = "";
_ctrl lbSetCurSel 0;
while{!isNull (findDisplay 9998);}do{
	_selectedIndex = lbCurSel _ctrl;
	_classname = _ctrl lbData _selectedIndex;
		
	ctrlSetText [1201,getText (configFile >> "cfgVehicles" >> _classname >> "editorPreview")];
	ctrlSetText [1001,"Cost = " + str (_array select _selectedIndex select 1) + " Supplies"];
};
sleep 0.2;

if(player getVariable "twc_spawningHelo")then{
	[_classname,((_array select _selectedIndex) select 1)] call twc_fnc_spawnHelo;
	player setVariable ["twc_spawningHelo",false];
};