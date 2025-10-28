caveLevel = 0;

enemiesInRoom = 0;

enemy_names = ["Chili", "Melon", "Corn", "Mushroom1", "Banana", "Mushroom2", "Broccoli", "Coconut", "Carrot", "Cherries", "Grapes", "Rotten Apple", "Lantern", "Apple"];
enemy_atk =   [ 1,      1,       1,      1,           1,        4,           2,          2,         2,        0,          2 ];
enemy_hp =    [ 3,      6,       1,      4,           5,        6,           5,          12,        4,        4,          6 ];
enemy_spd =   [ 1,      1,       1,      1,           1,        1,           1,          2,         5,        2,          1 ];
enemy_moves = ["Basic", "Basic", "Basic","Still",     "Basic",  "Still",     "Bouncy",   "Burst",   "Burst",  "Basic",    "Basic"];
enemy_walk =  [ spr_chili_walk,   spr_melon_walk,   spr_corn_walk,   spr_mushroom1_walk,    ];
enemy_attack =[ spr_chili_attack, spr_melon_attack, spr_corn_attack, spr_mushroom1_attack,  ];

levels = [ room_cave_layout_1, room_cave_layout_2, room_cave_layout_3, room_cave_layout_4, room_cave_layout_5, room_cave_layout_6, room_cave_layout_7, room_cave_layout_8 ];

level_seed = array_create(50);

// Generates which level layout to use for each layer (1-50)
for (var i = 0; i < array_length(level_seed); i++) {
	level_seed[i] = levels[irandom_range(0, array_length(levels) - 1)];
}

spawn_enemy = function(enemyId, xPos, yPos) {
	enemiesInRoom++;
	enemySpawning = instance_create_layer(xPos, yPos, "Instances", obj_enemy);
	enemySpawning.type = enemy_names[enemyId];
	enemySpawning.hp = enemy_hp[enemyId];
	enemySpawning.meleeAtk = enemy_atk[enemyId];
	enemySpawning.moveSpeed = enemy_spd[enemyId];
	enemySpawning.moveType = enemy_moves[enemyId];
	enemySpawning.walkFrame = enemy_walk[enemyId];
	enemySpawning.attackFrame = enemy_attack[enemyId];
}

generate_enemy = function(xApprox, yApprox) {
	if random(150) == 33 {
		spawn_enemy(13, xApprox + random_range(-60, 60), yApprox + random_range(-60, 60));
	}
	else if caveLevel <= 10 {
		spawn_enemy(irandom_range(0, 2), xApprox + random_range(-60, 60), yApprox + random_range(-60, 60));
	}
	else if caveLevel <= 20 {
		spawn_enemy(irandom_range(0, 5), xApprox + random_range(-60, 60), yApprox + random_range(-60, 60));
	}
	else if caveLevel <= 30 {
		spawn_enemy(irandom_range(0, 8), xApprox + random_range(-60, 60), yApprox + random_range(-60, 60));
	}
	else if caveLevel <= 40 {
		spawn_enemy(irandom_range(0, 11), xApprox + random_range(-60, 60), yApprox + random_range(-60, 60));
	}
}