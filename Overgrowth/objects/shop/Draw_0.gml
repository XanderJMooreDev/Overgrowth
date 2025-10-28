draw_sprite(shop_bg,-1,288,8);
if(Player.apple_num > 0){
	draw_sprite(shop_item_slot,-1,304,88);
	draw_sprite(apple_plant_spr,-1,304,96);
	draw_sprite(coin_spr,-1,336,128);
	draw_text(368,128,"10");
}
else{
	draw_sprite(item_slot_unavailable,-1,304,88);
	draw_sprite(apple_plant_spr,-1,304,96);
	draw_sprite(coin_spr,-1,336,128);
	draw_text(368,128,"10");
}