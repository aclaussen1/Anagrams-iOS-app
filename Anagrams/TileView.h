//
//  TileView.h
//  Anagrams
//
//  Created by Alexander Claussen on 10/2/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileView : UIImageView
@property (strong, nonatomic, readonly) NSString* letter;
@property (assign, nonatomic) BOOL isMatched;

-(instancetype)initWithLetter:(NSString*)letter andSideLength: (float)sideLength;
@end
