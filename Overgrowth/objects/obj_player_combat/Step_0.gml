// Checking for inputs
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyStab =  keyboard_check(vk_space);
keyItem1 = keyboard_check(ord("Z"));
keyItem2 = keyboard_check(ord("X"));

if item1Cooldown == 0 && keyItem1 && (items[0] == "Coconut" || items[0] == "Carrot" ||items[0] == "Mushroom2") {
	item1Cooldown = 20;
	item1Timer = 12;
}

if item2Cooldown == 0 && keyItem2 && (items[1] == "Coconut" || items[1] == "Carrot" ||items[1] == "Mushroom2") {
	item1Cooldown = 20;
	item1Timer = 12;
}

joystickX = (keyRight - keyLeft) * playerSpeed;
joystickY = (keyDown - keyUp) * playerSpeed;

if joystickX != 0 {
	facingDir = joystickX / playerSpeed;
}

if item1Timer > 0 && items[0] == "Carrot" || item2Timer > 0 && items[1] == "Carrot" {
	joystickX *= 1.5;
	joystickY *= 1.5;
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