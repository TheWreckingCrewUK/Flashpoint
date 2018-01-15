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
params["_item","_cost"];

_item createVehicle (getPos helicopterSpawnPad);
twc_bluScore = twc_bluScore - _cost;
publicVariable "twc_bluScore";