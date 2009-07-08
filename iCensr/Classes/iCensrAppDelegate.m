//
//  iCensrAppDelegate.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iCensrAppDelegate.h"
//#import "iCensrViewController.h"

@implementation iCensrAppDelegate

@synthesize window;
@synthesize viewController;
/*
- (void)swapInViewAspectWithIdentifier:(NSString *)key {

	
	//SEL *viewController = [aspectControllers objectForKey:key];
	UIResponder *view = [viewController view];
	
	// now, do stuff with the view, such as making it the current subview of the window
}
*/
- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    NSLog(@"________________________________DELEGATE SCREEN LOADED___________________________");
	
	// SPLASH SCREEN LOAD
	viewController = [[SplashViewController alloc] init];
	
    // Override point for customization after app launch    
    [window addSubview:[viewController view]];
    [window makeKeyAndVisible];
	 
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
