
_flag = (getPos player) nearestObject twc_flagClassname;
if(_flag getVariable "twc_flagAA")exitWith{hint "This flag already has anti-Air"};
_group = createGroup west;
_aaUnit = _group createUnit [twc_bluforUnitAA, getPos  _flag,[],0,"NONE"];

_markerstr = createMarker [str (random 1000),getPos  _flag];
_markerstr setMarkerShape "ELLIPSE";
_markerstr setMarkerSize [1000,1000];
_markerstr setMarkerType "Solid";
_markerstr setMarkerColor "colorBlufor";
_markerstr setMarkerAlpha 0.25;

_flag setVariable ["twc_flagAA",true,true];

twc_bluforAAMarkers pushback _markerstr;
publicVariable "twc_bluforAAMarkers";

_aaUnit setVariable ["AAMarker",_markerstr];
_aaUnit setVariable ["unitFlag",_flag];
_aaUnit addEventHandler["Killed",{
	params["_unit","_killer","_instigator","_useEffects"];
	_marker = _unit getVariable "AAMarker";
	_flag = _unit getVariable "unitFlag";
	
	twc_bluforAAMarkers = twc_bluforAAMarkers - [_marker];
	deleteMarker _marker;
	publicVariable "twc_bluforAAMarkers";
	
	_flag setVariable ["twc_flagAA",false,true];
	hint "The AA Unit has been killed. AA is Down";
}];
