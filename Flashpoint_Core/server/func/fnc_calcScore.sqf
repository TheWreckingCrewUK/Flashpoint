params["_side"];

_side = "GUER";
_capturedArray = [];

if(_side == "GUER")then{
	_capturedArray = twc_greenBases;
};
if(_side == "WEST")then{
	_capturedArray = twc_bluforBases;
};
if(_side == "EAST")then{
	_capturedArray = twc_opforBases;
};
_score = 0;
{
	_score = _score + (_x getVariable "townValue");
}forEach _capturedArray;

_score