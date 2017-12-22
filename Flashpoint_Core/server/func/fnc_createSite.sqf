params["_flag"];

_pos = _flag getVariable "townPos";
_side = _flag getVariable "townSide";

if(str _side == "GUER")then{_side = independent};
if(str _side == "EAST")then{_side = EAST};

_units = [_pos,_side,twc_greenforUnitSquadUAZ] call BIS_fnc_spawnGroup;
_units deleteGroupWhenEmpty true;
{
	_x setVariable ["unitsHome",_pos];
	_x addEventHandler["KILLED",{
		params["_unit","_killer","_instigator","_useEffects"];
		
	//	deleteVehicle _unit;
	}];
}forEach units _units;