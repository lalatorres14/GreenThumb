
//{{BLOCK(intro)

//======================================================================
//
//	intro, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 274 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8768 + 2048 = 11328
//
//	Time-stamp: 2019-04-26, 12:21:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INTRO_H
#define GRIT_INTRO_H

#define introTilesLen 8768
extern const unsigned short introTiles[4384];

#define introMapLen 2048
extern const unsigned short introMap[1024];

#define introPalLen 512
extern const unsigned short introPal[256];

#endif // GRIT_INTRO_H

//}}BLOCK(intro)
