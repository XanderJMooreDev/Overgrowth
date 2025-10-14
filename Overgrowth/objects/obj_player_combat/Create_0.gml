playerSpeed = 5;

meleePerk = "None";
items = [ "None", "None" ];

state = "None";

keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyStab = keyboard_check(vk_space);

joystickX = 0;
joystickY = 0;

meleeCooldown = 0;

update_cooldowns = function() {
	if meleeCooldown > 0 {
		meleeCooldown -= 1 / game_get_speed(gamespeed_fps);
	}
	else if state == "Melee Stab" {
		state = "None";
	}
}

// Returns whether an attempted move will put us in an impossible spot. 
attempt_move = function(moveX, moveY) {
	return !place_meeting(moveX, moveY, obj_terrain);
}
