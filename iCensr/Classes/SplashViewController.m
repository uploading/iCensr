//
//  SplashViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SplashViewController.h"

@implementation SplashViewController

@synthesize timer,splashImageView,alertViewController;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	NSLog(@"________________________________SPLASH SCREEN LOADED___________________________");
	// Init the view
	CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	UIView *view = [[UIView alloc] initWithFrame:appFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = view;
	[view release];
	
	splashImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash.png"]];
	splashImageView.frame = CGRectMake(0, 0, 320, 480);
	//[splashImageView.backgroundColor alpha:0.0];
	
	viewController = [[CameraViewController alloc] initWithNibName:@"CameraView" bundle:[NSBundle mainBundle]];
	viewController.view.alpha = 0.0;
	[self.view addSubview:splashImageView];
	[self.view addSubview:viewController.view];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fadeScreen) userInfo:nil repeats:NO];
}
	
- (void)fadeScreen
{
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	self.view.alpha = 0.0;	//fades the alpha channel of this view to "0.0" over the animation
	//viewController.view.alpha = 1.0;
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}

- (void) finishedFading
{
	/*
	[UIView beginAnimations:nil context:nil]; //begins animation block;
	[UIView setAnimationDuration:0.75];		// sets animation duration
	self.view.alpha = 1.0;		// fades the view to 1.0 alpha over 0.75 seconds
	viewController.view.alpha = 1.0;
	[UIView commitAnimations]; //commits the animation block.  This Block is done.
	*/
	// set up alert view sequence if username and password have not previously been entered
	alertViewController = [[AlertViewController alloc] init];
	[alertViewController isSignedIn];
	if(![alertViewController isSignedIn]) {
		[alertViewController askForLoginInfo];
	}
	[splashImageView removeFromSuperview];
}

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
	[splashImageView release];
    [super dealloc];
}


@end
