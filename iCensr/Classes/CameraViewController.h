//
//  CameraViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "AboutViewController.h"
#import "EditorViewController.h"
#import "ORSTwitPicDispatcher.h"
//#import "MGTwitterEngine.h"
//#import "AlertViewController.h"


@interface CameraViewController : UIViewController {
	AboutViewController *aboutViewController;
	EditorViewController *editorViewController;
	
	//settings for buttons and views
	UIImagePickerController *imagePicker; // for use with the album
	UIImagePickerController *imageTaker; // for use with the camera
    IBOutlet UIBarItem *album; // button sending user to the album
	IBOutlet UIBarItem *camera; // button sending user to the camer
	IBOutlet UIBarItem *upload; // button allowing user to upload the image
    IBOutlet UIImageView *image; // image of the item

	/*
	// fields for login alert box
	IBOutlet UIAlertView	*signinAlertView;
	IBOutlet UITextField	*twtName;
	IBOutlet UITextField	*twtPW;
	MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
*/
	//AlertViewController *alertViewController;
}

@property(nonatomic,retain) AboutViewController *aboutViewController;
@property(nonatomic,retain) EditorViewController *editorViewController;

@property(nonatomic,retain) UIImagePickerController *imagePicker;
@property(nonatomic,retain) UIImagePickerController *imageTaker;

/**@property(nonatomic,retain) IBOutlet UIAlertView *signinAlertView;
@property(nonatomic,retain) IBOutlet UITextField *twtName;
@property(nonatomic,retain) IBOutlet UITextField *twtPW;
 */
//@property(nonatomic,retain) AlertViewController *alertViewController;

- (IBAction) grabImage;
- (IBAction) takeImage;
- (IBAction) aboutICensr:(id) sender;

// for debugging purposes
- (IBAction) toEditor:(id)sender;

/*
// login related functions
- (BOOL) isSignedIn;
- (void) askForLoginInfo;
- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void) checkContent;
- (void) checkConnection;
- (void) saveValues;

- (UITextField*)addTextFieldWithValue:(NSString*)value label:(NSString*)label;
- (UITextField*)textFieldAtIndex:(NSUInteger)index;
- (NSUInteger)textFieldCount;
- (UITextField*)textField;
*/

@end
