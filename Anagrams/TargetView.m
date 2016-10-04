//
//  TargetView.m
//  Anagrams
//
//  Created by Alexander Claussen on 10/3/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "TargetView.h"

@implementation TargetView

- (id)initWithFrame:(CGRect)frame {
    NSAssert(NO, @"Use initWithLetter: andSideLength instead");
    return nil;
}

//create a new target, store what letter should it match to
-(instancetype)initWithLetter:(NSString *)letter andSideLength:(float)sideLength {
    UIImage* img = [UIImage imageNamed:@"slot.png"];
    self = [super initWithImage:img];
    
    if (self != nil) {
        //initialization
        self.isMatched = NO;
        
        float scale = sideLength = sideLength/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        _letter = letter;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
