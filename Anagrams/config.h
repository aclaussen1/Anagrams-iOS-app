//
//  config.h
//  Anagrams


#ifndef configed

//UI defines
#define kScreenWidth [UIScreen mainScreen].bounds.size.height
#define kScreenHeight [UIScreen mainScreen].bounds.size.width

//constant for the space between the tiles
#define kTileMargin 20

//add more definitions here


//handy math functions
#define rad2deg(x) x * 180 / M_PI
#define deg2rad(x) x * M_PI / 180
#define randomf(minX,maxX) ((float)(arc4random() % (maxX - minX + 1)) + (float)minX)

#define kFontHUD [UIFont fontWithName:@"comic andy" size:62.0]
#define kFontHUDBig [UIFont fontWithName:@"comic andy" size:120.0]

#define configed 1
#endif
