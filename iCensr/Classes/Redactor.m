//
//  Redactor.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Redactor.h"


@implementation Redactor

//@synthesize redaction;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		//self.redaction = [[Redaction alloc] init];
		self.redactions = [[NSMutableArray alloc] initWithObjects:nil];
    }
    return self;
}

// handle touches to draw black lines
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];

	// save point where finger comes down
	point1 = location;
	point2 = CGPointMake(location.x +10, location.y);
	//[self.redaction setPoints:point1 to:point2];
	
	if(point1.x == 0) { NSLog(@"sucks to be you!"); }
	//NSLog(@"Checking up on %f", [redaction getPoint1].x);
	
	
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//[self.redactions addObject:redaction];
	Redaction *savedRedaction = [[Redaction alloc] init];
	//[test setPointX:point1.x y:point1.y]; 
	[savedRedaction setPoints:point1 to:point2];
	[redactions addObject:savedRedaction];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];
	point2 = location;
	//[self.redaction setPointX:location.x y:location.y];
	NSLog(@"______________TouchMoved %f_______________", location.x);
	
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	NSLog(@"drawRect");
	
	//point1 = [redaction getPoint1];
	//point2 = [redaction getPoint2];
	
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
	
	/*
	// test new set up _________________
	CGRect theRect2 = CGRectMake(30,30, 40, 40);
	
	
	//Grab the drawing content
	CGContextRef context2 = UIGraphicsGetCurrentContext();
	
	// like Processing pushMatrix
	CGContextSaveGState(context2);
	CGContextTranslateCTM(context2, 50, 50);
	CGContextRotateCTM(context2, newAngle);
	
	// Uncomment to see the rotated square
	//CGContextRotateCTM(context, rotation);
	
	// Set black stroke
	CGContextSetRGBStrokeColor(context2, 0.0, 0.0, 0.0, 1.0);
	
	// Set fill color to black
	CGContextSetRGBFillColor(context2, 0.0, 0.0, 0.0, 1.0);
	
	// Draw a rect with a red stroke
	CGContextFillRect(context2, theRect2);
	CGContextStrokeRect(context2, theRect2);
	
	// like Processing popMatrix
	CGContextRestoreGState(context2);
	 */
}


- (void)dealloc {
    [super dealloc];
}


@end
