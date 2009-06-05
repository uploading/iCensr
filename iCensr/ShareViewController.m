//
//  ShareViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShareViewController.h"


@implementation ShareViewController

@synthesize twtPic, twtName, twtPW, twtMessage, alertViewController, willShare;
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
	twtName.text = name;
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
	twtPW.text = password;
}
*/
- (void) setImage:(UIImage *)picture {
	twtPic.image = picture;
	
	// piggy backing to set user default name and password
	NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
	twtName.text = name;
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
	twtPW.text = password;
}

#pragma mark share action methods

- (IBAction) share:(id)sender {
	// hide keyboard
	//[twtName resignFirstResponder];
	
	// submit picture and text to Twitter
    //NSString *username = twtName.text;
    //NSString *password = twtPW.text;
	
	// save settings
	NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
	NSString *pw = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:pw forKey:@"password"];
	
	alertViewController = [[AlertViewController alloc] init];
	if([alertViewController isSignedIn]) {
		[alertViewController uploadPicture:twtPic.image withText:twtMessage.text];
		
		[alertViewController checkContent];
	}
	else {
		[alertViewController uploadPicture:twtPic.image withText:twtMessage.text];
		[alertViewController askForLoginInfo];
	}
    /*
    // Make sure you entered your login details before running this code... ;)
    if ([username isEqualToString:@"n/a"] || [password isEqualToString:@"n/a"]) {
        NSLog(@"You forgot to specify your username/password in AppController.m!");
        // send alert asking for name and password
		UIAlertView *prompt = [UIAlertView alloc];
		prompt = [prompt initWithTitle:@"Missing Information" message:@"iCensr requires your Twitter name and password to tweet your censr." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
		[prompt show];
		[prompt release];
    }
    else {
		
		// Create a TwitterEngine and set our login details.
		twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:self];
		[twitterEngine setUsername:username password:password];
		
		// Get updates from people the authenticated user follows.
		[twitterEngine getFollowedTimelineFor:username since:nil startingAtPage:0];
		
		// set up image for uploading
		NSData *imageData = UIImageJPEGRepresentation(twtPic.image, 90);
		
		// Send picture to twitpic
		[self upload2twitpic:imageData];
		
		// Send text post
		[twitterEngine sendUpdate:twtMessage.text];
		
		// if selected, submit picture and text to NCAC
		if(willShare.on) {
			[self upload2site:imageData];
		}
		 
		
	}*/
}

- (IBAction)back:(id) sender {
	self.view.hidden = YES;
}

- (IBAction) hideKeyBoard:(id) sender {
	[twtName resignFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
	[twtMessage resignFirstResponder];
}

#pragma mark MGTwitterEngineDelegate methods

/*
- (void)requestSucceeded:(NSString *)requestIdentifier
{
    NSLog(@"Request succeeded (%@)", requestIdentifier);
	
	// save settings
	NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
	NSString *pw = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:pw forKey:@"password"];
	
	// return to camera view
	[[self parentViewController] view].hidden = YES;
	self.view.hidden = YES;
}


- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
    NSLog(@"Twitter request failed! (%@) Error: %@ (%@)", 
          requestIdentifier, 
          [error localizedDescription], 
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	// send alert asking for name and password
	UIAlertView *prompt = [UIAlertView alloc];
	prompt = [prompt initWithTitle:@"Connection Failed" message:@"iCensr could not reach Twitter.  Check your name and password." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[prompt show];
	[prompt release];
}


- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier
{
    NSLog(@"Got statuses:\r%@", statuses);
}


- (void)directMessagesReceived:(NSArray *)messages forRequest:(NSString *)identifier
{
    NSLog(@"Got direct messages:\r%@", messages);
}


- (void)userInfoReceived:(NSArray *)userInfo forRequest:(NSString *)identifier
{
    NSLog(@"Got user info:\r%@", userInfo);
}


- (void)miscInfoReceived:(NSArray *)miscInfo forRequest:(NSString *)identifier
{
	NSLog(@"Got misc info:\r%@", miscInfo);
} */

#pragma mark moving screen for keyboard
// the amount of vertical shift upwards keep the Notes text view visible as the keyboard appears
#define kOFFSET_FOR_KEYBOARD					140.0

// the duration of the animation for the view shift
#define kVerticalOffsetAnimationDuration		0.50

- (IBAction)textFieldDoneEditing:(id)sender {
	NSLog(@"TEXT FIELD DONE EDITING called");
	[sender resignFirstResponder];
}

- (IBAction)backgroundClick:(id)sender
{
	NSLog(@"BACKGROUND CLICK called");
	//[latitudeField resignFirstResponder];
	//[longitudeField resignFirstResponder];
	//[notesField resignFirstResponder];
	
	if (viewShifted)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:kVerticalOffsetAnimationDuration];
		
		CGRect rect = self.view.frame;
		rect.origin.y += kOFFSET_FOR_KEYBOARD;
		rect.size.height -= kOFFSET_FOR_KEYBOARD;
		self.view.frame = rect;
		
		[UIView commitAnimations];
		
		viewShifted = FALSE;
	}		
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
	if (!viewShifted) {		// don't shift if it's already shifted
		NSLog(@"VIEW SHOULD BEGIN EDITING called");
		
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:kVerticalOffsetAnimationDuration];
		
		CGRect rect = self.view.frame;		
		rect.origin.y -= kOFFSET_FOR_KEYBOARD;
		rect.size.height += kOFFSET_FOR_KEYBOARD;
		self.view.frame = rect;
		
		[UIView commitAnimations];
		
		viewShifted = TRUE;
	}
	return YES;
}

#pragma mark default code

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	//[twitterEngine release];
	//[alertViewController release];
    [super dealloc];
}


@end
