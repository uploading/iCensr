//
//  AlertViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 6/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "MGTwitterEngine.h"
#import "ORSTwitPicDispatcher.h"

@interface AlertViewController : UIViewController {
	// fields for login alert box
	IBOutlet UIAlertView	*signinAlertView;
	IBOutlet NSString	*twtName;
	IBOutlet NSString	*twtPW;
	MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
	
	IBOutlet BOOL			*isUploading; // yes if information should be uploaded
	// if uploading material
	IBOutlet UIImage		*image2upload;
	IBOutlet NSString		*text2upload;
	IBOutlet UISwitch		*willShare;	// send the edit and text to the NCAC site
}

@property(nonatomic,retain) IBOutlet UIAlertView *signinAlertView;
@property(nonatomic,retain) IBOutlet NSString	*twtName;
@property(nonatomic,retain) IBOutlet NSString	*twtPW;
// if uploading material
@property(nonatomic) IBOutlet BOOL			*isUploading;
@property(nonatomic,retain) IBOutlet UIImage		*image2upload;
@property(nonatomic,retain) IBOutlet NSString		*text2upload;
@property(nonatomic,retain) IBOutlet UISwitch		*willShare;

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

// for uploading material
- (void) uploadPicture:(UIImage *)img withText:(NSString *) txt;

@end
