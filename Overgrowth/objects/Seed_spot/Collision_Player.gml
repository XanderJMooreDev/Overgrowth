if(keyboard_check(ord("3")) && obj_ultimate_manager.cornSeedNum > 0){
	instance_change(cornPlant_1,true);
	obj_ultimate_manager.cornSeedNum--;
}
if(keyboard_check(ord("1")) && obj_ultimate_manager.appleSeedNum > 0){
	instance_change(applePlant_1,true);
	obj_ultimate_manager.appleSeedNum--;
}
if(keyboard_check(ord("4")) && obj_ultimate_manager.banSeedNum > 0){
	instance_change(bananaPlant_1,true);
	obj_ultimate_manager.banSeedNum--;
}
if(keyboard_check(ord("2")) && obj_ultimate_manager.brocSeedNum > 0){
	instance_change(brocPlant_1,true);
	obj_ultimate_manager.brocSeedNum--;
}