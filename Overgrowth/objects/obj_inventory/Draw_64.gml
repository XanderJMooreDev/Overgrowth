var xx = 64;
var yy = 64;

for(var i = 0;i < 5;i++){
draw_sprite(Sprite11,-1,960+(xx * i),yy);
}

//sprites
draw_sprite(corn_seeds,-1,960,yy);
draw_sprite(apple_seeds,-1,960 + xx,yy);
draw_sprite(banana_seeds,-1,960 + (xx*2),yy);
draw_sprite(chili_seeds,-1,960 + (xx*3),yy);
draw_sprite(brocolli_seeds,-1,960 + (xx*4),yy);

//keybinds
draw_set_font(fn_Ubuntu);
draw_text(992,128,"1");
draw_text(1056,128,"2");
draw_text(1120,128,"3");
draw_text(1184,128,"4");
draw_text(1248,128,"5");

for(var i = 0;i < 5;i++){
draw_sprite(Sprite11,-1,960+(xx * i),648);
}

//plant products
draw_sprite(corn_plant_spr,-1,960,656);
draw_sprite(apple_plant_spr,-1,960+xx,656);
draw_sprite(banana_plant_spr,-1,960+xx+xx,656);
draw_sprite(chili_plant_spr,-1,960+xx+xx+xx,656);
draw_sprite(broc_plant_spr,-1,960+xx+xx+xx+xx,656);