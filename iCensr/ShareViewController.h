//
//  ShareViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MGTwitterEngine.h"
//#import "ORSTwitPicDispatcher.h"
//#import "EditorViewController.h"
#import "AlertViewController.h"

@interface ShareViewController : UIViewController {
	IBOutlet UIImageView	*twtPic;	// redacted picture to be posted
	IBOutlet UITextField	*twtName;	// user's twitter ID
	IBOutlet UITextField	*twtPW;		// user's twitter password
	IBOutlet UITextView		*twtMessage;		// user's email address
	IBOutlet UISwitch		*willShare;	// send the edit and text to the NCAC site
	BOOL			*viewShifted;
	//MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
	AlertViewController		*alertViewController;
}

@property(nonatomic,retain) IBOutlet UIImageView	*twtPic;
@property(nonatomic,retain)	IBOutlet UITextField	*twtName;	// user's twitter ID
@property(nonatomic,retain) IBOutlet UITextField	*twtPW;		// user's twitter password
@property(nonatomic,retain) IBOutlet UITextView		*twtMessage;		// user's email address
@property(nonatomic,retain) IBOutlet UISwitch		*willShare;
@property(nonatomic,retain) AlertViewController		*alertViewController;

- (IBAction) share:(id)sender;
- (IBAction) back:(id)sender;
- (IBAction) hideKeyBoard:(id) sender;
- (IBAction) hideViewKeyBoard:(id) sender;
- (void) setImage:(UIImage *)picture;
//- (void) upload2twitpic:(NSData *)picture;
//- (void) upload2site:(NSData *)picture;
//- (void) setImageURL:(NSString *)url;

//- (void) insertStringTokenInNewStatusTextField:(NSString *)stringToken;

// shifting for the keyboard
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;

@end
