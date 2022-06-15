function AttackButton() {
	global.targeting = true;
	for (var i = 0; i < ds_list_size(global.units); i++) {
		var _inst = global.units[| i];
		if (_inst.team != global.selectedUnit.team) { //fixes
			ds_list_add(global.targets,_inst);
		}
	}
	with (o_Manager) {
		event_user(0); //disable input
		event_user(1);
		event_user(2);
		event_user(0); //enable input
	}
}

function CancelButton() {
	global.selectedUnit.selectedSkill = -1;
	global.targeting = false;
	global.skillTargeting = false;
	ds_list_clear(global.targets);
	with (o_Manager) {
		event_user(1);
		if (layer_get_visible(targetUI))
			event_user(2);

		else if (layer_get_visible(skillsUI))
			event_user(3);
	}
}


function DefendButton() {
	if (o_Manager.allowInput) {
		with (global.selectedUnit) {
			state = TODEFEND;
			layer_sequence_headpos(unitSequence,toDefendStart);
		}
		with (o_Manager) {
			//event_user(0); //disable input
			event_user(1);
		}
	}
}


function SkillMenu() {
	with (o_Manager) {
		event_user(0); //disable input
		event_user(1);
		event_user(3);
		event_user(0); //enable input
	}
}

function SkillButton() {
	var _cost = global.selectedUnit.learnedSkill[@ ds_list_find_index(global.skillsButtons,id)].cost;
	var _sp = global.selectedUnit.current[@ SKILLPOINTS];
	if (_sp >= _cost) {
		global.skillTargeting = true;
		global.selectedUnit.selectedSkill = global.selectedUnit.learnedSkill[@ ds_list_find_index(global.skillsButtons,id)];
		for (var i = 0; i < ds_list_size(global.units); i++) {
			var _inst = global.units[| i];
			if (_inst.team != global.selectedUnit.team) { //fixes
				ds_list_add(global.targets,_inst);
			}
		}
		with (o_Manager) {
			event_user(0); //disable input
			event_user(2);
			event_user(3);
			event_user(0); //enable input
		}
	} else {
		show_message("Not enough skill points!");	
	}
	
}

function DebugWin() {
	with (o_Manager) {
		combatPhase = phase.win;
	}
}

function DebugRestart() {
	game_restart();
}

function DebugLose() {
	with (o_Manager) {
		combatPhase = phase.lose;
	}
}

//finished checking for bugs