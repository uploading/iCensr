//
//  EditorViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewController.h"

@interface EditorViewController : UIViewController {
	ShareViewController		*shareViewController;
	//IBOutlet	UIView		*photo;
	NSMutableArray	*redactions; // array of completed rectangles
}
@property(nonatomic, retain) ShareViewController	*shareViewController;
//@property(nonatomic, retain) IBOutlet	UIView		*photo;
@property(nonatomic, retain) NSMutableArray	*redactions;

- (IBAction) renderImage:(id)sender;

- (IBAction) cancelEdit:(id)sender;

@end
