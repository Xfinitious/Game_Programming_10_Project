if (event_data[? "event_type"] == "sequence event") {
	switch(event_data[? "message"]) {
		case "AttackSent":
			//show_message(string(global.selectedUnit)+" Attacks!");
			selectedFinished = true;
		break;
		
		case "UnitDefend":
			//show_message(string(global.selectedUnit)+" Defends!");
			global.selectedUnit.turnFinished = true;
			selectedFinished = true;
			processFinished = true;
		break;
		//fixes
		case "UnitDeath":
			global.processUnitDeath = true;
		break;
		
		case "UnitMiss":
			//show_message(string(global.selectedUnit)+" Missed");
		//case "UnitHurt": // fixes
			processFinished = true;
		break;
		
		case "SkillSent":
			//show_message(string(global.selectedUnit)+" uses "+string(global.selectedUnit.selectedSkill.name));
			selectedFinished = true;
			skillSent = false;
		break;
	}
}
//finished checking for bugs