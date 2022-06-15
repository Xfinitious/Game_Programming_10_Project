randomize();

enum phase {
	init,
	startTurn,
	wait,
	process,
	checkFinish,
	endTurn,
	win,
	lose
}
combatPhase = phase.init;
unitsFinished = 0;
selectedFinished = false;
processFinished = false;
allowInput = false;

allies = 0;
enemies = 0;
aiDone = false;

global.selectedUnit = noone
global.units = ds_list_create();
global.selectedTargets = ds_list_create();

global.targets = ds_list_create();//potential targets
global.targeting = false;

baseUI = layer_get_id("BaseUI");
targetUI = layer_get_id("TargetUI");

global.skillsButtons = ds_list_create();
global.skillTargeting = false;
skillSent = false;
instance_create_depth(0,0,0,o_Skills);
skillsUI = layer_get_id("SkillsUI");

global.processUnitDeath = false;

function ProcessDeath() {
	for (var i = 0; i < ds_list_size(global.units); i++) {
		var inst = global.units[|i];
		if (inst.current[@HEALTH] <= 0) {
			show_debug_message("remove "+string(inst)+" from the list"); //only for debug
			ds_list_delete(global.units,ds_list_find_index(global.units,inst));
		}
	}
}