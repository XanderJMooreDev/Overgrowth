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
	facingDirX = joystickX / playerSpeed;
	totalFacingDir = 0;
}
else if joystickY != 0 {
	facingDirY = joystickY / playerSpeed;
	totalFacingDir = 1;
}

if item1Cooldown <= 0 && keyItem1 && items[0] == "Melon" {
	projectile = instance_create_layer(x, y, "Instances", obj_player_melon_seed);
	if totalFacingDir == 0 {
		projectile.speedX = facingDirX * 7;
	}
	else {
		projectile.speedY = facingDirY * 7;
	}
	
	if items[0] == "Melon" {
		item1Cooldown = .2;
	}
	else {
		item2Cooldown = .2;
	}
}

if item1Cooldown <= 0 && keyItem1 && items[0] == "Banana" {
	projectile = instance_create_layer(x, y, "Instances", obj_player_banana);
	if totalFacingDir == 0 {
		projectile.speedX = facingDirX * 7;
	}
	else {
		projectile.speedY = facingDirY * 7;
	}
	
	projectile = instance_create_layer(x, y, "Instances", obj_player_banana);
	if totalFacingDir == 0 {
		projectile.speedX = facingDirX * 7;
		projectile.speedY = facingDirY * 7;
	}
	else {
		projectile.speedX = facingDirX * 7;
		projectile.speedY = facingDirY * 7;
	}
	
	projectile = instance_create_layer(x, y, "Instances", obj_player_banana);
	if totalFacingDir == 0 {
		projectile.speedX = facingDirX * 7;
		projectile.speedY = -facingDirY * 7;
	}
	else {
		projectile.speedX = -facingDirX * 7;
		projectile.speedY = facingDirY * 7;
	}
	
	if items[0] == "Banana" {
		item1Cooldown = 2;
	}
	else {
		item2Cooldown = 2;
	}
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
	instance_create_layer(x + (facingDirX * 55), y, "Instances", obj_stab_hitbox);
}