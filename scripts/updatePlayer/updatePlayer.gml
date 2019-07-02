var leftKeyDown = keyboard_check(playerLeftKey);
var rightKeyDown = keyboard_check(playerRightKey);
var jumpKeyDown = keyboard_check_pressed(playerJumpKey)

if (isDead) {
	return	
}

if (rightKeyDown && !place_meeting(x + 1, y, oBuilding)) {

	if (xSpeed < maxSpeedX) {
		xSpeed += accelerationX;
	}
		
}

if (leftKeyDown && !place_meeting(x - 1, y, oBuilding)) {
	if (xSpeed > -maxSpeedX) {
		xSpeed -= accelerationX;
	}
	
}

xSpeed = maxSpeedX;

if(!rightKeyDown && !leftKeyDown && xSpeed != 0) {
	xSpeed -= sign(xSpeed) * fric;
}

if (jumpKeyDown && state != playerState.jumping) {	
	audio_play_sound(snJump, 10, false);
	state = playerState.jumping;
	ySpeed = -jumpSpeed;
}

// update X

if (xSpeed > 0 && place_meeting(x + xSpeed, y, oBuilding)) {
	block = instance_place(x + xSpeed, y, oBuilding)
	while (place_meeting(x + xSpeed, y, oBuilding)) {
		x -= block.x > x ? 1: -1;
	}
	xSpeed = 0;

} 

if (xSpeed < 0 && place_meeting(x + xSpeed, y, oBuilding)){	
	block = instance_place(x + xSpeed, y, oBuilding)
	while (place_meeting(x + xSpeed, y, oBuilding)) {
		x -= block.x > x ? 1: -1;
	} 
	xSpeed = 0;
} 

// -- dead --
if (y > 800 && !isDead) {
	isDead = true;	
	audio_play_sound(snDead, 10, false);
}

// update Y

if (!place_meeting(x, y + ySpeed, oBuilding)) {	
	ySpeed += accelerationY;
} else {
	
	var building = instance_place(x, y + ySpeed, oBuilding);
	y = building.bbox_top - 94;
	
	
	if (state == playerState.jumping) {
		state = playerState.idle;	
		audio_play_sound(snLand, 10, false);
	}
	
	ySpeed = 0;

}

x += xSpeed;
y += ySpeed;

// --- graphics ---

if (xSpeed != 0) {
	image_xscale = (xSpeed >= 0) ? 1 : -1;
}

if (xSpeed == 0) {
	image_index = 1;
} else {
	image_speed = xSpeed / maxSpeedX;
}

if (state == playerState.jumping) {
	image_index = 0 
}

// --- sound ---

if (xSpeed > 0 && state != playerState.jumping) {

	steps++	
	
	if (steps == 18) {
		audio_play_sound(snFoot1, 10, false)
		steps = 0;
	} 
	
	
} else {
	steps = 0;
}

