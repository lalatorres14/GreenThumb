
//{{BLOCK(bg)

//======================================================================
//
//	bg, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 252 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 8064 + 4096 = 12672
//
//	Time-stamp: 2019-04-25, 17:57:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define bgTilesLen 8064
extern const unsigned short bgTiles[4032];

#define bgMapLen 4096
extern const unsigned short bgMap[2048];

#define bgPalLen 512
extern const unsigned short bgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(bg)
