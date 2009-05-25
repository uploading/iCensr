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
@synthesize viewController, mstTwtName, mstTwtPW, mstEmail;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    //NSLog(@"________________________________DELEGATE SCREEN LOADED___________________________");
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
