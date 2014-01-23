//
//  DeckTests.m
//  CrazyEightsModel
//
//  Created by Jeremy on 1/23/14.
//  Copyright (c) 2014 Jeremy-Walton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JPWDeck.h"
#import "Kiwi.h"

SPEC_BEGIN(DeckTests)

describe(@"Deck", ^{
    __block JPWDeck *deck;
    
    beforeEach(^{
        deck = [JPWDeck new];
    });
    
    it(@"gets initialized with 52 cards.", ^{
        [[[deck size] should] equal:@52];
    });
    
    it(@"can be shuffled.", ^{
        [deck shuffle];
        
    });
    
});

SPEC_END