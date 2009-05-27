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
	IBOutlet	UIView		*edit;
}
@property(nonatomic, retain) ShareViewController	*shareViewController;
@property(nonatomic, retain) IBOutlet	UIView		*edit;

- (IBAction) renderImage:(id)sender;

- (IBAction) cancelEdit:(id)sender;

@end
