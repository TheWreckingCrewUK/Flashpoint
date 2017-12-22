openMap [true, false];
hint "Hello Section Commander. Please Select where you wish to place the starting base";
onMapSingleClick {
	params["_this","_pos","_units","_shift","_alt"];
	if(_pos inArea 	"hostileterritoryMarker")then{
		hint "That is hostile Territory. You cannot set the base there";
	}else{
		"respawn_West" setMarkerPos _pos;
	};
};
waitUntil {!visibleMap};
if((getMarkerPos "respawn_west") distance2D (getPos player) < 1000)exitWith{onMapSingleClick{}; hint "You did not set the base far enough away. Please try again"};
[player] spawn twc_fnc_addBaseCreationActions;
hint "Open up your briefing to see a list of things to do in order to call this a real base";
{
	_x setPos (getMarkerPos "respawn_West");
	twc_bluforBaseFlagPole setPos (getMarkerPos "respawn_West");
}forEach allPlayers;

onMapSingleClick {};