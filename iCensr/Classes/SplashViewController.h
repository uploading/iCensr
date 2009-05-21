//
//  SplashViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <UITabBarController.h>
#import "iCensrViewController.h"

//tabBarController

@interface SplashViewController : UIViewController {
	NSTimer *timer;
	UIImageView *splashImageView;
	
	iCensrViewController *viewController;
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;
@property(nonatomic,retain) iCensrViewController *viewController;

@end
