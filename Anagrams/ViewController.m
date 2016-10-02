//
//  ViewController.m
//  Anagrams
//

#import "config.h"
#import "ViewController.h"
#import "Level.h"
#import "GameController.h"

@interface ViewController ()
@property (strong, nonatomic) GameController* controller;
@end

@implementation ViewController

//setup the view and instantiate the game controller

-(instancetype)initWithCoder:(NSCoder *)decoder{
    self = [super initWithCoder:decoder];
    if (self != nil) {
        //create game controller
        self.controller = [[GameController alloc]init];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    Level* level1 = [Level levelWithNum:1];
    NSLog(@"anagrams: %@", level1.anagrams);
    
    //add one layer for all game elements. Create a new view iwth dimensions of the screen. Assign it to the gameView property of the Game controller instance. The GameController instance will use this view for all game elements
    UIView* gameLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:gameLayer];
    
    self.controller.gameView = gameLayer;
}

@end
