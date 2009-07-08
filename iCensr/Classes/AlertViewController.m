//
//  AlertViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 6/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AlertViewController.h"

@implementation AlertViewController

@synthesize twtName, twtPW, signinAlertView, isUploading, hasUploaded, image2upload, text2upload, twtNameField, twtPWField;

- (BOOL) isSignedIn { 
	NSLog(@"SIGN IN t/f");
	// default set uploading images to false
	self.isUploading = NO;
	// check to see if there are values set in the user defaults for name and password
	NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
	self.twtName = name;
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
	self.twtPW = password;
	// if value is not blank or default
	NSLog(@"IS SIGNED IN %@ %@", self.twtName, self.twtPW);
	if([name isEqualToString:@""] || [name isEqualToString:@"n/a"] || [password isEqualToString:@""] || [password isEqualToString:@"n/a"] | [name isEqualToString:@"name"] || [password isEqualToString:@"password"] || name == nil || password == nil) {
		return NO;
	}
	return YES;
}

// create login alert box to take twitter username and password
- (void) askForLoginInfo {
	NSLog(@"ASK FOR LOGIN INFO called");
	signinAlertView = [[UIAlertView alloc] initWithTitle:@"Login" message:@"Enter Twitter user name and password" delegate:self cancelButtonTitle:@"Skip" otherButtonTitles:@"Submit", nil];
	twtNameField = [signinAlertView addTextFieldWithValue:nil label:@"name"];
	[[signinAlertView textFieldAtIndex:0] setDelegate:self];
	[[signinAlertView textFieldAtIndex:0] setTextAlignment:UITextAlignmentCenter];
	[[signinAlertView textFieldAtIndex:0] becomeFirstResponder];
	twtPWField = [signinAlertView addTextFieldWithValue:nil label:@"password"];
	[[signinAlertView textFieldAtIndex:1] setTextAlignment:UITextAlignmentCenter];
	[signinAlertView show];
	//[signinAlertView release];
	//signinAlertView = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex { 
	NSLog(@"ALERT VIEW button pressed");
	if(alertView == signinAlertView) {
		NSLog(@"SIGN IN button pressed %@ %@", twtNameField.text, twtPWField.text);
		twtName = twtNameField.text;
		twtPW = twtPWField.text;
		switch(buttonIndex) {
				NSLog(@"ALERT VIEW button pressed");
			case 0:
				// Ignore submission
				NSLog(@"SKIP pressed");
				break;
			case 1:
				// check for submission contents
				NSLog(@"SUBMIT pressed");
				[self checkContent];
				[twtNameField retain];
				[twtPWField retain];
				break;
		}
	}
	else {
		// sent from one of the error alerts
		switch(buttonIndex) {
			case 0:
				// ignore resubmission
				[twtNameField release];
				[twtPWField release];
				break;
			case 1:
				[self askForLoginInfo];
				break;
		}
	}
	[alertView release];
	alertView = nil;
}

- (void) checkContent {
	NSLog(@"CHECK CONTENT called, %@ %@", self.twtName, self.twtPW);
	if ( self.twtName == nil || self.twtPW == nil || [self.twtName isEqualToString:@"n/a"] || [self.twtPW isEqualToString:@"n/a"] || [self.twtName isEqualToString:@""] || [self.twtPW isEqualToString:@""] || [self.twtName isEqualToString:@"name"] || [self.twtPW isEqualToString:@"password"]) {
		NSLog(@"content is empty");
		[self reaskForLoginInfo];
	}
	else {
		NSLog(@"content is present");
		[self checkConnection];
	}
}

// creates alert to ask for submission
- (void) reaskForLoginInfo {
	UIAlertView *prompt = [UIAlertView alloc];
	prompt = [prompt initWithTitle:@"Missing Information" message:@"One of more of the fields has not been completed." delegate:self cancelButtonTitle:@"Ignore" otherButtonTitles:@"Try Again", nil];
	[prompt show];
}

// creates and instance of the twitter engine and checks is name and password login
- (void) checkConnection {
	NSLog(@"CHECK CONNECTION called %@ %@", twtName, twtPW);
	// set up connection to Twitter
	twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:self];
	
	// try to logon with user
	[twitterEngine setUsername:twtName password:twtPW];
	// Get updates from people the authenticated user follows.
	[twitterEngine getFollowedTimelineFor:twtName since:nil startingAtPage:0];
	
	self.hasUploaded = NO;

	// IF connection succeeds, save the values
	
	
	// ELSE, If connection fails, ask for results again
}

- (void)requestSucceeded:(NSString *)requestIdentifier
{
    NSLog(@"Request succeeded (%@)", requestIdentifier);
	
	// save settings
	//[self saveValues];
	if(!self.hasUploaded) {
		[self checkForUploads];
		[self saveValues];
	}
	
	NSLog(@"REQUEST SUCCEEDED completed");
}


- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
    NSLog(@"Twitter request failed! (%@) Error: %@ (%@)", 
          requestIdentifier, 
          [error localizedDescription], 
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	// send alert asking for name and password
	UIAlertView *prompt = [UIAlertView alloc];
	prompt = [prompt initWithTitle:@"Connection Failed" message:@"iCensr could not reach Twitter.  Check your name and password." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Try Again", nil];
	[prompt show];
}

// save values entered in alertbox
- (void) saveValues {
	//NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:self.twtName forKey:@"name"];
	//NSString *password = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:self.twtPW forKey:@"password"];
	
	[twtNameField release];
	[twtPWField release];
}

#pragma mark picture uploading methods 

- (void) setShareViewController:(ShareViewController*)newShareViewController {
	shareViewController = newShareViewController;
}

- (void) uploadPicture:(UIImage *)img withText:(NSString *) txt {
	self.image2upload = img;
	self.text2upload	= txt;
	self.isUploading = YES;
}

- (void) checkForUploads {
	// if there is a picture to upload...upload!
	if(self.isUploading && !self.hasUploaded) {
		self.hasUploaded = YES;
		NSLog(@"Upload images to twitter");
		// set up image for uploading
		NSData *imageData = UIImageJPEGRepresentation(image2upload, 90);
		
		// Send picture to twitpic
		[self upload2twitpic:imageData];
		
		// Send text post
		[twitterEngine sendUpdate:text2upload];
		
		// if selected, submit picture and text to NCAC
		/*if(self.willShare.on) {
			[self upload2site:imageData];
		}*/
	}
	//[super enableFurtherInput];
}

- (void) upload2twitpic:(NSData *)picture {
	// upload to twitpic with Canary app
	ORSTwitPicDispatcher *twitPicDispatcher = [[ORSTwitPicDispatcher alloc] init];
	NSString *uploadInfo = [twitPicDispatcher uploadData:picture withUsername:self.twtName password:self.twtPW filename:@"censrd"];
	
	[self setImageURL:uploadInfo];
	//[self insertStringTokenInNewStatusTextField:twitPicURLString];
}

- (void) setImageURL:(NSString *)url {
	NSString *originalText = text2upload;
	NSString *combinedText = [NSString stringWithFormat:@"%@ %@", url, originalText];
	NSLog(@"%@ ", combinedText);
	text2upload = combinedText;
}

/*- (void) upload2site:(NSData *)picture {
	// setting up the URL to post to
	NSString *urlString = @"http://www.itp.efuller.net/09summer/icensr/support/uploader.php";
	
	//setting up the request object now
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
	[request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	
	// create the body of the post
	
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"ipodfile.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[NSData dataWithData:picture]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	// setting the body of the post to the request
	[request setHTTPBody:body];
	
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	NSLog(returnString);
}*/

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[twitterEngine release];
    [super dealloc];
}


@end
