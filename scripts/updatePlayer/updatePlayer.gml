var leftKeyDown = keyboard_check(playerLeftKey);
var rightKeyDown = keyboard_check(playerRightKey);
var jumpKeyDown = keyboard_check_pressed(playerJumpKey)

if (isDead) {
	return	
}

xSpeed = maxSpeedX;

if (!isGrounded) {
	ySpeed += gForce;
}

if (jumpKeyDown && state != playerState.jumping && isGrounded) {	
	audio_play_sound(snJump, 10, false);
	state = playerState.jumping;
	ySpeed = -jumpSpeed;
}


// collision testing X

if (place_meeting(xFloat + xSpeed, y, oBuilding)) {	
	while (!place_meeting(x + 1, y, oBuilding)) {
		x++;
	}
	xFloat = x;
	xSpeed = 0;

} 

// collision testing Y

if (!place_meeting(x, y + 1, oBuilding)) {
	isGrounded = false;	
}


if (place_meeting(x, yFloat + ySpeed, oBuilding)) {	
	
	while (!place_meeting(x, y + 1, oBuilding)) {
		y++;
	} 
	
	yFloat = y;
	ySpeed = 0;
	
	isGrounded = true;
	

	if (state == playerState.jumping) {
		state = playerState.idle;	
		audio_play_sound(snLand, 10, false);
	}
	
}

xFloat += xSpeed;
yFloat += ySpeed;

x = round(xFloat);
y = round(yFloat);

// -- dead --
if (y > 800 && !isDead) {
	isDead = true;	
	audio_play_sound(snDead, 10, false);
	gameController = instance_find(oGameController, 0)
	gameController.alarm[0] = 90.0;
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
