if !instance_exists(obj_player_combat) {
	instance_create_layer(x, y, "Instances", obj_player_combat);
}
else {
	obj_player_combat.x = x;
	obj_player_combat.y = y;
}