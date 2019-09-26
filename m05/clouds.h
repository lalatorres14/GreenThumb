
//{{BLOCK(clouds)

//======================================================================
//
//	clouds, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 194 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 6208 + 4096 = 10816
//
//	Time-stamp: 2019-04-25, 18:02:37
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CLOUDS_H
#define GRIT_CLOUDS_H

#define cloudsTilesLen 6208
extern const unsigned short cloudsTiles[3104];

#define cloudsMapLen 4096
extern const unsigned short cloudsMap[2048];

#define cloudsPalLen 512
extern const unsigned short cloudsPal[256];

#endif // GRIT_CLOUDS_H

//}}BLOCK(clouds)
