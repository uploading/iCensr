//
//  Redactor.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Redactor : UIView {
	IBOutlet	UIView		*redaction;
	CGPoint		point1;
	CGPoint		point2;
	IBOutlet	UILabel		*xValue;
	IBOutlet	UILabel		*yValue;
}

@property(nonatomic,retain) IBOutlet	UIView		*redaction;
//@property(nonatomic) IBOutlet	CGPoint		*point1;
@property(nonatomic,retain) IBOutlet	UILabel		*xValue;
@property(nonatomic,retain) IBOutlet	UILabel		*yValue;

@end
