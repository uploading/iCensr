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
	
	
	[self setNeedsDisplay];
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
	NSLog(@"drawRect");
	
	CGFloat squareSize = 40;
	
	CGFloat centerx = point1.x;//rect.size.width/2;
	CGFloat centery = point1.y; //rect.size.height/2;
	CGFloat half = squareSize/2;
	CGRect theRect = CGRectMake(-half, -half, squareSize, squareSize);
	
	//Grab the drawing content
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// like Processing pushMatrix
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, centerx, centery);
	
	// Uncomment to see the rotated square
	//CGContextRotateCTM(context, rotation);
	
	// Set red stroke
	CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
	
	// Set different based on multitouch
	//if(!twoFingers) {
		CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
	/*}
	else {
		CGContextSetRGBFillColor(context, 0.0, 1.0, 1.0, 1.0);
	}*/
	
	// Draw a rect with a red stroke
	CGContextFillRect(context, theRect);
	CGContextStrokeRect(context, theRect);
	
	// like Processing popMatrix
	CGContextRestoreGState(context);	
}


- (void)dealloc {
    [super dealloc];
}


@end
