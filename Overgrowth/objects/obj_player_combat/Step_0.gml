// Checking for inputs
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyStab =  keyboard_check(vk_space);

joystickX = (keyRight - keyLeft) * playerSpeed;
joystickY = (keyDown - keyUp) * playerSpeed;

if joystickX != 0 {
	facingDir = joystickX / playerSpeed;
}

if attempt_move(x + joystickX, y) {
	x += joystickX;
}

if attempt_move(x, y + joystickY) {
	y += joystickY;
}

update_cooldowns();

if meleeCooldown <= 0 && keyStab {
	meleeCooldown = 3;
	state = "Melee Stab";
	instance_create_layer(x + (facingDir * 55), y, "Instances", obj_stab_hitbox);
}