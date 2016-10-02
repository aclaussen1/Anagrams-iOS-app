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
}

@end
