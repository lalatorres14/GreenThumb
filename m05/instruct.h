
//{{BLOCK(instruct)

//======================================================================
//
//	instruct, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 351 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11232 + 2048 = 13792
//
//	Time-stamp: 2019-04-26, 14:19:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCT_H
#define GRIT_INSTRUCT_H

#define instructTilesLen 11232
extern const unsigned short instructTiles[5616];

#define instructMapLen 2048
extern const unsigned short instructMap[1024];

#define instructPalLen 512
extern const unsigned short instructPal[256];

#endif // GRIT_INSTRUCT_H

//}}BLOCK(instruct)
