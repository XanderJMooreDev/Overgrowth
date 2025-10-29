if iFrames <= 0 {
	instance_destroy(other);
	
	if item1Timer > 0 && items[0] == "Coconut" || item2Timer > 0 && items[1] == "Coconut" {
		hp -= .25;
	}
	else {
		hp -= .5;
	}
	
	iFrames = 1;
}