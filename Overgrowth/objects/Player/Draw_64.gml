draw_sprite(Sprite17,-1,960,26);
draw_sprite(Sprite20,-1,1024,26);
draw_sprite(Sprite19,-1,1088,26);
draw_sprite(Sprite18,-1,1152,26);

draw_set_font(fn_Ubuntu);
draw_text(992,26,appleSeedNum);
draw_text(1056,26,brocSeedNum);
draw_text(1120,26,cornSeedNum);
draw_text(1184,26,banSeedNum);

//keybinds
draw_text(960,90,"1");
draw_text(1024,90,"2");
draw_text(1088,90,"3");
draw_text(1152,90,"4");

//plants
draw_sprite(Sprite16,-1,960,656);
draw_sprite(Sprite14,-1,1024,656);
draw_sprite(Sprite13,-1,1088,656);
draw_sprite(Sprite15,-1,1152,656);

draw_set_font(fn_Ubuntu);
draw_text(992,656,appleNum);
draw_text(1056,656,brocNum);
draw_text(1120,656,cornNum);
draw_text(1184,656,banNum);

//coins
draw_sprite(coin,-1,32,26);
draw_text(96,26,coinNum);

draw_sprite(dmg,-1,32,64);
draw_text(96,64,playerDamage);

draw_sprite(Sprite25,-1,32,128);
draw_text(96,128,playerSpeed);