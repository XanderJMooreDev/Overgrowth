//movements
if keyboard_check(ord("W")) {
	y -= obj_ultimate_manager.playerSpeed;
}
if keyboard_check(ord("A")) {
	x -= obj_ultimate_manager.playerSpeed;
}
if keyboard_check(ord("S")) {
	y += obj_ultimate_manager.playerSpeed;
}
if keyboard_check(ord("D")) {
	x += obj_ultimate_manager.playerSpeed;
}

if keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D")) {
	sprite_index = spr_player_walk;
}
else {
	sprite_index = spr_player_stand;
}

if keyboard_check(ord("Z")) {
	if keyboard_check(ord(1)) && obj_ultimate_manager.melonUnlocked {
		obj_ultimate_manager.item1 = "Melon";
	}
	else if keyboard_check(ord(3)) && obj_ultimate_manager.bananaUnlocked {
		obj_ultimate_manager.item1 = "Banana";
	}
	else if keyboard_check(ord(4)) && obj_ultimate_manager.mushroom2Unlocked {
		obj_ultimate_manager.item1 = "Mushroom2";
	}
	else if keyboard_check(ord(6)) && obj_ultimate_manager.coconutUnlocked {
		obj_ultimate_manager.item1 = "Coconut";
	}
	else if keyboard_check(ord(7)) && obj_ultimate_manager.carrotUnlocked {
		obj_ultimate_manager.item1 = "Carrot";
	}
	
	show_debug_message(obj_ultimate_manager.item1);
}

if keyboard_check(ord("X")) {
	if keyboard_check(ord(1)) && obj_ultimate_manager.melonUnlocked {
		obj_ultimate_manager.item2 = "Melon";
	}
	else if keyboard_check(ord(3)) && obj_ultimate_manager.bananaUnlocked {
		obj_ultimate_manager.item2 = "Banana";
	}
	else if keyboard_check(ord(4)) && obj_ultimate_manager.mushroom2Unlocked {
		obj_ultimate_manager.item2 = "Mushroom2";
	}
	else if keyboard_check(ord(6)) && obj_ultimate_manager.coconutUnlocked {
		obj_ultimate_manager.item2 = "Coconut";
	}
	else if keyboard_check(ord(7)) && obj_ultimate_manager.carrotUnlocked {
		obj_ultimate_manager.item2 = "Carrot";
	}
	
	show_debug_message(obj_ultimate_manager.item1);
}

if keyboard_check(vk_space) {
	if keyboard_check(ord(2)) && obj_ultimate_manager.mushroom1Unlocked {
		obj_ultimate_manager.meleePerk = "Mushroom1";
	}
	else if keyboard_check(ord(5)) && obj_ultimate_manager.broccoliUnlocked {
		obj_ultimate_manager.meleePerk = "Broccoli";
	}
	
	show_debug_message(obj_ultimate_manager.meleePerk);
}