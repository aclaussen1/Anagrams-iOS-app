//
//  GameController.h
//  Anagrams
//
//  Created by Alexander Claussen on 10/2/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "TileView.h"

@interface GameController : NSObject <TileDragDelegateProtocol>


//the view to add game elements to
@property (weak, nonatomic) UIView* gameView;

//the current level
@property (strong, nonatomic) Level* level;

//display a new anagram on the screen
-(void)dealRandomAnagram;



@end
