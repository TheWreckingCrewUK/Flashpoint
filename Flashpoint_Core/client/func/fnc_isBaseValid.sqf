params["_player"];

_pos = getpos _player;
_bool = true;

if(_pos distance2D (getMarkerPos "respawn_West") > 400)exitWith{_bool = false;_bool};
if(_pos distance2D (getPos crateBox) > 400)exitWith{_bool = false;_bool};
if(_pos distance2D (getPos vehicleSpawnPad) > 400)exitWith{_bool = false; _bool};
if(_pos distance2D (getPos helicopterSpawnPad) > 400)exitWith{_bool = false; _bool};

_bool