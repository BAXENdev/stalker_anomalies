#include "\z\diwako_anomalies\addons\main\script_component.hpp"
/*
    Function: diwako_anomalies_main_fnc_createAnomalyField

    Description:
        Creates and anomaly field with specific amount of each anomaly type

    Parameter:
        _posParams - array containing parameters for the function CBA_fnc_randPosArea, See dokumentation here:http://cbateam.github.io/CBA_A3/docs/files/common/fnc_randPosArea-sqf.html (default: [])
        _springboard     - how many anomalies of the type springboard should be created (default: 0)
        _burner         - how many anomalies of the type burner should be created (default: 0)
        _electra         - how many anomalies of the type electra should be created (default: 0)
        _meatgrinder     - how many anomalies of the type meatgrinder should be created (default: 0)

    Returns:
        array of all crated anomalies

    Author:
    diwako 2018-03-21
*/
params["_posParams",["_springboard",0],["_burner",0],["_electra",0],["_meatgrinder",0]];
if !(isServer) exitWith {nil};

if !(_posParams isEqualType []) then {
    //created via module
    private _pos = _posParams getVariable "objectarea";
    _springboard = _posParams getVariable ["springboards",0];
    _burner = _posParams getVariable ["burners",0];
    _electra = _posParams getVariable ["electras",0];
    _meatgrinder = _posParams getVariable ["meatgrinders",0];
    private _module = _posParams;
    _posParams = [[(getPos _posParams), _pos#0, _pos#1, _pos#2, _pos#3]];
    deleteVehicle _module;
};

private _anomalies = [];

for "_i" from 1 to _springboard do {
    _pos = _posParams call CBA_fnc_randPosArea;
    _pos set [2, 0];
    _anomalies pushBack ([AGLToASL _pos] call FUNC(createSpringboard));
};

for "_i" from 1 to _burner do {
    _pos = _posParams call CBA_fnc_randPosArea;
    _pos set [2, 0];
    _anomalies pushBack ([AGLToASL _pos] call FUNC(createBurner));
};

for "_i" from 1 to _electra do {
    _pos = _posParams call CBA_fnc_randPosArea;
    _pos set [2, 0];
    _anomalies pushBack ([AGLToASL _pos] call FUNC(createElectra));
};

for "_i" from 1 to _meatgrinder do {
    _pos = _posParams call CBA_fnc_randPosArea;
    _pos set [2, 0];
    _anomalies pushBack ([AGLToASL _pos] call FUNC(createMeatgrinder));
};

_anomalies
