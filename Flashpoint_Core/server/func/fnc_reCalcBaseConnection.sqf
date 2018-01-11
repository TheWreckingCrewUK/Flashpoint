params[""];
{
	if(str _x == "twc_bluforBaseFlagPole")then
	{
	
	}else{
		_x setVariable ["connectedToBase",false];
	};
}forEach twc_bluforBases;
{
	if(!(_x getVariable "twc_mainBase"))then{
		_x setVariable ["connectedToBase",false];
	};
}forEach twc_opforBases;

for "_i" from 0 to (count twc_bluforBases)do{
	_y = twc_bluforBases select _i;
	{
		if(_x getVariable "connectedToBase")then{
			if(str (_y getVariable "townSide") == "WEST" && str (_x getVariable "townSide") == "WEST")then{
				_y setVariable ["connectedToBase",true,true];
			};
		};
	}foreach (_y getVariable "TransportLines");
};

for "_i" from 0 to (count twc_opforBases)do{
	_y = twc_opforBases select _i;
	{
		if(_x getVariable "connectedToBase")then{
			if(str (_y getVariable "townSide") == "EAST" && str (_x getVariable "townSide") == "EAST")then{
				_y setVariable ["connectedToBase",true,true];
			};
		};
	}foreach (_y getVariable "TransportLines");
};