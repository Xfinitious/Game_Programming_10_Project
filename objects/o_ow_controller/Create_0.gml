instanceList = ds_list_create();
for (var i = 0; i < instance_number(o_P_Overworld); i++) {
	var inst = instance_find(o_P_Overworld,i);
	ds_list_add(instanceList,inst);
}
player = instance_find(o_Ow_Player,0);
playerPosX = player.x;
playerPosY = player.y;