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
	point1 = location;
	point2 = CGPointMake(location.x +10, location.y);
	if(point1.x == 0) { NSLog(@"sucks to be you!"); }
	NSLog(@"Checking up on %f", point1.x);
	xValue.text = [NSString stringWithFormat:@"%f", point1.x];
	yValue.text = [NSString stringWithFormat:@"%f", point1.y];
	
	
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];
	point2 = location;
	
	[self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	NSLog(@"drawRect");
	
	// x length between fingers
    CGFloat xDist = xDist = point1.x - point2.x;
    // y length between fingers
    CGFloat yDist = point1.y-point2.y;
	// respective midpoints between two points
	CGFloat xMidpoint = (point1.x+point2.x)/2;
	CGFloat yMidpoint = (point1.y+point2.y)/2;
	
	// width of the rectangle
	CGFloat rectWeight = 30;
	
	// disance between point1 and point2
	CGFloat squareSize = sqrt(xDist*xDist + yDist*yDist);
	// angle of fingers    
    CGFloat newAngle = atan(yDist/xDist);
	
	CGFloat centerx = xMidpoint;//rect.size.width/2;
	CGFloat centery = yMidpoint; //rect.size.height/2;
	CGFloat half = squareSize/2;
	CGRect theRect = CGRectMake(-half, -rectWeight/2, squareSize, rectWeight);
	
	
	//Grab the drawing content
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// like Processing pushMatrix
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, centerx, centery);
	CGContextRotateCTM(context, newAngle);
	
	// Uncomment to see the rotated square
	//CGContextRotateCTM(context, rotation);
	
	// Set black stroke
	CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
	
	// Set fill color to black
	CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
	
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
