[]spawn{
runLoop = true;
_range = 0;
while{runLoop}do{
	
	if(count allPlayers != 0)then{
	
	[] call twc_fnc_updatePoints;
	
		_attackableSites = [];
		while{count _attackableSites == 0}do{
			_range = _range + 500;
			_flagArray = nearestObjects [getMarkerPos "respawn_east",[twc_flagClassname],_range];
			
			{
				if(str (_x getVariable "townSide") in ["GUER","WEST"] && !(_x getVariable ["TownCombat",false]))then{
					_attackableSites pushback _x;
				};
			}forEach _flagArray;
		};
	
		_greenSites = [];
		_westSites = [];
		{
			if(str (_x getVariable "townSide") == "GUER")then{
				_greenSites pushback _x;
			};
			if(str (_x getVariable "townSide") == "WEST")then{
				_westSites pushback _x;
			};
		}forEach _attackableSites;
	
		_scriptDone = [_greenSites,_westSites] spawn {
			params ["_greenSites","_westSites"];
			while {isNil "redForAttack"}do{
				if(count _greenSites != 0)then{
					{
						_random = random 100;
						if(_random < _x getVariable "townValue")then{
							redForAttack = _x;
							twc_greenBases = twc_greenBases - [redForAttack];
						};
					}forEach _greenSites;
				}else{
					{
						_random = random 100;
						if(_random < _x getVariable "townValue")then{
							redForAttack = _x;
							twc_bluforBases = twc_bluforBases - [redForAttack];
							
							_trg = createTrigger ["EmptyDetector", getPos redForAttack];
							_trg setTriggerArea [800, 800, 0, false];
							_trg setTriggerActivation ["WEST", "PRESENT", false];
							_trg setTriggerStatements ["this", "[thisTrigger getVariable 'triggerflag'] call twc_fnc_createSite", ""];

							_trg setVariable ["triggerFlag",redForAttack];
						};
					}forEach _westSites;
				};
			};
		};
		twc_redScore = twc_redScore - 400;
		waitUntil {scriptDone _scriptDone};
		twc_opforBases pushback redForAttack;
		redForAttack setFlagTexture twc_flagTextureRedfor;
		redForAttack setVariable ["townSide",East];
		_mkr = redForAttack getVariable "townmarker";
		_mkr setMarkerColor "colorEast";
	
		[] call twc_fnc_reCalcBaseConnection;
		remoteExecCall ["twc_fnc_updateTownLines",0];
	
		runLoop = false;
		
		redForAttack = nil;
	};
};
};