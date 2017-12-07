_townCapitalArray = nearestLocations [[worldSize / 2, worldSize / 2], ["NameCityCapital"], (sqrt 2 *(worldSize / 2))];
twc_capitalLocation = _townCapitalArray select 0;
[twc_capitalLocation,twc_capitalFlag,"placeHolder",1] call twc_fnc_createSite;

nameCityLocationArray = nearestLocations [[worldSize / 2, worldSize / 2], ["NameCity"], (sqrt 2 *(worldSize / 2))];
{
	[_x,twc_cityFlag,"placeHolder",1] call twc_fnc_createSite;
/*	
	_flatAreaSmall = nearestLocations [getPos _x, ["FlatAreaCitySmall"], 500];
	_num = ceil ((count _flatAreaSmall) / 2);
	for "_i" from 1 to _num do{
		_loc = _flatAreaSmall call bis_fnc_selectRandom;
		["comp_smallFOB",0,getPos _loc] execVM "Flashpoint_Core\server\sys_compositions\createComposition.sqf";
		_flatAreaSmall = _flatAreaSmall - [_loc];
	};
*/
}forEach nameCityLocationArray;

_transportArray = nameCityLocationArray + [twc_capitalLocation];


nameVillageLocationArray = nearestLocations [[worldSize / 2, worldSize / 2], ["NameVillage"], (sqrt 2 *(worldSize / 2))];
{
	[_x,twc_villageFlag,"placeHolder",1] call twc_fnc_createSite;
}forEach nameVillageLocationArray;
/*
nameLocalLocationArray = nearestLocations [[worldSize / 2, worldSize / 2], ["nameLocal"], (sqrt 2 *(worldSize / 2))];
{
	if(count (nearestObjects [getPos _x,twc_radioTowers,200]) > 0)then{

	}else{
		[_x,twc_localFlag,"placeHolder",1] call twc_fnc_createSite;
	};
}forEach nameLocalLocationArray;

_radio = nearestObjects [[worldSize / 2, worldSize / 2],twc_radioTowers,(sqrt 2 *(worldSize / 2))];
{
	_loc = createLocation ["n_unknown",getPos _x,5,5];
	_loc setText "Radio";
	[_loc,twc_radioFlag,"placeHolder",1] call twc_fnc_createSite;
}forEach _radio;

_power = nearestObjects [[worldSize / 2, worldSize / 2],twc_powerPlants,(sqrt 2 *(worldSize / 2))];
{
	_loc = createLocation ["n_installation",getPos _x,5,5];
	_loc setText "Power";
	[_loc,twc_powerFlag,"placeHolder",1] call twc_fnc_createSite;
}forEach _power;

nameAirportLocationArray = nearestLocations [[worldSize / 2, worldSize / 2], ["Airport"], (sqrt 2 *(worldSize / 2))];
{
	[_x,twc_airportFlag,"placeHolder",1] call twc_fnc_createSite;
}forEach nameAirportLocationArray;






/*
//Initial Defines:

_infMarker = "n_inf";
_installationMarker =  "n_maint";
_navalMarker = "n_naval";
_smallTownMarker = "n_recon";
_airfieldMarker = "n_air";
_militaryMarker = "n_hq";
_townMarker = "c_unknown";

_installationNames = ["dump","factory","quarry","Stadium","storage","power plant","Fotia","mine"];
_smallTownNames = ["Faros","Aristi","Amfissa","Kaviridia","Eginio","Vikos","Ekali","Nifi","Agios Georgios","Nidasos","Gatolia","Cap Striglia"];
_navalNames = ["Krya Nera","Edessa","Drimea","Nychi","Agia Triada","Zeloran","Cap Zefyris","Faronaki","Livadi","Mazi","Agia Pelagia","Trachia","Surf Club","Cap Kategidis","Cap Thelos","Iraklia","Limnichori","Polemistia"];
_airfieldNames = ["AAC airfield","airbase","Terminal","Molos Airfield"];
_militaryNames = ["military"];
_stupidNames = ["Fournos","Savri","Bomos","Monisi","Cap Makrinos","Cap Drakontas","Pyrgi","Makrynisi","Sagonisi","Cap Agrios","Atsalis","Chelonisi","Limni","Ochrolimni","Almyra","Edoris","Kavala Pier","Gori","Agios Panagiotis","Agios Kosmas"];
_townNames = ["Athanos","Panochori","Neri","Kavala","Aggelochori","Negades","Zaros","Therisa","Kore","Agios Konstantinos","Oreokastro","Syrta","Agios Dionysios","Alikampos","Poliakko","Neochori","Stavros","Lakka","Galati","Abdera","Frini","Anthira","Gravia","Telos","Anthrakia","Charkia","Pyrgos","Selakano","Feres","Panagia","Chalkeia","Dorida","Kalochori","Paros","Ioannina","Sofia","Molos"];

townLocationArray = nearestLocations [[worldSize / 2, worldSize / 2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))];
{
	call{
		if(text _x in _stupidNames)exitWith{};
		if(text _x in _townNames)exitWith{
			[_x, _townMarker,"placeHolder",1] call twc_fnc_createTown;
		};
		if(text _x in _installationNames)exitWith{
			[_x,_installationMarker,"placeHolder",1] call twc_fnc_createSite;
		};
		if(text _x in _smallTownNames)exitWith{
			[_x,_smallTownMarker,"placeHolder",1] call twc_fnc_createSite;
		};
		if(text _x in _navalNames)exitWith{
			[_x,_navalMarker,"placeHolder",1] call twc_fnc_createSite;
		};
		if(text _x in _airfieldNames)exitWith{
			[_x,_airfieldMarker,"placeHolder",1] call twc_fnc_createSite;
		};
		if(text _x in _militaryNames)exitWith{
			[_x,_militaryMarker,"placeHolder",1] call twc_fnc_createSite;
		};		
		//[_x,_infMarker,"placeHolder",1] call twc_fnc_createSite;
	};	
}forEach townLocationArray;
//Makes the townInforArray public. It is simply very convenient to do it now:
publicVariable "townInfoArray";

#include "outpost.sqf";
#include "radio.sqf";
#include "installation.sqf";