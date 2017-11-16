_outpostMarker = "n_installation";
{
	_location = createLocation ["NameLocal",getMarkerPos _x,30,30];
	_location setText "AAF Outpost";
	[_location, _outpostMarker,"placeHolder",1] call twc_fnc_createSite;
}forEach twc_outpostNames;