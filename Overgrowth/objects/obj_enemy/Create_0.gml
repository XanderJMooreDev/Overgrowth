joystickX = 0;
joystickY = 0;

velocityX = 0;
velocityY = 0;

hp = 5;
moveSpeed = 2;
attackDmg = 0;
effectApplied = "None";
effectTime = 0;

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
	return !place_meeting(moveX, moveY, obj_terrain);
}

update_cooldowns = function() {
	if iFrames > 0 {
		iFrames -= 1 / game_get_speed(gamespeed_fps);
	}
}
