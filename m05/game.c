#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "clouds.h"
#include "collisionmap.h"
#include "spritesheet.h"
#include "gameSong.h"
#include "sparkle.h"
#include "dead.h"
#include "wilt.h"
#include "TitleSong.h"
#include "sound.h"



//Game Structures
PLAYER player;
LIFE lives[LIFECOUNT];
DROPS drops[DROPCOUNT];
FLOWERS flowers[FLOWERCOUNT];
WATERTRACKER tracker[WATERTRACKERCOUNT];

// ShadowOAM Structure
OBJ_ATTR shadowOAM[128];

// Screen Variables
int frameCounter;
int vOff;
int hOff;
int hOffClouds;
int playerDisplacement;


// Initialize the game
void initGame() {

	// Place screen on map
    vOff = 96;
    hOff = 0;
    hOffClouds = 0;

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
   	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

	hideSprites();

	initWaterTracker();
	initPlayer();
    initLives();
    initDrops();
    initFlowers();
    flowers[0].active = 1;
    buttons = BUTTONS;
    frameCounter = 0;
}

void updateGame() {
	frameCounter++;
	hOffClouds += 1;
	updatePlayer();
	updateLives();
	for (int i = 0; i < DROPCOUNT; i++) {
		updateDrops(&drops[i]);
	}
	for (int i = 0; i < FLOWERCOUNT; i++){
		if (countFlowers() == 0){
			flowers[0].active = 1;
		}
		updateFlowers(&flowers[i]);
	}
	updateWaterTracker();
	
}

void draw(){
	drawPlayer();
	drawLives();
	drawWaterTracker();
	for (int i = 0; i < DROPCOUNT; i++) {
		drawDrops(&drops[i]);
	}
	drawFlowers();
	REG_BG1HOFF = (hOffClouds/3);
	REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

/* You have three hearts but four lives technically speaking.
If you lose all three hearts, you still have a chance to make
a comeback, but if you get hit again, that's it.
*/
void initLives() {
	int h = 0;
	for (int i = 0; i < LIFECOUNT; i++){
		lives[i].row = 0;
		lives[i].col = 30 + h;
		lives[i].height = 16;
		lives[i].width = 16;
		lives[i].active = 1;
		lives[i].index = 1;

		h += 20;
	}
}

// If you lose a life, a heart is no longer active
void updateLives() {
	if (livesRemaining == 2) {
		lives[2].active = 0;
	}
	if (livesRemaining == 1) {
		lives[1].active = 0;
	}
	if (livesRemaining == 0){
		lives[0].active = 0;
	}
}

// If you lose a life, you hide the heart sprite
void drawLives() {
	for(int i = 0; i < LIFECOUNT; i++){

		if(lives[i].active){
			shadowOAM[i + 2].attr0 = (ROWMASK & lives[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i + 2].attr1 = (COLMASK & lives[i].col) | ATTR1_SMALL;
			shadowOAM[i + 2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
		}
		else {
			shadowOAM[i+ 2].attr0 = ATTR0_HIDE;
		}
	}
}

void initWaterTracker(){
	for (int i = 0; i < WATERTRACKERCOUNT; i++){
		tracker[i].col = 8;
		tracker[i].id = i + 1;
		tracker[i].active = 0;
	}
}

void drawWaterTracker(){
	shadowOAM[1].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_TALL;
	shadowOAM[1].attr1 = (COLMASK & 0) | ATTR1_LARGE;
	shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 28);

}

void updateWaterTracker(){
	int fill = (player.holding / 2);

	for (int i = 0; i < WATERTRACKERCOUNT; i++){
		if (tracker[i].id <= fill){
			tracker[i].active = 1;
			tracker[i].row = 54 - i;
			shadowOAM[ i + 30].attr0 = (ROWMASK & tracker[i].row) | ATTR0_4BPP | ATTR0_WIDE;
			shadowOAM[ i + 30].attr1 = (COLMASK & tracker[i].col) | ATTR1_TINY;
			shadowOAM[ i + 30].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 3);
		} else {
			tracker[i].active = 0;
			shadowOAM[i + 30].attr0 = ATTR0_HIDE;
		}
	}
}

// This is our watering can
void initPlayer() {
	player.width = 32;
    player.height = 32;
    player.cdel = 1;
	player.row = 40 + vOff;
	player.col = SCREENWIDTH/2 - player.height/2 + hOff;
	player.dropTimer = 10;
	player.capacity = 100;
    player.holding = 100;
    player.drainRate = 1;
    player.drainTimer = 0;
    player.flipped = 0;
    player.pouring = 0;
}

// Contains player's every movement
void updatePlayer(){
	player.drainTimer++;
	if (BUTTON_HELD(BUTTON_LEFT)) {
		if ((player.col > 0)){ 
			player.col -= player.cdel;
			player.flipped = 0;

			if (hOff > 0 && (player.screenCol < (SCREENWIDTH/2))){
				hOff -= player.cdel;
				for(int i = 0; i < FLOWERCOUNT; i++){
						flowers[i].col += player.cdel;
				}
				for(int i = 0; i < DROPCOUNT; i++){
					if(drops[i].active == 1){
						drops[i].col += player.cdel;
					}
				}
			}
		}
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
		if ((player.col + player.width) < MAPWIDTH) {
			player.col += player.cdel;
			player.flipped = 1;
	
			if (hOff <(MAPWIDTH - SCREENWIDTH) && (player.screenCol >(SCREENWIDTH/2))){
				hOff += player.cdel;
				for(int i = 0; i < FLOWERCOUNT; i++){
						flowers[i].col -= player.cdel;
				}
				for(int i = 0; i < DROPCOUNT; i++){
					if(drops[i].active == 1){
						drops[i].col -= player.cdel;
					}
				}
			}	
		}
	}
	if (BUTTON_HELD(BUTTON_A) && player.dropTimer >= 10 && player.holding >= 5) {
		player.pouring = 1;
		fireDrops();
		player.dropTimer = 0;
		if (!player.cheat){
			player.holding -= 2;
		}
	}
	if (BUTTON_HELD(BUTTON_B) && player.dropTimer >= 10 && player.col > 440) {
		fireDropsFaucet();
		player.dropTimer = 0;
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)){
		if (player.cheat){
			player.cheat = 0;
		} else {
			player.cheat = 1;
		}
		player.holding = 100;
	}
	if ((player.drainTimer % 25) == 0 && player.cheat == 0){
		player.holding -= player.drainRate;
		player.drainTimer = 0;
	}
	if ((player.drainTimer % 20) == 0 && player.pouring == 1){
		player.pouring = 0;
	}
    player.screenRow = player.row - vOff;
    player.screenCol= player.col- hOff;

	player.dropTimer++;
}

void drawPlayer() {
	if (!player.cheat){
		shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
	    shadowOAM[0].attr2 = ATTR2_TILEID(2 + (player.pouring * 4), 0 + (player.flipped * 4)) | ATTR2_PALROW(0);
    }else{
    	shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    	shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    	shadowOAM[0].attr2 = ATTR2_TILEID(2 + (player.pouring * 4), 0 + (player.flipped * 4) + (8 * player.cheat)) | ATTR2_PALROW(1);
    }


}

void initDrops(){
	for (int i = 0; i < DROPCOUNT; i++) {
        drops[i].row = -drops[i].height;
        drops[i].col = 0;
        drops[i].height = 8;
        drops[i].width = 8;
        drops[i].rdel = 2;
        drops[i].cdel = 0;
        drops[i].active = 0;
        drops[i].index = i + 81;
    }
}

void updateDrops(DROPS* b) {
	if (b->active) {
		if (b->row + b->height-1 >= 0
            && b->row + b->rdel > 0
            && b->row + b->rdel < SCREENHEIGHT-1) {
			for (int i = 0; i < FLOWERCOUNT; i++){
				if (flowers[i].active && collision(b->row, b->col, b-> height, b->width, flowers[i].row, flowers[i].col, flowers[i].width)){
					flowers[i].oldHolding = flowers[i].holding;
					flowers[i].holding += 15;
					b->active = 0;
				}
			}
			if (caught(b->row, b->col, b-> height, b->width, player.screenRow, player.screenCol, player.width)){
				if (player.holding <= player.capacity - 10){
					player.holding += 10;
				} else if ((player.holding < player.capacity) &&(player.holding > player.capacity - 10)){
					player.holding = player.capacity;
				}
				b->active = 0;
			}
			b->row += b->rdel;
            b->col += b->cdel;
		} else {
			b->active = 0;
		}
	}
}

// We shadowOAM player's drops here
void drawDrops(DROPS* b) {
	if (b->active) {
		shadowOAM[b->index].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;	  	  	
		shadowOAM[b->index].attr1 = (b->col) | ATTR1_TINY;
	   	shadowOAM[b->index].attr2 =  ATTR2_TILEID(0, 2) | ATTR2_PALROW(0);
	} else if (!b->erased) {
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

// Find the first inactive bullet, initialize it, and set it active
void fireDrops() {
	for (int i = 0; i < DROPCOUNT; i++) {
		if (!drops[i].active) {
			drops[i].row = player.screenRow + 6;
			if (player.flipped){
				drops[i].col = player.screenCol + player.width;
			} else {
				drops[i].col = player.screenCol;
			}
			drops[i].active = 1;
			drops[i].erased = 0;
			break;
		}
	}
}

void fireDropsFaucet() {
	for (int i = 0; i < DROPCOUNT; i++) {
		if (!drops[i].active) {
			drops[i].row = 22;
			drops[i].col = 190;
			drops[i].active = 1;
			drops[i].erased = 0;
			break;
		}
	}
}

void initFlowers(){
	int h = 0;
	for (int i = 0; i < FLOWERCOUNT; i++){
		flowers[i].col = 40 + h;
	    flowers[i].aniState = 0;
	    flowers[i].stage = 1;
		flowers[i].width = 8;
	    flowers[i].height = 8;
	    flowers[i].row = 144 - flowers[i].height;
	    flowers[i].decayRate = 1;
	    flowers[i].capacity = 100;
	    flowers[i].holding= 35;
	    flowers[i].oldHolding = 34;
	    flowers[i].species = 0;
	    flowers[i].wilt = 0;
	    flowers[i].active = 0;
	    flowers[i].done = 0;
	    flowers[i].decayTimer = 0;
	    flowers[i].id = i;
	    h += 35;
    }
}

void drawFlowers(){
	for(int i = 0; i < FLOWERCOUNT; i++){
		if(flowers[i].active == 1){
			if (flowers[i].stage == 1){
				shadowOAM[i + 5].attr0 = (ROWMASK & flowers[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[i + 5].attr1 = (COLMASK & flowers[i].col) | ATTR1_TINY;
				shadowOAM[i + 5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10 + (flowers[i].wilt * 11), 0 + (flowers[i].aniState * 4));
			} else if (flowers[i].stage == 2){
				shadowOAM[i + 5].attr0 = (ROWMASK & flowers[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[i + 5].attr1 = (COLMASK & flowers[i].col) | ATTR1_SMALL;
				shadowOAM[i + 5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(11 + (flowers[i].wilt * 11), 0 + (flowers[i].aniState * 4));
			}
			else if (flowers[i].stage == 3){
				shadowOAM[i + 5].attr0 = (ROWMASK & flowers[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[i + 5].attr1 = (COLMASK & flowers[i].col) | ATTR1_MEDIUM;
				shadowOAM[i + 5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13 + (flowers[i].wilt * 11), 0 + (flowers[i].aniState * 4));
			}
			else if (flowers[i].stage == 4){
				shadowOAM[i + 5].attr0 = (ROWMASK & flowers[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
				shadowOAM[i + 5].attr1 = (COLMASK & flowers[i].col) | ATTR1_MEDIUM;
				shadowOAM[i + 5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17 + (flowers[i].wilt * 11), 0 + (flowers[i].aniState * 4));
			}
		}
		else {
			shadowOAM[i+5].attr0 = ATTR0_HIDE;
		}
	}
}

void updateFlowers(FLOWERS* f){
	//if alive
	f->decayTimer++;
	if (f->active == 1){
		if (countFlowers() == 1){
		f->done = 0;
		}
		f->oldHolding = f->holding;
		if ((f->decayTimer % 20) == 0){
			f->holding -= f->decayRate ;
			f->decayTimer = 0;
			f-> aniState = (f->aniState + 1) % 3;
		}

		//if it has less than 20 water
		if (f->holding <= 20) {
			// ...and it had more water before -> wilts flower
			if (f->oldHolding > 20) {
				f->wilt = 1;
				f->done = 0;
				playSoundB(wilt_c2, WILTLEN, WILTFREQ, 0);
			}
			// ... and it it just lost its last water -> kills flower, takes away life
			if (f->oldHolding <= 0){
				clearFlowerHistory(f);
				livesRemaining--;
				flowersAlive--;
				playSoundB(dead_c2, DEADLEN, DEADFREQ, 0);
			}
		} else { //if holding is greater than 20, 
			//and it was less than 20 before -> unwilt it
			f->wilt = 0;
			//and the flower has the most water it can..
			if (f->holding >= f->capacity - f->decayRate){
				//and it wasn't fully grown -> level it up
				if (f->stage < 4){
					f->stage += 1;
					if (f->stage == 2){
						f->width = 16;
						f->height = 16;
						f->col -= 4;
						f->row -= 8;
					}
					if (f->stage == 3){
						f->width = 32;
						f->height = 32;
						f->col -= 8;
						f->row -= 16;
					}
					f->holding = 30;
				}
				//and it was fully grown -> give player new flower
				if (f->stage == 4 && (!f->done)){
					f->done = 1;
					playSoundB(sparkle_c2, SPARKLELEN, SPARKLEFREQ, 0);
					growNewFlower();

				}
			}
		}
	}
}

// Find the first inactive flower and active it
void growNewFlower() {
	for (int i = 0; i < FLOWERCOUNT; i++) {
		if (!flowers[i].active) {
			flowers[i].active = 1;
			flowersAlive++;
			break;
		}
	}
}

int countFlowers(){
	int aliveCount = 0;
	for (int i = 0; i < FLOWERCOUNT; i++){
		if (flowers[i].active){
			aliveCount++;
		}
	}
	return aliveCount;
}


//checks to see if all flowers are fully grown 
int allGrown(){
	int fullyGrown = 0;
    for (int i = 0; i < FLOWERCOUNT; i++){
        if (flowers[i].done == 1){
            fullyGrown++;
        }
    }
    if (fullyGrown == 9){
        return 1;
    } else {
    	return 0;
    }
}

void deadFlower(){
	for (int i = 0; i < FLOWERCOUNT; i++) {
		if (flowers[i].active && flowers[i].done) {
			flowers[i].done = 0;
			break;
		}
	}
}

void clearFlowerHistory(FLOWERS* f){
	f->col = 40 + (35 * f->id) - hOff;
    f->aniState = 0;
    f->stage = 1;
	f->width = 8;
    f->height = 8;
    f->row = 144 - f->height;
    f->decayRate = 1;
    f->capacity = 100;
    f->holding= 35;
    f->oldHolding = 34;
    f->species = 0;
    f->wilt = 0;
    f->active = 0;
    f->done = 0;
    f->decayTimer = 0;
}

//Checks to see if the flower was watered
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int widthB) {
	if (widthB <= 16){
		return (rowA + heightA > rowB && colA >= colB-5 && colA + (widthA / 2) <= colB + widthB + 5);
	}
	return (rowA + heightA > rowB && colA >= colB + widthB/4 && colA + (widthA / 2) <= colB + widthB - widthB/4);
}

//Testing to see if the can (B) caught the water(A) from faucet
int caught(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int widthB){
	return  (rowA + heightA > rowB + 5 && colA >= colB + 8 && colA +(widthA/2) <= colB + widthB - 8 && rowA < rowB);
}




