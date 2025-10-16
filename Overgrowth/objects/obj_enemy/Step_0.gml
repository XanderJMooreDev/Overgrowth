enemy_joystick(obj_player_combat);

if attempt_move(x + joystickX, y) {
	x += joystickX;
}

if attempt_move(x, y + joystickY) {
	y += joystickY;
}

if place_meeting(x, y, obj_stab_hitbox) && obj_player_combat.state == "Melee Stab" && iFrames <= 0 {
	hp -= obj_player_combat.meleeAtk;
	iFrames = 2;
	show_debug_message(hp);
}

if hp <= 0 {
	effect_create_layer("Instances", ef_smoke, x, y, 10, c_green);
	obj_enemy_manager.enemiesInRoom--;
	instance_destroy();
}

update_cooldowns();