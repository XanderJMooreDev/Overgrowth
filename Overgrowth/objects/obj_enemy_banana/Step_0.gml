x += speedX;
y += speedY;

if x < 0 || x > 1400 || y < 0 || y > 800 {
	instance_destroy();
}