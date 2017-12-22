//Disable hearing ai talk
enableSentences false;
 
//Enable or Disable Debug
twc_playerDebug = false;

twc_restrictedPrimaryWeapons = [""];
twc_restrictedSecondaryWeapons = [""];
twc_restrictedHangunWeapons = [""];

// Here be the list of vehicles, its restricted slots and players exempt from that
// always class names of the objects, including the player (so for example British Pilot = Modern_British_heliPilot)

// FORMAT:
// ["vehicle class name", ["slot name", ["acceptable person 1", ...]]],
// known slot names (verbatim): "driver", "gunner", "commander", "Turret", or "cargo"
twc_restrictedVehicleSlots = [
	["CUP_B_C130J_GB", 
		["driver", 
			["Modern_British_JetPilot"]
		],
		["commander", 
			["Modern_British_JetPilot"]
		]
	],
	
	["CUP_B_C130J_Cargo_GB",
		["driver",
			["Modern_British_JetPilot"]
		],
		["commander", 
			["Modern_British_JetPilot"]
		]
	],
	
	["UK3CB_BAF_Wildcat_AH1_CAS_8A", 
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["commander", 
			["Modern_British_JetPilot","Modern_USMC_HeliPilot"]
		]
	],
	
	["RHS_UH60M_D", 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["commander", 
			["Modern_British_JetPilot","Modern_USMC_HeliPilot"]
		]
	]
];
twc_supplyBoxBuildables = [["Land_HBarrier_Big_F",100],["Land_HBarrier_1_F",20],["Land_HBarrierTower_F",200],["Land_BarGate_F",75],["Land_BagBunker_Large_F",200],["Land_BagBunker_Small_F",150],["CamoNet_BLUFOR_big_F",50],["USMC_WarfareBFieldhHospital",400],["Land_fort_artillery_nest",200]];

//Slot Restrictions. TBA when we are doing more then just testing
_justPlayers = count(allPlayers - entities "HeadlessClient_F");
if(false)then{
	["End2", false, 0] call BIS_fnc_endMission;
};

execVM "Flashpoint_Core\client\init.sqf";