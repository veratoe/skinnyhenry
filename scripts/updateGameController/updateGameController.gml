playerX = instance_find(oPlayer, 0).x;

if (playerX > lastPlayerX) {
	show_debug_message("Gebouwtje")
	
	buildingHeight += (random(10) - 5) * 20;
	if (buildingHeight > 600) buildingHeight = 600;
	if (buildingHeight < 400) buildingHeight = 400;

	
	
	switch(round(random(2))) {		
		case 0: instance_create_layer(lastPlayerX + 750, buildingHeight, "instance_layer", oBuilding1)
		case 1: instance_create_layer(lastPlayerX + 750, buildingHeight, "instance_layer", oBuilding2)
		case 2: instance_create_layer(lastPlayerX + 750, buildingHeight, "instance_layer", oBuilding3)
	}

	lastPlayerX += 500;
}


layer_x( "SkyLine", floor(lerp(0, camera_get_view_x(view_camera[0]), .8)));






