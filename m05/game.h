// Variables
extern int vOff;
extern int hOff;
extern int hOffClouds;
extern int livesRemaining;
extern int flowersAlive;
extern OBJ_ATTR shadowOAM[128];

// Our player
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

// Lives
typedef struct {
	int row;
	int col;
	int width;
    int height;
    int index;
    int active;
} LIFE;

// Waterfill lines
typedef struct {
    int col;
    int row;
    int id;
    int active;
} WATERTRACKER;


// Drop Struct
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

// Flower
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
    int id; //if its fully grown and if it already triggered a new plant
} FLOWERS;


// Constants
#define DROPCOUNT 15
#define LIFECOUNT 3
#define FLOWERCOUNT 9
#define WATERTRACKERCOUNT 50

// Mode4 Custom Game Colors
#define NUMCOLORS 6

// This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

//Prototypes
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

