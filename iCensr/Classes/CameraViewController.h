//
//  CameraViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutViewController.h"

@interface CameraViewController : UIViewController {
	AboutViewController *aboutViewController;
}

@property(nonatomic,retain) AboutViewController *aboutViewController;

- (IBAction) aboutICensr:(id) sender;

@end