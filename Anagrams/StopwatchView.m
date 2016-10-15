//
//  StopwatchView.m
//  Anagrams
//
//  Created by Alexander Claussen on 10/12/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "StopwatchView.h"
#import "config.h"

@implementation StopwatchView

//helper method that implements time formatting
//to an int parameter (eg seconds left)
-(void)setSeconds:(int)seconds
{
    self.text = [NSString stringWithFormat:@" %.2f : %02i", round(seconds /60), seconds % 60];
}

-(id)initWithFrame:(CGRect)frame {
    self.backgroundColor = [UIColor clearColor];
    self.font = kFontHUDBig;
    self = [super initWithFrame:frame];
    return self;
}

@end
