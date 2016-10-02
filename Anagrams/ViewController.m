//
//  ViewController.m
//  Anagrams
//

#import "config.h"
#import "ViewController.h"
#import "Level.h"

@interface ViewController ()
@end

@implementation ViewController

//setup the view and instantiate the game controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    Level* level1 = [Level levelWithNum:1];
    NSLog(@"anagrams: %@", level1.anagrams);
}

@end
