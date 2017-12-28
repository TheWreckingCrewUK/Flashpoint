/*
* Author: [TWC] jayman
* Creates the defenses
*
* Arguments:
* 0: radio Table <Object>
*
* Return Value:
* <STRING>
*
* Example:
* [radioTable] call twc_fnc_createDefenses;
*
* Public: No
*/
params["_crate","_item","_cost"];

twc_playerRotation = 0;
twc_playerDistance = 0;

player setVariable ["twc_placeObject",true];

_supplies = ({_x == "TWC_ForwardBase_Supplies"}count (itemCargo _crate));
if(_supplies < _cost)exitWith{hint "There is not enough supplies to create that item";};

clearItemCargoGlobal _crate;
_crate addItemCargoGlobal ["TWC_ForwardBase_Supplies", (_supplies - _cost)];

_local = _item createVehicleLocal (getPos player);
_placeAction = player addAction["<t color = '#008000'>PLACE</t>",{
	params["_target","_caller","_id","_arguments"];
	player setVariable ["twc_placeObject",false];
	player removeAction _id;
},nil,6,true,false,"","true",-1,false,""];

_placeMultiple = player addAction["<t color = '#0000ff'>PLACE Multiple</t>",{
	params["_target","_caller","_id","_arguments"];
	_cost = _arguments select 0;
	_crate = _arguments select 1;
	_local = _arguments select 2;
	
	_supplies = ({_x == "TWC_ForwardBase_Supplies"}count (itemCargo _crate));
	if(_supplies < _cost)then{
		hint "Not enough supplies to spawn multiple";
	}else{
		_dir = getdir _local;
		_pos = getPos _local;
		_global = (typeOf _local) createVehicle _pos;
		_global setdir _dir;
		_global setPos [_pos select 0,_pos select 1,0];
		_global setVariable ["twc_playerPlaced",true,true];
		
		clearItemCargoGlobal _crate;
		_crate addItemCargoGlobal ["TWC_ForwardBase_Supplies", (_supplies - _cost)];		
	};	
},[_cost,_crate,_local],6,true,false,"","true",-1,false,""];

_rotateAction = player addAction["<t color = '#FF0000'>Rotate</t>",{
	params["_target","_caller","_id","_arguments"];
	twc_playerRotation = twc_playerRotation + 45;
},nil,6,true,false,"","true",-1,false,""];

_fartherAction = player addAction["<t color = '#ffff00'>Farther</t>",{
	params["_target","_caller","_id","_arguments"];
	if(twc_playerDistance > 15)exitWith{hint "You cannot Move the Object any Farther Away"};
	twc_playerDistance = twc_playerDistance + 2;
},nil,6,true,false,"","true",-1,false,""];

_closerAction = player addAction["<t color = '#800080'>Closer</t>",{
	params["_target","_caller","_id","_arguments"];
	if(twc_playerDistance < 2)exitWith{hint "You cannot Move the Object any closer"};
	twc_playerDistance = twc_playerDistance - 2;
},nil,6,true,false,"","true",-1,false,""];

while {player getVariable "twc_placeObject"}do{
	_pos = player modelToWorld [0,(15 + twc_playerDistance),0];
	_dir = getDir player;
	_local setPos [_pos select 0,_pos select 1,0];
	_local setDir (_dir + twc_playerRotation);
	sleep 0.01;
};
player removeAction _placeMultiple;
player removeAction _rotateAction;
player removeAction _fartherAction;
player removeAction _closerAction;
_pos = getPos _local;
_dir = getDir _local;
deleteVehicle _local;
_global = _item createVehicle _pos;
_global setDir _dir;
_global setPos _pos;
_global setVariable ["twc_playerPlaced",true,true];
twc_playerDistance = nil;
twc_playerRotation = nil;

if(_item == "USMC_WarefareBFieldhHospital")then{
	_global setVariable ["ace_medical_isMedicalFacility",true,true];
};