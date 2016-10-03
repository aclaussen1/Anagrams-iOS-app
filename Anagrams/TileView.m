//
//  TileView.m
//  Anagrams
//
//  Created by Alexander Claussen on 10/2/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "TileView.h"

@implementation TileView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//override initWitfFrame:. Since custom initialization method, don't want to call initWithFrame. Instead add NSAssert that will fail every time. This means less chance that a tile will be created that isn't properly initialized.
- (id)initWithFrame:(CGRect)frame {
    NSAssert(NO, @"Use initWithLetter: andSideLength instead");
    return nil;
}

//initWithLetter:andSideLength: is the custom method to initialize tiles. It loads tile.png image and makes an instance of TileView by calling initWithImage: on parent class
-(instancetype)initWithLetter:(NSString *)letter andSideLength:(float)sideLength
{
    //tile background
    UIImage* img = [UIImage imageNamed:@"tile.png"];
    
    //create new object
    self = [super initWithImage:img];
    
    
    if (self != nil) {
        //resize tile
        float scale = sideLength/img.size.width;
        self.frame = CGRectMake(0, 0, img.size.width*scale, img.size.height*scale);
        
        //add letters to the tiles
        UILabel* lbChar = [[UILabel alloc] initWithFrame:self.bounds];
        lbChar.textAlignment = NSTextAlignmentCenter;
        lbChar.textColor = [UIColor whiteColor];
        lbChar.backgroundColor = [UIColor clearColor];
        lbChar.text = [letter uppercaseString];
        lbChar.font = [UIFont fontWithName:@"Verdana-Bold" size:78.0*scale];
        [self addSubview:lbChar];
    }

    //begin in unmatched state
    self.isMatched = NO;
    
    //save the letter
    _letter = letter;
    
    return self;
}

@end
