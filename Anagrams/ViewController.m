//
//  ViewController.m
//  Anagrams
//

#import "config.h"
#import "ViewController.h"
#import "Level.h"
#import "GameController.h"
#import "TileView.h"

@interface ViewController ()
@property (strong, nonatomic) GameController* controller;
@end

@implementation ViewController

//setup the view and instantiate the game controller
//note: This method, when uncommented, creates an error that terminates the app, reading: Terminating app due to uncaught exception 'NSGenericException', reason: 'This coder requires that replaced objects be returned from initWithCoder:' The game controller is now created in the viewDidLoad method:
/*
-(instancetype)initWithCoder:(NSCoder *)decoder{
    self = [super initWithCoder:decoder];
    if (self != nil) {
        //create game controller
        self.controller = [[GameController alloc]init];
    }
}
*/
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.controller = [[GameController alloc]init];
    Level* level1 = [Level levelWithNum:1];
    NSLog(@"anagrams: %@", level1.anagrams);
    
    //add one layer for all game elements. Create a new view iwth dimensions of the screen. Assign it to the gameView property of the Game controller instance. The GameController instance will use this view for all game elements
    UIView* gameLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenHeight, kScreenWidth)];
    [self.view addSubview:gameLayer];
    self.controller.gameView = gameLayer;
    self.controller.level = level1;
    [self.controller dealRandomAnagram];
}


@end
    
