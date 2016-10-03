//
//  GameController.m
//  Anagrams
//
//  Created by Alexander Claussen on 10/2/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "GameController.h"
#import "config.h"
#import "TileView.h"

@implementation GameController
{
    //tile lists
    //array to hold TileViews that will display the tiles at the bottom of the screen
    NSMutableArray* _tiles;
    //an array to hold the target views that will display the spaces at the top of thes screen where player drags the tiles
    NSMutableArray* _targets;
}

//fetches a random anagram, deals the letter tiles and creates the targets
-(void)dealRandomAnagram
{
    //check to see if this is called after level property is set and that level contains anagrams
    NSAssert(self.level.anagrams, @"no level loaded");
    
    //generate a random index into the anagram list, then grab the anagram at this index
    int randomIndex = arc4random()%[self.level.anagrams count];
    NSArray* anaPair = self.level.anagrams[randomIndex];
    
    //store two phrases into anagram1 and anagram2
    NSString* anagram1 = anaPair[0];
    NSString* anagram2 = anaPair[1];
    
    //store number of characters in each phrase into ana1len and ana2len
    int ana1len = [anagram1 length];
    int ana2len = [anagram2 length];
    
    NSLog(@"phrase[%i]: %@", ana1len, anagram1);
    NSLog(@"phrase[%i]: %@", ana2len, anagram2);
    
    //calculate the tile size by taking 90% of the width of the screen and dividing by the number of characters, using the phrase that has more characters
    float tileSide = ceilf( kScreenWidth*0.9 / (float)MAX(ana1len,ana2len) ) - kTileMargin;
    
    //find the initial x position of the first tile, by taking screen width and subtracting the calculated width of the word tiles
    //(1) get the left margin for the first tile
    float xOffset = (kScreenWidth - MAX(ana1len,ana2len) * (tileSide + kTileMargin))/2;
    //(2)adjust for tile center
    xOffset += tileSide/2;
    
    //display the tiles
    //(1) initialize tile list mutable array and ensure it is large enough to hold all the leters in the initial phrase. This method will be called multiple times during a run of the app so it is important a new, clear array is generated
    _tiles = [NSMutableArray arrayWithCapacity:ana1len];
    //(2) create tiles. Create a string for each character. This is stored as a letter.
    for (int i=0;i<ana1len;i++) {
        NSString* letter = [anagram1 substringWithRange:NSMakeRange(i, 1)];
        
        //(3) Check if each letter is not a space. If not, create a new tile and position it. The tiles are positioned at 3/4th's the screen height
        if (![letter isEqualToString:@" "]) {
            TileView* tile = [[TileView alloc] initWithLetter:letter andSideLength:tileSide];
            tile.center = CGPointMake(xOffset + i*(tileSide + kTileMargin), kScreenHeight/4*3);
            
            //(4)add the tile to the gameView and to the _tiles array
            [self.gameView addSubview:tile];
            [_tiles addObject: tile];
            
        }
        
        
    }
}

@end
