function Inventory() constructor{
	inventory_items = [];
	itemSet = function(_name,_quantity,_sprite){
		array_push(inventory_items, {
			name: _name,
			quantity: _quantity,
			sprite: _sprite,
		});
	}
	itemFind = function(_name){
			for(var i = 0; i < array_length(inventory_items);i++){
				if (_name == inventory_items[i].name){
					return i;
				}
			}
			return -1;
	}
	itemAdd = function(_name,_quantity,_sprite){
				var index  = itemFind(_name);
				if (index >= 0){
					inventory_items[index].quantity += _quantity;
				}
				else{
					itemSet(_name,_quantity,_sprite);
				}
			}
	toString = function(){
		return json_stringify(inventory_items);
	}
	itemHas = function(_name,_quantity){
		var index = itemFind(_name);
				if (index >= 0){
					return inventory_items[index].quantity >= _quantity;
				}
				else{
					return false;
				}
			}
	itemRemove = function(_index){
		array_delete(inventory_items,_index,1);
	}
	itemSubtract = function(_name,_quantity){
		var index = itemFind(_name);
				if (index >= 0){
					if (itemHas(_name,_quantity)){
						inventory_items[index].quantity -= _quantity;
					
						if (inventory_items[index].quantity <= 0){
							itemRemove(index);
						}
					}
				}
			}
	itemGet = function(){
		return inventory_items;
	}
}