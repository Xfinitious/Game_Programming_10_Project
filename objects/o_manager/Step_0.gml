switch(combatPhase) {
	case phase.init:
		layer_set_visible(targetUI,false);
		instance_deactivate_layer(targetUI);
		layer_set_visible(baseUI,false);
	
		layer_set_visible(skillsUI,false);
		instance_deactivate_layer(skillsUI);
	
		for (var i = 0; i < instance_number(o_Spawn); i++) {
			var spawner =  instance_find(o_Spawn, i);
			if (spawner.x < room_width/2) {
				var unit = instance_create_depth(spawner.x,spawner.y,0,o_Player);
				unit.team = 0; //create an ally
				unit.current[@ ATTACKPOWER] = 6;
				unit.current[@ ACCURACY] = 0;
			} else {
				var unit = instance_create_depth(spawner.x,spawner.y,0,o_Player)
				unit.team = 1; //create an enemy
				unit.current[@ ACCURACY] = 0.5;
			}
			//ds_list_add(global.units, unit);
		}
		show_message("Enemies Appeared!");
		combatPhase = phase.startTurn;
	break;
	
	case phase.startTurn:
		for (var i = 0; i < instance_number(o_P_Unit); i++) {
			var _inst = instance_find(o_P_Unit,i);
			ds_list_add(global.units,_inst)
		}
		BubbleSort(global.units);
		
		if (unitsFinished >= ds_list_size(global.units)) {
			for (var i = 0; i < ds_list_size(global.units); i++) {
				with(global.units[|i])
					turnFinished = false;
			}
			unitsFinished = 0;
		}
		
		for (var i = 0; i < ds_list_size(global.units); i++) {
			var inst = global.units[|i];
			if (inst.turnFinished == false) {
				
				with (inst) {
					event_user(0);
				}
				
				inst.selected = true;
				inst.attackWillHit = false;
				global.selectedUnit = inst;
				break;
			}
		}
		
		if (!allowInput) {
			allowInput = true;
			event_user(1);
		}
		
		combatPhase = phase.wait;
	break;
	
	case phase.wait:
		if (global.selectedUnit.team > 0 && !aiDone) {
			AIChoose();
		}
		
		if (selectedFinished == true) {
			global.selectedUnit.selected = false;
			unitsFinished++;
			combatPhase = phase.process;
			
			event_user(0);
			layer_set_visible(targetUI,false);
			instance_deactivate_layer(targetUI);
			layer_set_visible(baseUI,false);
			instance_deactivate_layer(baseUI);
		}
	break;
	
	case phase.process:
		allies = 0;
		enemies = 0;
		if (!global.processUnitDeath) {
			global.selectedUnit = noone;
			global.targeting = false;
			for (var i = 0; i < ds_list_size(global.units); i++) {
				with (global.units[|i]) {
					drawTarget = false;
				}
			}
			processFinished = true;
			if (processFinished)
				combatPhase = phase.checkFinish;
		}
	break;
	
	case phase.checkFinish:
		processFinished = false;
		for (var i = 0; i < ds_list_size(global.units); i++) {
			var _unit = global.units[| i];
			if (_unit.team == 0) {
				allies++;
			}
			else enemies++;
		}
		if (allies <= 0) {
			combatPhase = phase.lose;
		}
		else if (enemies <= 0) {
			combatPhase = phase.win;
		}
		else {
			combatPhase = phase.endTurn;
		}
		
	break;
	
	case phase.endTurn:
		selectedFinished = false;
		//processFinished = false;
		ds_list_clear(global.targets);
		global.skillTargeting = false;
		ds_list_clear(global.selectedTargets);
		ds_list_clear(global.units);
		aiDone = false;
		combatPhase = phase.startTurn;
	break;
	
	case phase.win:
		show_message("You Won!");
		room_goto_previous();
	break;
	
	case phase.lose:
		show_message("You Lost!");
		room_goto(room_GameOver);
	break;
}
//finished checking for bugs