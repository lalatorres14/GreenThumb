
//{{BLOCK(pause)

//======================================================================
//
//	pause, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 150 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 4800 + 2048 = 6880
//
//	Time-stamp: 2019-04-18, 22:51:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSE_H
#define GRIT_PAUSE_H

#define pauseTilesLen 4800
extern const unsigned short pauseTiles[2400];

#define pauseMapLen 2048
extern const unsigned short pauseMap[1024];

#define pausePalLen 32
extern const unsigned short pausePal[16];

#endif // GRIT_PAUSE_H

//}}BLOCK(pause)
