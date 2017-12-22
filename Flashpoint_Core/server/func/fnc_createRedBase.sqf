params["_location"];

_location = nearestLocation [getPos _location, "FlatAreaCity"];
_pos = getPos _location;

"respawn_east" setMarkerPos _pos;

_flag = twc_flagClassname createVehicle _pos;
_flag setVariable ["townPos",_pos];
_flag allowDamage false;
"respawn_east" setMarkerColor "colorEast";
_flag setFlagTexture twc_flagTextureRedfor;
_flag setVariable ["townSide",East];
_flag setVariable ["twc_transportDistance",twc_baseTransportDistance];
_flag setVariable ["twc_mainBase",true];
_flag setVariable ["townValue",100];
twc_flags pushback _flag;
twc_opforBases pushback _flag;

twc_fnc_redBaseComplete = true;
publicVariable "twc_fnc_redBaseComplete";

/*
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [600, 600, 0, false];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements ["this", format["[%1, '%2'] call twc_fnc_spawn%2; [(thisTrigger getVariable 'location'),%1, '%2','%3'] call twc_fnc_siteContested",_pos,_type,_markerstr], ""];

_trg setVariable ["location",_location];