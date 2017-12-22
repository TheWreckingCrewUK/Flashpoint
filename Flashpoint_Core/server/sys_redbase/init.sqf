//Finds a position for the redfor base

_bluePos = (getMarkerPos "respawn_west");
_random = random 100;
_town = "";

_townCapitalArray = nearestLocations [[worldSize / 2, worldSize / 2], ["NameCityCapital"], (sqrt 2 *(worldSize / 2))];
if(_random < 20 && (getPos (_townCapitalArray select 0)) distance2D _bluePos > 4000)exitWith{
	_town= (_townCapitalArray select 0);
	[_town] call twc_fnc_createRedBase;
};

_nameCityLocationArray = nearestLocations [[worldSize / 2, worldSize / 2], ["NameCity"], (sqrt 2 *(worldSize / 2))];
if(_random < 50)exitWith{
	_true = true;
	while{_true}do{
		_town = _nameCityLocationArray call bis_fnc_selectRandom;
		if((getPos _town) distance2D _bluePos > 4000)then{
			_true = false;
		};
	};
	[_town] call twc_fnc_createRedBase;
};

_nameVillageLocationArray = nearestLocations [[worldSize / 2, worldSize / 2], ["NameVillage"], (sqrt 2 *(worldSize / 2))];
_true = true;
while{_true}do{
	_town = _nameVillageLocationArray call bis_fnc_selectRandom;
	if((getPos _town) distance2D _bluePos > 4000)then{
		_true = false;
	};
};
[_town] call twc_fnc_createRedBase;