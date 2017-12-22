params["_units","_vehicles"];

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [1, 1, 0, false];
_trg setTriggerTimeout [800,800,1,false];
_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
_trg setTriggerStatements ["this", "hint str (thisTrigger getVariable 'triggerUnits'); {deleteVehicle _x}forEach (thisTrigger getVariable 'triggerUnits')", ""];

_trg setVariable ["triggerTime",_time + 10];
_trg setVariable ["triggerUnits",(units _group1)];
