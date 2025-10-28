if iFrames <= 0 {
	other.hitAnimCooldown = 1;
	
	if item1Timer > 0 && items[0] == "Coconut" || item2Timer > 0 && items[1] == "Coconut" {
		hp -= obj_enemy.meleeAtk * .75;
	}
	else {
		hp -= obj_enemy.meleeAtk;
	}
	
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