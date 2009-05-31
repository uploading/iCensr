//
//  Redaction.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/30/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Redaction : UIView {
	CGPoint point1;
	CGPoint point2;
	//CGFloat	xPoint2;
	//CGFloat yPoint2;
}

- (id)init;
- (id)initWithPoints:(CGPoint)p1 to:(CGPoint)p2;
- (void)setPoints:(CGPoint)p1 to:(CGPoint)p2;
- (void)setPoint2:(CGPoint)nPoint2;
- (CGPoint)getPoint1;
- (CGPoint)getPoint2;
//- (void)setPointX:(CGFloat)x2 y:(CGFloat)y2;

@end
