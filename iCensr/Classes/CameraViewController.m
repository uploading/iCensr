//
//  CameraViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


@implementation CameraViewController

@synthesize aboutViewController, editorViewController, imagePicker, imageTaker, twtName, twtPW, signinAlertView;

- (IBAction) aboutICensr:(id) sender {
	NSLog(@"__________transition to iCensr Info___________");
		 AboutViewController *newView = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:[NSBundle mainBundle]];
		 self.aboutViewController = newView;
		 [newView release];
		 NSLog(@"_____________if statement run_____________");
		 [self.view addSubview:aboutViewController.view];
		 //[self.navigationController pushViewController:self.aboutViewController animated:YES];
}
/*
- (void)viewDidLoad {
	self.imagePicker = [[UIImagePickerController alloc] init];
	self.imagePicker.allowsImageEditing = YES;
	self.imagePicker.delegate = self;
	self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	self.imageTaker = [[UIImagePickerController alloc] init];
	self.imageTaker.allowsImageEditing = YES;
	self.imageTaker.delegate = self;
	self.imageTaker.sourceType = UIImagePickerControllerSourceTypeCamera;
}
*/
- (IBAction)grabImage {
    [self presentModalViewController:self.imagePicker animated:YES];
	NSLog(@"+++++ Image Grabbed ++++++++");
}

- (IBAction)takeImage {
	[self presentModalViewController:self.imageTaker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
	//open share editor controller
	if(self.editorViewController == nil) {
		EditorViewController *newView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:[NSBundle mainBundle]];
		self.editorViewController = newView;
		[newView release];
		NSLog(@"_____________if statement run_____________");
		[self.view addSubview:editorViewController.view];
	}
	
	[editorViewController setPic:img];
	
	//image.image = img;
	[[picker parentViewController] dismissModalViewControllerAnimated:YES];
	upload.enabled = YES;
}


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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	// set up image picker / taker for selecting / editing photos
	self.imagePicker = [[UIImagePickerController alloc] init];
	self.imagePicker.allowsImageEditing = YES;
	self.imagePicker.delegate = self;
	self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	self.imageTaker = [[UIImagePickerController alloc] init];
	self.imageTaker.allowsImageEditing = YES;
	self.imageTaker.delegate = self;
	self.imageTaker.sourceType = UIImagePickerControllerSourceTypeCamera;
	
	// if the user has not yet set up their twitter account, as for that information now
	
	if( ![self isSignedIn]) {
		[self askForLoginInfo];
	}
	
    [super viewDidLoad];
}

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
    [super dealloc];
}

# pragma mark login related functions

- (BOOL) isSignedIn {
	NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
	twtName = name;
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
	twtPW = password;
	// if value is not blank or default
	if([name isEqualToString:@""] || [name isEqualToString:@"n/a"] || [password isEqualToString:@""] || [password isEqualToString:@"n/a"]) {
		return NO;
	}
	NSLog(@"IS SIGNED IN");
	return YES;
}

// create login alert box to take twitter username and password
- (void) askForLoginInfo {
	NSLog(@"ASK FOR LOGIN INFO called");
	signinAlertView = [[UIAlertView alloc] initWithTitle:@"Login" message:@"Enter Twitter user name and password" delegate:self cancelButtonTitle:@"Skip" otherButtonTitles:@"Submit", nil];
	twtName = [signinAlertView addTextFieldWithValue:nil label:@"name"];
	[twtName setDelegate:self];
	[twtName setTextAlignment:UITextAlignmentCenter];
	[twtName becomeFirstResponder];
	twtPW = [signinAlertView addTextFieldWithValue:nil label:@"password"];
	[twtPW setTextAlignment:UITextAlignmentCenter];
	[signinAlertView show];
	//[signinAlertView release];
	//signinAlertView = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex { 
	NSLog(@"ALERT VIEW button pressed");
	if(alertView == signinAlertView) {
		NSLog(@"SIGN IN button pressed");
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
				[twtName retain];
				[twtPW retain];
				break;
		}
	}
	else {
		// sent from one of the error alerts
		switch(buttonIndex) {
			case 0:
				// ignore resubmission
				[twtName release];
				[twtPW release];
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
	NSLog(@"CHECK CONTENT called");
	if ([twtName.text isEqualToString:@"n/a"] || [twtPW.text isEqualToString:@"n/a"] || [twtName.text isEqualToString:@""] || [twtPW.text isEqualToString:@""]) {
		[self reaskForLoginInfo];
		NSLog(@"content is empty");
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
	NSLog(@"CHECK CONNECTION called");
	// set up connection to Twitter
	twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:self];
	
	// try to logon with user
	[twitterEngine setUsername:twtName.text password:twtPW.text];
	// Get updates from people the authenticated user follows.
	[twitterEngine getFollowedTimelineFor:twtName.text since:nil startingAtPage:0];
	
	// IF connection succeeds, save the values
	
	// ELSE, If connection fails, ask for results again
}

- (void)requestSucceeded:(NSString *)requestIdentifier
{
    NSLog(@"Request succeeded (%@)", requestIdentifier);
	
	// save settings
	[self saveValues];
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
	NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
	NSString *password = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
	
	[twtName release];
	[twtPW release];
}



@end
