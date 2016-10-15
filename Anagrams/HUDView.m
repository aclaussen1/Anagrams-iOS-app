//
//  HUDView.m
//  Anagrams
//
//  Created by Alexander Claussen on 10/12/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "HUDView.h"
#import "config.h"

@implementation HUDView

+(instancetype)viewWithRect:(CGRect)r {
    //create the HUD layer
    HUDView* hud = [[HUDView alloc] initWithFrame:r];
    
    //the stopwatch
    hud.stopwatch = [[StopwatchView alloc] initWithFrame: CGRectMake(kScreenHeight/2 - 150, 0, 300, 100)];
    hud.stopwatch.seconds = 0;
    [hud addSubview:hud.stopwatch];
    
    return hud;
    
}

@end
