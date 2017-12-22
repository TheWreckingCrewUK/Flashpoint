params["_pos",["_order",true]];

_array = [];
{
 _distance = (_x getVariable "townPos") distance2D _pos;
 _array = _array + [[_distance,_x]];
}forEach twc_flags;
_array sort _order;

_array