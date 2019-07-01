playerJumpKey = global.jumpKey
playerRightKey = global.rightKey
playerLeftKey = global.leftKey

jumpSpeed = 10;

maxSpeedX = 6;
maxSpeedY = 67;

enum playerState {
	idle,
	jumping
}

accelerationY = .7;
accelerationX = .8;
fric = .2;

state = playerState.idle;

xSpeed = 0;
ySpeed = 0;

imageIndex = 0;
