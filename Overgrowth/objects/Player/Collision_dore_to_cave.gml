if room == Home{
	room_goto(cave);
	x= 377;
	y = 60;
}
else if room == cave{
	room_goto(Home);
	x = 367;
	y = 667;
}