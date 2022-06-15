draw_text(0,0,"combat phase :"+string(combatPhase)+" selected target: "+string(global.selectedTargets)+", Process Finished? "+string(processFinished)+", Selected Finished? "+string(selectedFinished));

for(var i=0;i<ds_list_size(global.units);i++) {
	draw_text(0,16+(i*16),string(global.units[|i]));
}