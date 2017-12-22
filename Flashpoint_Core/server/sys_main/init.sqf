[]spawn{
runLoop = false;
sleep 5;
while{runLoop}do{
	sleep (random 6);
	_array = [(getMarkerPos "respawn_east")] call twc_fnc_sortSites;
	
	_attackTown = "";
	{
		if(str ((_x select 1) getVariable "townSide") == "GUER")exitWith{_attackTown = (_x select 1)};
	}forEach _array;
	
	_attackTown setFlagTexture twc_flagTextureRedfor;
	_attackTown setVariable ["townSide",East];
	_mkr = _attackTown getVariable "townmarker";
	_mkr setMarkerColor "colorEast";
	
	remoteExecCall ["twc_fnc_updateTownLines",0];
};
};