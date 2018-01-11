[]spawn{
runLoop = true;

while{runLoop}do{
	
	if(count allPlayers == 0)then{
	
	[] call twc_fnc_updatePoints;
	
	if(twc_redScore > 500)then{
		twc_redScore = twc_redScore - 500;
		_array = [(getMarkerPos "respawn_east")] call twc_fnc_sortSites;
		
		_attackTown = "";
		{
			if(str ((_x select 1) getVariable "townSide") == "GUER")exitWith{_attackTown = (_x select 1)};
		}forEach _array;
	
		_attackTown setFlagTexture twc_flagTextureRedfor;
		_attackTown setVariable ["townSide",East];
		_mkr = _attackTown getVariable "townmarker";
		_mkr setMarkerColor "colorEast";
	
		[] call twc_fnc_reCalcBaseConnection;
		remoteExecCall ["twc_fnc_updateTownLines",0];
	};
	
	runLoop = false;
	};
};
};