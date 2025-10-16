if iFrames <= 0 {
	hp -= obj_enemy.meleeAtk;
	iFrames = 2;
	show_debug_message(hp);
	
	if effectedType != "None" {
		return;
	}
	
	effectTimer = 5;
	
	show_debug_message(other.type);
	
	if other.type == "Chili" {
		
	}
	else if other.type == "Mushroom1" {
		effectedType = "Weakened";
		meleeAtk *= .75;
	}
	else if other.type == "Grapes" {
		effectedType = "Slowed";
		playerSpeed *= .5;
	}
}