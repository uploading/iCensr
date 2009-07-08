//
//  EditorViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewController.h"
//#import "Transition.h"
#import "Redactor.h"

@interface EditorViewController : UIViewController {
	ShareViewController		*shareViewController;
	//Transition				*transition;
	NSTimer					*timer;
	IBOutlet Redactor		*redactor;
	IBOutlet UIImageView	*image;
	IBOutlet UIToolbar		*toolbar;
	//Redactor				*redactor;
	//IBOutlet	UIView		*photo;
	//NSMutableArray	*redactions; // array of completed rectangles
}
@property(nonatomic, retain) ShareViewController	*shareViewController;
//@property(nonatomic, retain) Transition				*transition;
@property(nonatomic, retain) NSTimer				*timer;
@property(nonatomic, retain) Redactor				*redactor;
@property(nonatomic,retain) IBOutlet UIView			*image;
@property(nonatomic,retain) IBOutlet UIToolbar		*toolbar;
//@property(nonatomic, retain) IBOutlet	UIView		*photo;
@property(nonatomic, retain) NSMutableArray	*redactions;

- (IBAction) shareImage:(id)sender;
- (IBAction) cancelEdit:(id)sender;
- (void) setPic:(UIImage *)picture;
- (UIImage *) render; // take screenshot
- (void)curlDownScreen;
- (void)curlUpScreen;

@end
