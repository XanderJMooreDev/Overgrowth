if !instance_exists(obj_player_combat) {
	return;
}

if !(type == "Banana" && shootCooldown > 3) && moveType == "Basic" {
	basic_move();
}

if place_meeting(x, y, obj_stab_hitbox) && obj_player_combat.state == "Melee Stab" && iFrames <= 0 {
	if obj_player_combat.item1Timer > 0 && obj_player_combat.items[0] == "Mushroom2" || obj_player_combat.item2Timer > 0 && obj_player_combat.items[1] == "Mushroom2" {
		hp -= obj_ultimate_manager.playerDamage * 1.25;
	}
	else {
		hp -= obj_ultimate_manager.playerDamage;
	}
	
	iFrames = 2;
	
	obj_player_combat.manna += 5;
	
	if obj_player_combat.manna > obj_player_combat.maxManna {
		obj_player_combat.manna = obj_player_combat.maxManna;
	}
	
	if type == "Apple" {
		obj_player_combat.hp += 15;
	
		if obj_player_combat.hp > obj_player_combat.maxHp {
			obj_player_combat.hp = obj_player_combat.maxHp;
		}
	}
	
	if obj_player_combat.meleePerk == "Mushroom1" {
		effectedType = "Weakened";
		effectTimer = 4;
	}
	
	show_debug_message(hp);
}

if hp <= 0 {
	effect_create_layer("Instances", ef_smoke, x, y, 10, c_green);
	obj_enemy_manager.enemiesInRoom--;
	
	if irandom_range(0,1) == 1 {
		instance_create_layer(x, y, "Instances", apple_seed_obj);
	}
	else if irandom_range(0,1) == 1 {
		instance_create_layer(x, y, "Instances", brocolli_seeds_obj);
	}
	else if irandom_range(0,1) == 1 {
		instance_create_layer(x, y, "Instances", banana_seeds_obj);
	}
	else {
		instance_create_layer(x, y, "Instances", corn_seeds_obj);
	}
	
	instance_destroy();
}

if type == "Banana" && shootCooldown > 3 {
	sprite_index = spr_banana_shoot;
}
else if hitAnimCooldown > 0 {
	sprite_index = attackFrame;
}
else {
	sprite_index = walkFrame;
}

update_cooldowns();

if iFrames > 0 {
	image_alpha = iFrames % 1;
}
else {
	image_alpha = 1;
}