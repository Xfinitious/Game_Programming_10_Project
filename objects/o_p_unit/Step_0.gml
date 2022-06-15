switch(state) {
	case IDLE:
		if (!defending) {
			if (layer_sequence_get_headpos(unitSequence) > idleEnd) {
				layer_sequence_headpos(unitSequence, idleStart);
			}
		}
	break;
	case ATTACK:
		if (layer_sequence_get_headpos(unitSequence) > attackEnd) {
			turnFinished = true;
			if (attackWillHit) {
				layer_sequence_headpos(unitSequence, idleStart);
				state = IDLE;
			} else {
				layer_sequence_headpos(unitSequence, missStart);
				state = MISS;
			}
		}
	break;
	case MISS:
		if (layer_sequence_get_headpos(unitSequence) > missEnd) {
			layer_sequence_headpos(unitSequence, idleStart);
			state = IDLE;
		}
	break;
	case HURT:
		if (layer_sequence_get_headpos(unitSequence) > hurtEnd) {
			DamageUnit(incomingDamage);
			if (current[@ HEALTH] > 0) {
				o_Manager.processFinished = true;
				layer_sequence_headpos(unitSequence, idleStart);
				incomingDamage = 0;
				state = IDLE;
			}
			else {
				layer_sequence_headpos(unitSequence, deathStart);
				//ds_list_delete(global.units,ds_list_find_index(global.units,id));
				state = DEATH;
			}
		}
	break;
	case TODEFEND:
		if (layer_sequence_get_headpos(unitSequence) > toDefendEnd) {
			layer_sequence_headpos(unitSequence, defendStart);
			state = DEFEND;
		}
	break;
	case DEFEND:
		if (layer_sequence_get_headpos(unitSequence) > defendEnd) {
			layer_sequence_headpos(unitSequence, defendStart);
		}
	break;
	case DEATH:
		if (layer_sequence_get_headpos(unitSequence) > deathEnd) {
			instance_destroy();
		}
	break;
	case SKILL:
		if (layer_sequence_get_headpos(unitSequence) > skillEnd) {
			UseSkillPoints(selectedSkill.cost);
			turnFinished = true;
			if (attackWillHit) {
				//turnFinished = true;
				layer_sequence_headpos(unitSequence,idleStart);
				state = IDLE;
			}
			else {
				//turnFinished = true;
				layer_sequence_headpos(unitSequence,missStart);
				state = MISS;
			}
			selectedSkill = -1;
		}
	break;
}

if ((global.targeting || global.skillTargeting) && global.selectedUnit != noone) {
	if (position_meeting(mouse_x,mouse_y,id) && team != global.selectedUnit.team) {
		drawTarget = true;
		//target.x = x / same with y (for animated sprite)
	}
	else {
		drawTarget = false;
		//disable object (for animated sprite)
	}
}