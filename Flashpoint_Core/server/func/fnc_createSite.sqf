params["_flag"];

_marker = _flag getVariable "townMarker";
_side = _flag getVariable "townSide";
_type = getMarkerType _marker;

_marker setMarkerColor "colorYellow";

if(_side == independent)then{
	[]call{
		if(_type == twc_villageFlag)exitWith{[_flag]spawn twc_fnc_spawnGreenVillage};
		if(_type == twc_cityFlag)exitWith{[_flag]spawn twc_fnc_spawnGreenVillage};
		if(_type == twc_capitalFlag)exitWith{[_flag]spawn twc_fnc_spawnGreenVillage};
	};
}else{
	[]call{
		if(_type == twc_villageFlag)exitWith{[_flag]spawn twc_fnc_spawnRedVillage};
		if(_type == twc_cityFlag)exitWith{[_flag]spawn twc_fnc_spawnRedVillage};
		if(_type == twc_capitalFlag)exitWith{[_flag]spawn twc_fnc_spawnRedVillage};
	};
};