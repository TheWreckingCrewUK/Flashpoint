params["_target",["_plane","O_Plane_Fighter_02_Cluster_F"],["_type",3]];


_pos = [];
if(typeName _target == "ARRAY")then{_pos = _target};
if(typeName _target == "OBJECT")then{_pos = getPos _target};

_group = createGroup sideLogic;
_module = _group createUnit["ModuleCAS_F",_pos,[],0,"NONE"];
_module setDir 90;
_module setVariable ["vehicle",_plane];
_module setVariable ["type",_type];

if(typeName _target == "OBJECT")then{
	[_module,_target]spawn{
		params["_module","_target"];
		while{!isnull _module}do{
			_module setPos (getPos _target);
			sleep 0.5;
		};
	};
};