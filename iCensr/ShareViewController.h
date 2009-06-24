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
	IBOutlet UITextField	*twtMessage;
	IBOutlet UITextField	*twtName;	// user's twitter ID
	IBOutlet UITextField	*twtPW;		// user's twitter password
	//IBOutlet UITextView		*twtMessage;		// user's email address
	IBOutlet UISwitch		*willShareOnTwitter;	// send the edit and text to twitter
	IBOutlet UISwitch		*willSubmitToNCAC;	// send the edit and text to the NCAC site
	IBOutlet UISwitch		*willSaveInAlbum;	// save the edit to photo album
	//BOOL			*viewShifted;
	//MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
	AlertViewController		*alertViewController;
	//IBOutlet NSString		*twtPicURL; // holds url where twitpic is sent
}

@property(nonatomic,retain) IBOutlet UIImageView	*twtPic;
@property(nonatomic,retain) IBOutlet UITextField	*twtMessage;		// user's email address
@property(nonatomic,retain)	IBOutlet UITextField	*twtName;	// user's twitter ID
@property(nonatomic,retain) IBOutlet UITextField	*twtPW;		// user's twitter password
@property(nonatomic,retain) IBOutlet UISwitch		*willShareOnTwitter;
@property(nonatomic,retain) IBOutlet UISwitch		*willSubmitToNCAC;
@property(nonatomic,retain) IBOutlet UISwitch		*willSaveInAlbum;
@property(nonatomic,retain) AlertViewController		*alertViewController;
//@property(nonatomic,retain) IBOutlet NSString		*twtPicURL;

- (IBAction) share:(id)sender;
- (IBAction) back:(id)sender;
- (IBAction) hideKeyBoard:(id) sender;
//- (IBAction) hideViewKeyBoard:(id) sender;
- (void) setImage:(UIImage *)picture;
- (void) upload2site:(NSData *)picture;
//- (void) upload2twitpic:(NSData *)picture;
//- (void) upload2site:(NSData *)picture;
//- (void) setImageURL:(NSString *)url;

//- (void) insertStringTokenInNewStatusTextField:(NSString *)stringToken;

// shifting for the keyboard
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView;
- (void)textViewDidEndEditing:(UITextView *)textView;

@end
