playerJumpKey = global.jumpKey
playerRightKey = global.rightKey
playerLeftKey = global.leftKey

isDead = false;

jumpSpeed = 24;
maxSpeedX = 6;
gForce = 1.27;

enum playerState {
	idle,
	jumping
}



state = playerState.idle;

xSpeed = 0;
ySpeed = 0;

xFloat = x;
yFloat = y;

steps = 0;
isGrounded = false;

