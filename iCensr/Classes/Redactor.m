//
//  Redactor.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Redactor.h"


@implementation Redactor

@synthesize redaction;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

// handle touches to draw black lines
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[UIView beginAnimations: @"redact" context: nil];
	[UIView setAnimationDuration:1];
	[UIView setAnimationBeginsFromCurrentState:YES];
	UITouch *touch = [touches anyObject];
	redaction.center = [touch locationInView:self];
	[UIView commitAnimations];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
