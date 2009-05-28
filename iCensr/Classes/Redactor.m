//
//  Redactor.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Redactor.h"


@implementation Redactor

@synthesize redaction, xValue, yValue;

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
	CGPoint location = [touch locationInView:self];
	redaction.center = location;
	[UIView commitAnimations];

	// save point where finger comes down
	point1  = location;
	if(point1.x == 0) { NSLog(@"sucks to be you!"); }
	NSLog(@"Checking up on %f", point1.x);
	xValue.text = [NSString stringWithFormat:@"%f", point1.x];
	yValue.text = [NSString stringWithFormat:@"%f", point1.y];
	//yValue.text = @"Never!";
	//point1 = [touch locationInView:self];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//UITouch *touch = [touches anyObject];
	//CGPoint location = [touch locationInView:self];
	//redaction.size.width = location.x - point1.x;
	
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
