//
//  Redaction.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Redaction.h"


@implementation Redaction

- (id)init {
	point1 = CGPointMake(50,50);
	point2 = CGPointMake(70,70);
	NSLog(@"_________________values set: %f________________", point1.x);
	return self;
}

- (id)initWithPoints:(CGPoint)p1 to:(CGPoint)p2 {
	NSLog(@"_________________values set: %f________________", p1.x);
	point1 = p1;
	point2 = p2;
	return self;
}

- (void)setPoints:(CGPoint)p1 to:(CGPoint)p2 {
	NSLog(@"_________________values set: %f________________", p1.x);
	point1 = p1;
	point2 = p2;
}

- (void)setPoint2:(CGPoint)nPoint2 {
	NSLog(@"_________________values set: %f________________", nPoint2.x);
	point2 = nPoint2;
}

- (CGPoint)getPoint1 {
	return point1;
}

- (CGPoint)getPoint2 {
	return point2;
}

/*
 - (void)setPointX:(CGFloat)x2 y:(CGFloat)y2 {
	NSLog(@"_________________values set: %f________________", x2);
	xPoint2 = x2;
	yPoint2 = y2;
}
 */

@end
