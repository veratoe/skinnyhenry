global.jumpKey = vk_space;
global.rightKey = vk_right;
global.leftKey = vk_left;

instance_create_layer(0, 0, "instance_layer", oCamera)
audio_play_sound(snBackgroundMusic, 10, /* loop */ true);

// variabelen die de generatie van gebouwen beinvloeden


buildingWidth = 415 // moet voor nu nog even precies overeenkomen met collision mask van sprite van gebouw, later dynamisch
spaceBetweenBuildings = 150;

buildingY = 400;
buildingMaxY = 600;
buildingMinY = 300;

buildingYDifference = 20

// X coordinaat van laatst gegenereerde gebouw
nextBuilding = 256 // posities worden vanaf midden van sprite gemeten, dus beginnen bij 1/2 sprite