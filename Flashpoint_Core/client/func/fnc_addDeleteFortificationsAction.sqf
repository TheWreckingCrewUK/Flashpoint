_deleteAction = player addAction["<t color = '#008000'>Delete Cursor Object</t>",{
	params["_target","_caller","_id","_arguments"];
	_obj = cursorTarget;
	if(_obj getVariable ["twc_playerPlaced",false])then{
		deleteVehicle _obj;
		hint format["%1 has been deleted",typeOf _obj]; 
	}else{
		hint format["%1 is not a player placed object that can be deleted",typeOf _obj];
	};
},nil,6,true,false,"","true",-1,false,""];

_deleteAction = player addAction["<t color = '#ffff00'>Stop Deleting</t>",{
	params["_target","_caller","_id","_arguments"];
	
	player removeAction _arguments;
	player removeAction _id;
},_deleteAction,6,true,false,"","true",-1,false,""];