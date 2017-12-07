{
	_dist = 2000;
	_goodTowns = [];
	_pos = _x getVariable "townPos";
	{
		_testDist = _pos distance2D (getPos _x);
		if(_testDist < _dist && _testDist > 5)then{
			_goodTowns pushback _x;
		};
	}forEach twc_flags;
	_x setVariable ["TransportLines",_goodTowns,true];

}forEach twc_flags;


(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",{
	{
		_town = _x;
		{
			_color = [1,1,0,1];
			if(_town getVariable "townSide" == "WEST" && _x getVariable "townSide" == "WEST")then{
				_color = [0,0,1,1];
			};
			if(_town getVariable "townSide" == "EAST" && _x getVariable "townSide" == "EAST")then{
				_color = [1,0,0,1];
			};
			(_this select 0) drawLine [
				(_town getVariable "townPos"),
				getPos _x,
				_color
			];
		}forEach (_x getVariable "TransportLines");
	}forEach twc_flags;
}];