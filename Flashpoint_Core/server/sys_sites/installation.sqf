_installationMarker =  "n_maint";
{
	_location = createLocation ["NameLocal",getMarkerPos _x,30,30];
	_location setText "Factory";
	[_location, _installationMarker,"placeHolder",1] call twc_fnc_createSite;
}forEach twc_installationNames;