var leftKeyDown = keyboard_check(playerLeftKey);
var rightKeyDown = keyboard_check(playerRightKey);
var jumpKeyDown = keyboard_check_pressed(playerJumpKey)

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

x += xSpeed;



// update Y

if (!place_meeting(x, y + ySpeed, oBuilding)) {
	y += ySpeed;
	ySpeed += accelerationY;
} else {
	while (!place_meeting(x, y + sign(ySpeed), oBuilding)) {
		y += sign(ySpeed) * 0.1;	
	}
	
	state = playerState.idle;
	ySpeed = 0;
}

// --- graphics ---

if (xSpeed != 0) {
	image_xscale = (xSpeed >= 0) ? 1 : -1;
}


if (xSpeed == 0) {
	image_index = 1;
} else {
	image_speed = xSpeed / maxSpeedX;
}