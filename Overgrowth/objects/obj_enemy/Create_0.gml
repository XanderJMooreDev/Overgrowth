joystickX = 0;
joystickY = 0;

velocityX = 0;
velocityY = 0;

// Enemy-specific properties. Set by the creator object. 
hp = 5;
moveSpeed = 2;
meleeAtk = 0;
moveType = "Basic";
type = "None";
shootCooldown = 1;
projectile = noone;

// Applies to the effect they've been inflicted with
effectedType = "None";
effectTimer = 0;

//Applies to the effect they inflict
effectUse = "None";

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
