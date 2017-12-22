{
	_goodTowns = [];
	_pos = _x getVariable "townPos";
	_flag = _x;
	{
		_testDist = _pos distance2D (getPos _x);
		if(_testDist < (_flag getVariable "twc_transportDistance") && _testDist > 5)then{
			_goodTowns = _goodTowns + [[_testDist,_x]];
		};
	}forEach twc_flags;
	_goodTowns sort true;
	_goodTowns resize 4;
	_final = [];
	{
		_final pushback (_x select 1);
	}forEach _goodTowns;
	_x setVariable ["TransportLines",_final,true];

}forEach twc_flags;


(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",{
	{
		_town = _x;
		{
			_color = [1,1,0,1];
			if(str (_town getVariable "townSide") == "WEST" && str (_x getVariable "townSide") == "WEST")then{
				_color = [0,0,1,1];
			};
			if(str (_town getVariable "townSide") == "EAST" && str (_x getVariable "townSide") == "EAST")then{
				_color = [1,0,0,1];
			};
			if(str (_town getVariable "townSide") == "GUER" && str (_x getVariable "townSide") == "GUER")then{
				_color = [0,1,0,1];
			};
			(_this select 0) drawLine [
				(_town getVariable "townPos"),
				getPos _x,
				_color
			];
		}forEach (_x getVariable "TransportLines");
	}forEach twc_flags;
}];