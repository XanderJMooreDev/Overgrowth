var xx = 64;
var yy = 64;
var corn_num = corn_seeds_obj.num;
var apple_num = apple_seed_obj.num;
var banana_num = banana_seeds_obj.num;
var chili_num = chili_seeds_obj.num;
var brocolli_num = brocolli_seeds_obj.num;

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

//number of seeds
draw_set_font(fn_num);
draw_text(1008,112,corn_num);
draw_text(1072,112,apple_num);
draw_text(1136,112,banana_num);
draw_text(1200,112,chili_num);
draw_text(1264,112,brocolli_num);