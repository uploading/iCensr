//
//  Redactor.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Redaction.h"

@interface Redactor : UIView {
	CGPoint		point1;
	CGPoint		point2;
	//Redaction	*redaction;		// the rectangle that is currently being drawn
	NSMutableArray		*redactions;	// holder for all the redactions
	//IBOutlet	UIImage *picture;
	IBOutlet	UIImage *result;
}

//@property (nonatomic,retain) Redaction *redaction;
@property(nonatomic, retain) NSMutableArray		*redactions;
@property(nonatomic, retain) IBOutlet	UIImage	*result;

- (void)drawEdits:(CGRect)rect;

@end
