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
	IBOutlet UIBarButtonItem *back;		// button sends user back to editing view
	IBOutlet UIButton		*submit;	// button submits redaction to chosen locations
	IBOutlet UIImageView	*twtPic;	// redacted picture to be posted
	IBOutlet UITextField	*twtMessage;// message user will post on twitter or NCAC site
	IBOutlet UITextField	*twtName;	// user's twitter ID
	IBOutlet UITextField	*twtPW;		// user's twitter password
	//IBOutlet UITextView		*twtMessage;		// user's email address
	IBOutlet UISwitch		*willShareOnTwitter;	// send the edit and text to twitter
	IBOutlet UISwitch		*willSubmitToNCAC;	// send the edit and text to the NCAC site
	IBOutlet UISwitch		*willSaveInAlbum;	// save the edit to photo album
	
	IBOutlet UIView			*uploadingView;		// show when pic is uploading
	IBOutlet UIActivityIndicatorView *uploadingSpinner; // show when pick is uploading
	//BOOL			*viewShifted;
	//MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
	AlertViewController		*alertViewController;
	//IBOutlet NSString		*twtPicURL; // holds url where twitpic is sent
}

@property(nonatomic,retain) IBOutlet UIBarButtonItem *back;		
@property(nonatomic,retain) IBOutlet UIButton		*submit;
@property(nonatomic,retain) IBOutlet UIImageView	*twtPic;
@property(nonatomic,retain) IBOutlet UITextField	*twtMessage;		// user's email address
@property(nonatomic,retain)	IBOutlet UITextField	*twtName;	// user's twitter ID
@property(nonatomic,retain) IBOutlet UITextField	*twtPW;		// user's twitter password
@property(nonatomic,retain) IBOutlet UISwitch		*willShareOnTwitter;
@property(nonatomic,retain) IBOutlet UISwitch		*willSubmitToNCAC;
@property(nonatomic,retain) IBOutlet UISwitch		*willSaveInAlbum;
@property(nonatomic,retain) IBOutlet UIView			*uploadingView;		// show when pic is uploading
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *uploadingSpinner;
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

- (void)disableFurtherInput;
- (void)enableFurtherInput;

@end
