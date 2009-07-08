//
//  iCensrAppDelegate.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashViewController.h"
#import "EditorViewController.h"

@interface iCensrAppDelegate : NSObject <UIApplicationDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {	
	UIWindow	*window;
	UIImageView* imageView;
    SplashViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashViewController *viewController;

@end