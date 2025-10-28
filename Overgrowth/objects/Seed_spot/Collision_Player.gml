if(keyboard_check(ord("1")) && other.corn_seed_num > 0){
	instance_change(corn_plant,true);
	other.corn_seed_num--;
}
if(keyboard_check(ord("2")) && other.apple_seed_num > 0){
	instance_change(apple_plant,true);
	other.apple_seed_num--;
}
if(keyboard_check(ord("3")) && other.banana_seed_num > 0){
	instance_change(banana_plant,true);
	other.banana_seed_num--;
}
if(keyboard_check(ord("4")) && other.chili_seed_num > 0){
	instance_change(chili_plant,true);
	other.chili_seed_num--;
}
if(keyboard_check(ord("5")) && other.broc_seed_num > 0){
	instance_change(brocolli_plant,true);
	other.broc_seed_num--;
}