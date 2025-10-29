joystickX = 0;
joystickY = 0;

velocityX = 0;
velocityY = 0;

hp = 5;
moveSpeed = 2;
meleeAtk = 0;
moveType = "Basic";
type = "None";
shootCooldown = 1;
projectile = noone;
walkFrame = spr_chili_walk;
attackFrame = spr_chili_attack;
hitAnimCooldown = 0;

// Applies to the effect they've been inflicted with
effectedType = "None";
effectTimer = 0;

iFrames = 0;

// Updates the enemy's movement command based on several factors.
enemy_joystick = function(target) {
	// We check horizontal movement by seeing if the player is left or right of it. 
	if target.x > x + 10 {
		joystickX = moveSpeed;
	}
	else if target.x < x - 10 {
		joystickX = -moveSpeed;
	}
	// If they're roughly in-line with the player, we don't move horizontally. 
	else {
		joystickX = 0;
	}
	
	// Almost identical to horizontal code. 
	if target.y > y + 10 {
		joystickY = moveSpeed;
	}
	else if target.y < y - 10 {
		joystickY = -moveSpeed;
	}
	else {
		joystickY = 0;
	}
}

// Returns whether an attempted move will put us in an impossible spot. 
attempt_move = function(moveX, moveY) {
	return !place_meeting(moveX, moveY, obj_wall_collision);
}

update_cooldowns = function() {
	if iFrames > 0 {
		iFrames -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if effectTimer > 0 {
		effectTimer -= 1 / game_get_speed(gamespeed_fps);
	}
	else if effectedType != "None" {
		if effectedType == "Weakened" {
			meleeAtk /= .75;
		}
		
		effectedType = "None";
	}
	
	if shootCooldown > 0 {
		shootCooldown -= 1 / game_get_speed(gamespeed_fps);
	}
	else if type == "Melon" {
		projectile = instance_create_layer(x, y, "Instances", obj_enemy_melon_seed);
		
		if abs(joystickX) > abs(joystickY) {
			projectile.speedX = joystickX * 3;
		}
		else {
			projectile.speedY = joystickY * 3;
		}
		
		shootCooldown = .4;
	}
	else if type == "Banana" {
		projectile = instance_create_layer(x, y, "Instances", obj_enemy_banana);
		
		if abs(joystickX) > abs(joystickY) {
			projectile.speedX = joystickX * 3;
		}
		else {
			projectile.speedY = joystickY * 3;
		}
		
		projectile = instance_create_layer(x, y, "Instances", obj_enemy_banana);
		
		if abs(joystickX) > abs(joystickY) {
			projectile.speedX = joystickX * 3;
			projectile.speedY = joystickX * 3;
		}
		else {
			projectile.speedX = joystickY * 3;
			projectile.speedY = joystickY * 3;
		}
		
		projectile = instance_create_layer(x, y, "Instances", obj_enemy_banana);
		
		if abs(joystickX) > abs(joystickY) {
			projectile.speedX = joystickX * 3;
			projectile.speedY = -joystickX * 3;
		}
		else {
			projectile.speedX = -joystickY * 3;
			projectile.speedY = joystickY * 3;
		}
		
		shootCooldown = 3;
	}
	
	if hitAnimCooldown > 0 {
		hitAnimCooldown -= 1 / game_get_speed(gamespeed_fps);
	}
}

// The simple following-based movement method that most enemies use. 
basic_move = function() {
	enemy_joystick(obj_player_combat);

	if attempt_move(x + joystickX, y) {
		x += joystickX;
	}

	if attempt_move(x, y + joystickY) {
		y += joystickY;
	}
}

// This is super clunky but it works
unlock_if_can = function() {
	if type == "Chili" && !obj_ultimate_manager.chiliUnlocked {
		obj_ultimate_manager.chiliUnlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
	
	if type == "Melon" && !obj_ultimate_manager.melonUnlocked {
		obj_ultimate_manager.melonUnlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
	
	if type == "Mushroom1" && !obj_ultimate_manager.mushroom1Unlocked {
		obj_ultimate_manager.mushroom1Unlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
	
	if type == "Banana" && !obj_ultimate_manager.bananaUnlocked {
		obj_ultimate_manager.bananaUnlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
	
	if type == "Mushroom2" && !obj_ultimate_manager.mushroom2Unlocked {
		obj_ultimate_manager.mushroom2Unlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
	
	if type == "Broccoli" && !obj_ultimate_manager.broccoliUnlocked {
		obj_ultimate_manager.broccoliUnlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
	
	if type == "Coconut" && !obj_ultimate_manager.coconutUnlocked {
		obj_ultimate_manager.coconutUnlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
	
	if type == "Carrot" && !obj_ultimate_manager.carrotUnlocked {
		obj_ultimate_manager.carrotUnlocked = true;
		effect_create_layer("Instances", ef_star, x, y, 10, c_yellow);
	}
}