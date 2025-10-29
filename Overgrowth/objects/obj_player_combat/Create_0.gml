playerSpeed = 1;
meleeAtk = 1;
defense = 1;
speedBuffed = 1;

projectile = noone;

maxManna = 25;
manna = maxManna;

item1Timer = 0;
item1Cooldown = 0;
item2Timer = 0;
item2Cooldown = 0;

facingDirX = 0;
facingDirY = 0;
totalFacingDir = 0;

maxHp = 25;
hp = maxHp;

instance_create_layer(64, 704, "UI", obj_health_radial);
instance_create_layer(64, 704, "UI", obj_melee_perk);
instance_create_layer(32, 672, "UI", obj_item_1);
instance_create_layer(96, 672, "UI", obj_item_2);

meleePerk = obj_ultimate_manager.meleePerk;
items = [ obj_ultimate_manager.item1, obj_ultimate_manager.item2 ];
iFrames = 0;

state = "None";

keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyStab = keyboard_check(vk_space);
keyItem1 = keyboard_check(ord("Z"));
keyItem2 = keyboard_check(ord("X"));

joystickX = 0;
joystickY = 0;

meleeCooldown = 0;
effectTimer = 0;
effectedType = "None";

update_cooldowns = function() {
	if meleeCooldown > 0 {
		meleeCooldown -= 1 / game_get_speed(gamespeed_fps);
	}
	else if state == "Melee Stab" {
		state = "None";
	}
	
	if effectTimer > 0 {
		effectTimer -= 1 / game_get_speed(gamespeed_fps);
	}
	else if effectedType != "None" {
		if effectedType == "Weakened" {
			meleeAtk /= .75;
		}
		else if effectedType == "Slowed" {
			meleeAtk /= .5;
		}
		
		effectedType = "None";
	}
	
	if iFrames > 0 {
		iFrames -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if item1Cooldown > 0 {
		item1Cooldown -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if item1Timer > 0 {
		item1Timer -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if item2Cooldown > 0 {
		item2Cooldown -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if item2Timer > 0 {
		item2Timer -= 1 / game_get_speed(gamespeed_fps);
	}
}

// Returns whether an attempted move will put us in an impossible spot. 
attempt_move = function(moveX, moveY) {
	return !place_meeting(moveX, moveY, obj_wall_collision);
}
