var g_height = display_get_gui_height();
var g_width = display_get_gui_width();
color_border = c_black;
color_background = c_white;
draw_set(c_black,0.2);
draw_rectangle(
	ui_padding_x+ui_border_size,
	ui_padding_y+ui_border_size,
	(g_width - ui_padding_x)+ui_border_size,
	(g_height - ui_padding_y)+ui_border_size,
	false);
draw_set(color_border,1);
draw_rectangle(
	ui_padding_x,
	ui_padding_y,
	(g_width - ui_padding_x),
	(g_height - ui_padding_y),
	false);
draw_set(color_background,1);
draw_rectangle(
	ui_padding_x+ui_border_size,
	ui_padding_y+ui_border_size,
	(g_width - ui_padding_x)-ui_border_size,
	(g_height - ui_padding_y)-ui_border_size,
	false);
draw_set(color_border,1);
draw_rectangle(
	ui_padding_x+ui_border_size,
	ui_padding_y+ui_border_size,
	ui_padding_x+ui_panel_left+ui_border_size,
	g_height-ui_padding_y-ui_border_size,
	false);
	
draw_set_font(fn_Ubuntu);
text_align(fa_left,fa_top);
draw_text(
	ui_padding_x+(ui_border_size*3) +4,
	ui_padding_y+(ui_border_size*3)+4,
	"Stats");
	
draw_set(c_white,1);
draw_text(
	ui_padding_x+(ui_border_size*3),
	ui_padding_y+(ui_border_size*3),
	"Stats");
	
draw_set_font(fn_Ubuntu);
text_align(fa_left,fa_top);
draw_text(
	ui_padding_x+ui_border_size+ui_panel_left+ui_inventory_margin+4,
	ui_padding_y+(ui_border_size*3)+4,
	"Inventory");
	
draw_set(c_black,1);
draw_text(
	ui_padding_x+ui_border_size+ui_panel_left+ui_inventory_margin,
	ui_padding_y+(ui_border_size*3),
	"Inventory");
	
	var inventory_items = inventory.itemGet();
for(var row = 0; row < inventory_rows; row++){
	var pos_y = ui_padding_y+(ui_border_size*13) +(row * (ui_inventory_margin+ui_inventory_box));
	for(var column = 0; column< inventory_columns  ; column++){
	var pos_x = ui_padding_x+ui_panel_left+ui_border_size+ui_inventory_padding+(column *(ui_inventory_margin+ui_inventory_box));
	
	draw_sprite_ext(
	slot,
	0,
	pos_x+4,
	pos_y+4,
	1,1,0,c_black,0.4);
	draw_sprite_ext(
	slot,
	0,
	pos_x,
	pos_y,
	1,1,0,c_white,1);
	
	//sprite draw
	var inventory_index = (row*inventory_columns)+column;
	if (inventory_index <= array_length(inventory)-1){
		draw_sprite(inventory[inventory.index].sprite,0,pos_x,pos_y);
	}
	
	//quantity draw
	if (inventory_index <= array_length(inventory)-1){
		draw_set(#232323,1);
		draw_circle(
			pos_x + ui_inventory_box,
			pos_y+ui_inventory_box,
			14,
			false);
		
		draw_set(c_white,1);
		text_align(fa_center,fa_middle);
		
		draw_text(
			pos_x+ui_inventory_box,
			pos_y+ui_inventory_box,
			inventory_items[inventory_index].quantity);
	}

}
}