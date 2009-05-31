//
//  ShareViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShareViewController.h"


@implementation ShareViewController

@synthesize twtName, twtPW, twtMessage, willShare;


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

#pragma mark share action methods

- (IBAction) share:(id)sender {
	// hide keyboard
	//[twtName resignFirstResponder];
	
	// submit picture and text to Twitter
    NSString *username = twtName.text;
    NSString *password = twtPW.text;
    
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
		
		// Send test post
		[twitterEngine sendUpdate:twtMessage.text];
		
		// if selected, submit picture and text to NCAC
	}
}

- (IBAction) hideKeyBoard:(id) sender {
	[twtName resignFirstResponder];
}

#pragma mark MGTwitterEngineDelegate methods


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
}


// had to edit UIImage from NSIMage, not sure what this will do
- (void)imageReceived:(UIImage *)image forRequest:(NSString *)identifier
{
    NSLog(@"Got an image: %@", image);
    
    // Save image to the Desktop.
    NSString *path = [[NSString stringWithFormat:@"~/Desktop/%@.tiff", identifier] stringByExpandingTildeInPath];
    [[image TIFFRepresentation] writeToFile:path atomically:NO];
}


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
