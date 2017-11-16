_radioMarker = "loc_Transmitter";
{
	_location = createLocation ["NameLocal",getMarkerPos _x,30,30];
	_location setText "Radio Site";
	[_location, _radioMarker,"placeHolder",1] call twc_fnc_createSite;
}forEach twc_radioNames;