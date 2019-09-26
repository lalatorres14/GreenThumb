/* This game has more gameplay code, but unfortunently the stages of the flowers are still causing some issues.
Once it has been debugged the rest should happen quickly. Still trying to figure out how to display the water in the watering can, but I talked with
Bianca and may have a better gameplan for it since my first implementation wasn't going to work.
My sprites, drops, collisions, and lives are implemented and operational. */

#include "myLib.h"
#include "bg.h"
#include "clouds.h"
#include "intro.h"
#include "instruct.h"
#include "pause.h"
#include "lose.h"
#include "win.h"
#include "text.h"
#include "game.h"
#include "sparkle.h"
#include "dead.h"
#include "wilt.h"
#include "spritesheet.h"
#include "sound.h"
#include "gameSong.h"
#include "TitleSong.h"



// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int livesRemaining;
int flowersAlive;

SOUND soundA;
SOUND soundB;
const unsigned char* spaceSound;
int* spaceSoundLen;
int spaceSoundToPlay = 0;



// Text Buffer
char buffer[41];

unsigned short buttons;
unsigned short oldButtons;

int hOff;
int vOff;

int main() {

	initialize();
    setupSounds();
    setupInterrupts();

	while(1) {

		
		oldButtons = buttons;
		buttons = BUTTONS;
		// State Machine
        switch(state) {

            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
	}
}

// Initializes the game on launch
void initialize() {
	//initializing lives
	livesRemaining = 3;
    flowersAlive = 1;

    
	
	goToStart();
}

// Sets up the start state
void goToStart() {
	//REG_BG0VOFF = 0;
    waitForVBlank();
	DMANow(3, introPal, PALETTE, introPalLen / 2);
	DMANow(3, introTiles, &CHARBLOCK[0], introTilesLen/ 2);
	DMANow(3, introMap, &SCREENBLOCK[31], introMapLen / 2);



    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(31) | BG_CHARBLOCK(0);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    playSoundA(TitleSong_c2, TITLESONGLEN, TITLESONGFREQ, 1);

    state = START;
}

// Runs every frame of the start state
void start() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {;
        goToInstructions();
    }
}

void goToInstructions() {
    DMANow(3, instructPal, PALETTE, instructPalLen / 2);
    DMANow(3, instructTiles, &CHARBLOCK[0], instructTilesLen/ 2);
    DMANow(3, instructMap, &SCREENBLOCK[31], instructMapLen / 2); 
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {;
        pauseSound();
        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {
    playSoundA(gameSong_c2 , GAMESONGLEN, GAMESONGFREQ, 1);
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_WIDE | BG_SCREENBLOCK(28) | BG_CHARBLOCK(0);
    REG_BG1CNT = BG_4BPP | BG_SIZE_WIDE | BG_SCREENBLOCK(26) | BG_CHARBLOCK(2);

    DMANow(3, cloudsPal, PALETTE, cloudsPalLen / 2);
    DMANow(3, cloudsTiles, &CHARBLOCK[2], cloudsTilesLen/ 2);
    DMANow(3, cloudsMap, &SCREENBLOCK[26], cloudsMapLen / 2);
	DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen/ 2);
	DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen / 2);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 96;
    REG_BG1HOFF = hOffClouds;
    REG_BG1VOFF = 96;
    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    draw();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, (4*128));

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
        pauseSound();
        goToPause();
    }if (flowersAlive == 9){
        if (allGrown() == 1){
            goToWin();
        }
    } 
    if (livesRemaining < 0 || countFlowers() == 0) {
        goToLose();
    }

}


// Sets up the pause state
void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(31) | BG_CHARBLOCK(0);
	REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/ 2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen / 2);
    //draw();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
        unpauseSound();
        goToGame();
    }else if (BUTTON_PRESSED(BUTTON_SELECT)){
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(31) | BG_CHARBLOCK(0);
	REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
	hideSprites();
	DMANow(3, shadowOAM, OAM, (4*128));
	DMANow(3, winPal, PALETTE, winPalLen / 2);
	DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/ 2);
	DMANow(3, winMap, &SCREENBLOCK[31], winMapLen / 2);
    state = WIN;
}

// Runs every frame of the win state
void win() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
        initialize();
    }
}

// Sets up the lose state
void goToLose() {
	REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_SCREENBLOCK(31) | BG_CHARBLOCK(0);
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;
	waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
	DMANow(3, losePal, PALETTE, losePalLen / 2);
	DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/ 2);
	DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen / 2);
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
    	initialize();
}