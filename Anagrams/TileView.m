//
//  TileView.m
//  Anagrams
//
//  Created by Alexander Claussen on 10/2/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "TileView.h"

@implementation TileView
{
    int _xOffset, _yOffset;
}

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
    
    //enable user interaction
    self.userInteractionEnabled = YES;
    
    return self;
}

-(void)randomize
{
    //1 set a random rotation of the tile between -.2 and .3 radians
    #define randomf(minX,maxX) ((float)(arc4random() % (maxX - minX + 1)) + (float)minX)
    float rotation = randomf(0,50) / (float)100 -.2;
    self.transform = CGAffineTransformMakeRotation(rotation);
    
    //2 move randomly upwards
    int yOffset = (arc4random() % 10) -10;
    self.center = CGPointMake(self.center.x, self.center.y + yOffset);
}

#pragma mark - dragging the tile

//(1) When touch is detected, fetch its location in the tile's superview. Calculate and store the distance from the touch to the tile's center
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self.superview];
    _xOffset = pt.x - self.center.x;
    _yOffset = pt.y - self.center.y;
}

//(2)when player moves finger, move the tile to that location, adjusting the position by the offsets stored in _xOffset and _yOffset. Keeps tile from centering itself as soon as the player moves their finger
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint pt = [[touches anyObject]locationInView:self.superview];//how does this work
    self.center = CGPointMake(pt.x + _xOffset, pt.y + _yOffset);
}

//(3) When a player lifts a finger, you make one last call to touchesMoved:withEvent: to make sure the position is set to the final touch's location. Avoid repeating code to make maintenance easier
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
    
    //if statement checks if dragDelegate property is set. if so, calls delegates tileView:didDragPoint: method, passing it self and self.center
    if (self.dragDelegate) {
        [self.dragDelegate tileView:self didDragToPoint:self.center];
    }
}

@end
