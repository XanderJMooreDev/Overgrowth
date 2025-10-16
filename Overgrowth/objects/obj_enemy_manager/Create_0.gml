caveLevel = -1;

enemiesInRoom = 0;

enemy_names = ["Chili", "Melon", "Corn", "Mushroom1", "Banana", "Mushroom2", "Broccoli", "Coconut", "Carrot", "Cherries", "Grapes", "Rotten Apple", "Lantern", "Apple"];
enemy_atk =   [ 1,      1,       1,      1,           1,        4,           2,          2,         2,        0,          2 ];
enemy_hp =    [ 3,      6,       1,      4,           5,        6,           5,          12,        4,        4,          6 ];
enemy_spd =   [ 1,      1,       1,      1,           1,        1,           1,          2,         5,        2,          1 ];
enemy_moves = ["Basic", "Basic", "Basic","Still",     "Basic",  "Still",     "Bouncy",   "Burst",   "Burst",  "Basic",    "Basic"];
  
spawn_enemy = function(enemyId, xPos, yPos) {
	enemiesInRoom++;
	enemySpawning = instance_create_layer(xPos, yPos, "Instances", obj_enemy);
	enemySpawning.type = enemy_names[enemyId];
	enemySpawning.hp = enemy_hp[enemyId];
	enemySpawning.meleeAtk = enemy_atk[enemyId];
	enemySpawning.moveSpeed = enemy_spd[enemyId];
	enemySpawning.moveType = enemy_moves[enemyId];
}

generate_enemy = function(xApprox, yApprox) {
	if random(150) == 33 {
		spawn_enemy(13, xApprox + random_range(-100, 100), yApprox + random_range(-100, 100));
	}
	else if caveLevel == -1 {
		spawn_enemy(3, xApprox + random_range(-100, 100), yApprox + random_range(-100, 100));
	}
	else if caveLevel <= 10 {
		spawn_enemy(random_range(0, 2), xApprox + random_range(-100, 100), yApprox + random_range(-100, 100));
	}
}