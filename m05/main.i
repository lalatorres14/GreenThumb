# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"





# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 70 "myLib.h"
extern unsigned short *videoBuffer;
# 91 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 163 "myLib.h"
void hideSprites();
# 188 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 199 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 239 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 330 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int size;
    u16 color;
    int AI_STATE;
} MOVOBJ;
# 7 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[4032];


extern const unsigned short bgMap[2048];


extern const unsigned short bgPal[256];
# 8 "main.c" 2
# 1 "clouds.h" 1
# 22 "clouds.h"
extern const unsigned short cloudsTiles[3104];


extern const unsigned short cloudsMap[2048];


extern const unsigned short cloudsPal[256];
# 9 "main.c" 2
# 1 "intro.h" 1
# 22 "intro.h"
extern const unsigned short introTiles[4384];


extern const unsigned short introMap[1024];


extern const unsigned short introPal[256];
# 10 "main.c" 2
# 1 "instruct.h" 1
# 22 "instruct.h"
extern const unsigned short instructTiles[5616];


extern const unsigned short instructMap[1024];


extern const unsigned short instructPal[256];
# 11 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[2400];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[16];
# 12 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[2688];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 13 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[3264];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[16];
# 14 "main.c" 2
# 1 "text.h" 1

void drawChar3(int row, int col, char ch, unsigned short color);
void drawString3(int row, int col, char *str, unsigned short color);


void drawChar4(int row, int col, char ch, unsigned char colorIndex);
void drawString4(int row, int col, char *str, unsigned char colorIndex);
# 15 "main.c" 2
# 1 "game.h" 1

extern int vOff;
extern int hOff;
extern int hOffClouds;
extern int livesRemaining;
extern int flowersAlive;
extern OBJ_ATTR shadowOAM[128];


typedef struct {
 int row;
 int col;
    int cdel;
 int width;
    int height;
    int dropTimer;
    int capacity;
    int holding;
    int drainRate;
    int screenRow;
    int screenCol;
    int drainTimer;
    int flipped;
    int pouring;
    int cheat;
} PLAYER;


typedef struct {
 int row;
 int col;
 int width;
    int height;
    int index;
    int active;
} LIFE;


typedef struct {
    int col;
    int row;
    int id;
    int active;
} WATERTRACKER;



typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int rdel;
 int cdel;
 int height;
 int width;
 int active;
 int erased;
 int index;
} DROPS;


typedef struct {
 int row;
 int col;
    int aniState;
 int width;
    int height;
    int decayRate;
    int capacity;
    int holding;
    int oldHolding;
    int stage;
    int species;
    int active;
    int wilt;
    int done;
    int decayTimer;
    int id;
} FLOWERS;
# 93 "game.h"
enum {BLACKID=(256-6), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[6];


void initGame();
void updateGame();
void draw();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initLives();
void updateLives();
void drawLives();

void initWaterTracker();
void drawWaterTracker();
void updateWaterTracker();

void initDrops();
void updateDrops(DROPS *);
void drawDrops(DROPS *);
void fireDrops();
void fireDropsFaucet();

void initFlowers();
void updateFlowers(FLOWERS *);
void clearFlowerHistory(FLOWERS *);
void drawFlowers();
void growNewFlower();
void deadFlower();
int allGrown();
int countFlowers();
void restartFlowers();

int collision(int rowA, int colA, int heightA, int widthA,int rowB, int colB, int widthB);
int caught(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int widthB);
# 16 "main.c" 2
# 1 "sparkle.h" 1
# 20 "sparkle.h"
extern const unsigned char sparkle_c1[24801];
extern const unsigned char sparkle_c2[24801];
# 17 "main.c" 2
# 1 "dead.h" 1
# 20 "dead.h"
extern const unsigned char dead_c1[28307];
extern const unsigned char dead_c2[28307];
# 18 "main.c" 2
# 1 "wilt.h" 1
# 20 "wilt.h"
extern const unsigned char wilt_c1[17770];
extern const unsigned char wilt_c2[17770];
# 19 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 20 "main.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 21 "main.c" 2
# 1 "gameSong.h" 1
# 20 "gameSong.h"
extern const unsigned char gameSong_c1[1918944];
extern const unsigned char gameSong_c2[1918944];
# 22 "main.c" 2
# 1 "TitleSong.h" 1
# 20 "TitleSong.h"
extern const unsigned char TitleSong_c1[605464];
extern const unsigned char TitleSong_c2[605464];
# 23 "main.c" 2




void initialize();


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


enum {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;


unsigned short buttons;
unsigned short oldButtons;


int seed;

int livesRemaining;
int flowersAlive;

SOUND soundA;
SOUND soundB;
const unsigned char* spaceSound;
int* spaceSoundLen;
int spaceSoundToPlay = 0;




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
  buttons = (*(volatile unsigned short *)0x04000130);

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


void initialize() {

 livesRemaining = 3;
    flowersAlive = 1;



 goToStart();
}


void goToStart() {

    waitForVBlank();
 DMANow(3, introPal, ((unsigned short *)0x5000000), 512 / 2);
 DMANow(3, introTiles, &((charblock *)0x6000000)[0], 8768/ 2);
 DMANow(3, introMap, &((screenblock *)0x6000000)[31], 2048 / 2);



    (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((31)<<8) | ((0)<<2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    playSoundA(TitleSong_c2, 605464, 11025, 1);

    state = START;
}


void start() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {;
        goToInstructions();
    }
}

void goToInstructions() {
    DMANow(3, instructPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, instructTiles, &((charblock *)0x6000000)[0], 11232/ 2);
    DMANow(3, instructMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = INSTRUCTIONS;
}

void instructions() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {;
        pauseSound();
        goToGame();
        initGame();
    }
}


void goToGame() {
    playSoundA(gameSong_c2 , 1918944, 11025, 1);
    (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<9) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (1<<14) | ((28)<<8) | ((0)<<2);
    (*(volatile unsigned short*)0x400000A) = (0<<7) | (1<<14) | ((26)<<8) | ((2)<<2);

    DMANow(3, cloudsPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, cloudsTiles, &((charblock *)0x6000000)[2], 6208/ 2);
    DMANow(3, cloudsMap, &((screenblock *)0x6000000)[26], 4096 / 2);
 DMANow(3, bgTiles, &((charblock *)0x6000000)[0], 8064/ 2);
 DMANow(3, bgMap, &((screenblock *)0x6000000)[28], 4096 / 2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 96;
    (*(volatile unsigned short *)0x04000014) = hOffClouds;
    (*(volatile unsigned short *)0x04000016) = 96;
    state = GAME;
}


void game() {

    updateGame();
    draw();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))){
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



void goToPause() {
    (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((31)<<8) | ((0)<<2);
 (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
    DMANow(3, pausePal, ((unsigned short *)0x5000000), 32 / 2);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 4800/ 2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[31], 2048 / 2);


    state = PAUSE;
}


void pause() {

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))){
        unpauseSound();
        goToGame();
    }else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))){
        goToStart();
    }
}


void goToWin() {
    (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((31)<<8) | ((0)<<2);
 (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
 hideSprites();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
 DMANow(3, winPal, ((unsigned short *)0x5000000), 32 / 2);
 DMANow(3, winTiles, &((charblock *)0x6000000)[0], 6528/ 2);
 DMANow(3, winMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = WIN;
}


void win() {


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))){
        initialize();
    }
}


void goToLose() {
 (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((31)<<8) | ((0)<<2);
    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;
 waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4*128));
 DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
 DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 5376/ 2);
 DMANow(3, loseMap, &((screenblock *)0x6000000)[31], 2048 / 2);
    state = LOSE;
}


void lose() {


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
     initialize();
}
