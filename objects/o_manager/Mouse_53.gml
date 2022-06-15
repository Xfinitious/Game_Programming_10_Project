/*if (allowInput) {
	with (global.selectedUnit) {
		state = ATTACK;
		layer_sequence_headpos(unitSequence, attackStart);
		for (var i = 0; i < ds_list_size(global.units); i++) {
			if (global.units[|i] != global.selectedUnit) {
				global.selectedTargets = global.units[|i];
				break;
			}
		}
	}
	allowInput = false;
}*/

if (global.targeting) {
	if (position_meeting(mouse_x,mouse_y,o_P_Unit)) {
		var unit = instance_position(mouse_x,mouse_y,o_P_Unit);
		if (unit.team != global.selectedUnit.team) {
		ds_list_clear(global.selectedTargets);
			with (global.selectedUnit) {
				state = ATTACK;
				layer_sequence_headpos(unitSequence,attackStart);
			}
			ds_list_add(global.selectedTargets,unit);
		}
	}
}

if (global.skillTargeting) {
	if (position_meeting(mouse_x,mouse_y,o_P_Unit)) {
		var unit = instance_position(mouse_x,mouse_y,o_P_Unit);
		if (unit.team != global.selectedUnit.team) {
			var _skill = global.selectedUnit.selectedSkill;
			ds_list_clear(global.selectedTargets);
		
			with (global.selectedUnit) {
				state = SKILL;
				layer_sequence_headpos(unitSequence,skillStart);
			}
			script_execute(_skill.action,unit);
		}
	}
}
//finished checking for bugs