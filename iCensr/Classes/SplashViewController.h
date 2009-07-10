//
//  SplashViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <UITabBarController.h>
#import "CameraViewController.h"
//#import "AboutViewController.h"
#import "AlertViewController.h"

//tabBarController

@interface SplashViewController : UIViewController {
	NSTimer *timer;							// animation timer for splash screen transition to camera view
	UIImageView *splashImageView;			// view containing splash screen to be shown and fade out
	
	CameraViewController *cameraViewController;	// main view of application with links to camera controlls and about information
	AlertViewController *alertViewController;//  controller that pops up alerts if user information has not been set yet
	//AboutViewController *aboutViewController; // controller to establish communication with Camera View
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;

@property(nonatomic,retain) CameraViewController *cameraViewController;
@property(nonatomic,retain) AlertViewController *alertViewController;
//@property(nonatomic,retain) AboutViewController *aboutViewController;


@end
