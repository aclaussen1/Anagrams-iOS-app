//
//  TileView.h
//  Anagrams
//
//  Created by Alexander Claussen on 10/2/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TileView;

//protocol handles finished drag and drop operation
@protocol TileDragDelegateProtocol <NSObject>

-(void)tileView:(TileView*)tileView didDragToPoint:(CGPoint)pt;

@end

@interface TileView : UIImageView
//store the delegate
@property (weak, nonatomic) id<TileDragDelegateProtocol> dragDelegate;
@property (strong, nonatomic, readonly) NSString* letter;
@property (assign, nonatomic) BOOL isMatched;

-(instancetype)initWithLetter:(NSString*)letter andSideLength: (float)sideLength;
-(void)randomize;


@end
