//
//  SplashViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SplashViewController.h"

@implementation SplashViewController

@synthesize timer,splashImageView,alertViewController, viewController;

// Load and set up splashImageView, viewController, and timer
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
	
	viewController = [[CameraViewController alloc] initWithNibName:@"CameraView" bundle:[NSBundle mainBundle]];
	[self.view addSubview:viewController.view];
	[self.view addSubview:splashImageView];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fadeScreen) userInfo:nil repeats:NO];
}

// call to fade out splash view
- (void)fadeScreen
{
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	splashImageView.alpha = 0.0;	//fades the alpha channel of this view to "0.0" over the animation
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}

// called when fade is complete
- (void) finishedFading
{
	// set up alert view sequence if username and password have not previously been entered
	alertViewController = [[AlertViewController alloc] init];
	[alertViewController isSignedIn];
	if(![alertViewController isSignedIn]) {
		[alertViewController askForLoginInfo];
	}
	[splashImageView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[splashImageView release];
	[alertViewController release];
	[viewController release];
    [super dealloc];
}


@end
