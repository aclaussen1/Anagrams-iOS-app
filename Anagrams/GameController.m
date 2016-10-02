//
//  GameController.m
//  Anagrams
//
//  Created by Alexander Claussen on 10/2/16.
//  Copyright © 2016 Underplot ltd. All rights reserved.
//

#import "GameController.h"


@implementation GameController

//fetches a random anagram, deals the letter tiles and creates the targets
-(void)dealRandomAnagram
{
    //check to see if this is called after level property is set and that level contains anagrams
    NSAssert(self.level.anagrams, @"no level loaded");
    
    //generate a random index into the anagram list, then grab the anagram at this index
    int randomIndex = arc4random()%[self.level.anagrams count];
    NSArray* anaPair = self.level.anagrams[randomIndex];
    
    //store two phrases into anagram1 and anagram2
    NSString* anagram1 = anaPair[0];
    NSString* anagram2 = anaPair[1];
    
    //store number of characters in each phrase into ana1len and ana2len
    int ana1len = [anagram1 length];
    int ana2len = [anagram2 length];
    
    NSLog(@"phrase[%i]: %@", ana1len, anagram1);
    NSLog(@"phrase[%i]: %@", ana2len, anagram2);
}

@end
