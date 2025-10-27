draw_sprite(shop_bg,-1,288,712);

//draw apple slot
if(apple_num > 0){
	draw_sprite(shop_item_slot,-1,304,88);
	draw_sprite(apple_plant_spr,-1,640,72);
	draw_sprite(coin_spr,-1,640,104);
}
else{
	draw_sprite(item_slot_unavailable,-1,304,88);
	draw_sprite(apple_plant_spr,-1,640,72);
	draw_sprite(coin_spr,-1,640,104);
}