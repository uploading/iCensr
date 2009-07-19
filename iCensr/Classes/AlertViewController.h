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
#import "ShareViewController.h"

@class ShareViewController;

@interface AlertViewController : UIViewController {
	ShareViewController		*shareViewController; // instance to connect and maniplaute the share view

	// fields for login alert box
	IBOutlet UIAlertView	*signinAlertView;
	IBOutlet NSString		*twtName;
	IBOutlet NSString		*twtPW;
	IBOutlet UITextField	*twtNameField;
	IBOutlet UITextField	*twtPWField;
	MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
	
	IBOutlet BOOL			*isUploading; // yes if information should be uploaded
	IBOutlet BOOL			*hasUploaded; // yes if information has been uploaded
	// if uploading material
	IBOutlet UIImage		*image2upload;
	IBOutlet NSString		*text2upload;
	IBOutlet UISwitch		*willShare;	// send the edit and text to the NCAC site
}

@property(nonatomic,retain) IBOutlet UIAlertView *signinAlertView;
@property(nonatomic,retain) IBOutlet NSString *twtName;
@property(nonatomic,retain) IBOutlet NSString *twtPW;
@property(nonatomic,retain) IBOutlet UITextField	*twtNameField;
@property(nonatomic,retain) IBOutlet UITextField	*twtPWField;
// if uploading material
@property(nonatomic) IBOutlet BOOL			*isUploading;
@property(nonatomic) IBOutlet BOOL			*hasUploaded;
@property(nonatomic,retain) IBOutlet UIImage		*image2upload;
@property(nonatomic,retain) IBOutlet NSString		*text2upload;
//@property(nonatomic,retain) IBOutlet UISwitch		*willShare;

// login related functions
- (BOOL) isSignedIn;
- (BOOL) isSignedInWithName:(NSString *)name andPassword:(NSString *)password;
- (void) askForLoginInfo;
- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void) checkContent;
- (void) reaskForLoginInfo;
- (void) checkConnection;
- (void) saveValues;

- (UITextField*)addTextFieldWithValue:(NSString*)value label:(NSString*)label;
- (UITextField*)textFieldAtIndex:(NSUInteger)index;
//- (NSUInteger)textFieldCount;
//- (UITextField*)textField;

// for uploading material
- (void) setShareViewController:(ShareViewController*)newShareViewController;
- (void) uploadPicture:(UIImage *)img withText:(NSString *) txt;
- (void) checkForUploads;
- (void) upload2twitpic:(NSData *)picture;
//- (void) upload2site:(NSData *)picture;
- (void) setImageURL:(NSString *)url;

@end
