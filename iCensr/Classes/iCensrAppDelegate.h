//
//  iCensrAppDelegate.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashViewController.h"

//@class SplashViewController;

@interface iCensrAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow	*window;
    SplashViewController *viewController;
	NSString	*mstTwtName;
	NSString	*mstTwtPW;
	NSString	*mstEmail;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashViewController *viewController;
// user values
@property (nonatomic, retain) NSString	*mstTwtName;
@property (nonatomic, retain) NSString	*mstTwtPW;
@property (nonatomic, retain) NSString	*mstEmail;

@end

