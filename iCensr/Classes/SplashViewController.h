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
#import "AlertViewController.h"

//tabBarController

@interface SplashViewController : UIViewController {
	NSTimer *timer;
	UIImageView *splashImageView;
	
	CameraViewController *viewController;
	AlertViewController *alertViewController;

}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;
@property(nonatomic,retain) CameraViewController *viewController;

@property(nonatomic,retain) AlertViewController *alertViewController;


@end
