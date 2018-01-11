params[""];

{
	twc_redScore = twc_redScore + (_x getVariable "townValue");
}forEach twc_opforBases;
{
	twc_bluScore = twc_bluScore + (_x getVariable "townValue");
}forEach twc_bluforBases;
{
	twc_greenScore = twc_greenScore + ((_x getVariable "townValue") / 10);
}forEach twc_greenBases;