//movements
if keyboard_check(ord("W")) {
	y -= playerSpeed;
}
if keyboard_check(ord("A")) {
	x -= playerSpeed;
}
if keyboard_check(ord("S")) {
	y += playerSpeed;
}
if keyboard_check(ord("D")) {
	x += playerSpeed;
}