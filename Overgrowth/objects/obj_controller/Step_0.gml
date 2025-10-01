if (keyboard_check_pressed(ord("I")))
{
	
	if (object_get_visible(obj_inventory)){
		object_set_visible(obj_inventory,false);
	}
	else{
		object_set_visible(obj_inventory,true);
	}
}
