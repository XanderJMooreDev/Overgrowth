draw_sprite_stretched(Sprite11,0,500,50,25+rowlength*50,50+(((INVENTORY_SPACE-1) div rowlength)+1)*50);
for (var i =0; i < INVENTORY_SPACE;i +=1){
	var xx = x + (i mod rowlength)* 36 +2;
	var yy = y + (i div rowlength)*36+2;
	draw_sprite(slot,0,xx,yy);
}