screenEdge = camera_get_view_x(view_camera[0]) + window_get_width() + 500;
show_debug_message(string(screenEdge) + ":" +  string(nextBuilding))

if (screenEdge > nextBuilding) {
		
	buildingY += (irandom(10) - 5) * buildingYDifference;
	if (buildingY > buildingMaxY) buildingY = buildingMaxY;
	if (buildingY < buildingMinY) buildingY = buildingMinY;
	
	var type = irandom(2)
	
	switch(type) {		
		case 0: instance_create_layer(nextBuilding, buildingY, "instance_layer", oBuilding1); break
		case 1: instance_create_layer(nextBuilding, buildingY, "instance_layer", oBuilding2); break
		case 2: instance_create_layer(nextBuilding, buildingY, "instance_layer", oBuilding3); break;
	
	}
	
	nextBuilding += buildingWidth + spaceBetweenBuildings

	show_debug_message("Ik heb een gebouwtje gemaakt!: " + string(type))
}

layer_x( "SkyLine", floor(lerp(0, camera_get_view_x(view_camera[0]), .8)));


if (keyboard_check(vk_escape)) {
	game_end();
}

