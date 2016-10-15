//
//  HUDView.h
//  Anagrams
//
//  Created by Alexander Claussen on 10/12/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopwatchView.h"

@interface HUDView : UIView
@property (strong, nonatomic) StopwatchView* stopwatch;
+(instancetype)viewWithRect:(CGRect)r;

@end
