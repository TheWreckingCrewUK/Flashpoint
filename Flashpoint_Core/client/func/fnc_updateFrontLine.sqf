params[""];

_ctrl = findDisplay 12 displayCtrl 51;
_ctrl ctrlRemoveAllEventHandlers "Draw";
twc_bluforControlledLocations = ["base_1","base_2","base_3","base_4","base_5","base_6","base_7","base_8","base_9","base_10"];
twc_bluforControlledLocationsTriangles = [];
_total = [0,0];
_newX = 0;
_newY = 0;
{
	_newX = (_total select 0) + ((getMarkerPos _x) select 0);
	_newY = (_total select 1) + ((getMarkerPos _x) select 1);
	_total = [_newX,_newY];
}forEach twc_bluforControlledLocations;

_newX = (_total select 0) / (count twc_bluforControlledLocations);
_newY = (_total select 1) / (count twc_bluforControlledLocations);
_middlePoint = [_newX,_newY,0];
_numArray = [];
{
	_dir = [_middlePoint,getMarkerPos _x] call bis_fnc_dirTo;
	_numArray pushback [_dir,_x];
}forEach twc_bluforControlledLocations;
_numArray sort true;
_farthest = "";
_far = 0;
{
	if((getMarkerPos _x) distance2D _middlePoint > _far)then{
		_far = ((getMarkerPos _x) distance2D _middlePoint);
		_farthest = _x;
	};
}forEach twc_bluforControlledLocations;

_mathArray = [];
{
	_calc = ((getMarkerPos (_x select 1)) distance _middlePoint);
	if(_calc * 2 > _far)then{
		_mathArray pushback (_x select 1);
	};
}forEach _numArray;
twc_bluforControlledLocations = [];
{
	twc_bluforControlledLocations pushBack  (getMarkerPos _x);
}forEach _mathArray;
twc_frontLineHandle = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
{
	_this select 0 drawPolygon [twc_bluforControlledLocations, [0,0,1,1]];
}];

_putMiddle = 3;
_oldPos = "";

twc_bluforControlledLocationsTriangles = [_middlePoint];
{
	if(_putMiddle == 1)then{
		_putMiddle = 2;
		twc_bluforControlledLocationsTriangles pushback _middlePoint;
		twc_bluforControlledLocationsTriangles pushback _oldPos;
	};
	twc_bluforControlledLocationsTriangles pushback _x;
	_oldPos = _x;
	_putMiddle = _putMiddle - 1;
}forEach twc_bluforControlledLocations;


twc_bluforControlledLocationsTriangles pushback  _middlePoint;
twc_bluforControlledLocationsTriangles pushback _oldPos;
twc_bluforControlledLocationsTriangles pushback (twc_bluforControlledLocationsTriangles select 1);

copyToClipboard str twc_bluforControlledLocationsTriangles;
twc_frontLineHandle2 = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", 
{
	_this select 0 drawTriangle [twc_bluforControlledLocationsTriangles, [0,0,1,1],"#(rgb,1,1,1)color(1,1,1,0.2)"];
}];