item = choose(item_melee, item_ranged, item_none, item_seed, item_util);
switch(item)
{
	case item_melee:
		sprite_index = spr_melee;
		break;
	case item_ranged:
		sprite_index = spr_ranged;
		break;
	case item_none:
		sprite_index = spr_none;
		break;
	case item_util:
		sprite_index = spr_util;
		break;
	case item_seed:
		sprite_index = spr_seed;
		break;
}