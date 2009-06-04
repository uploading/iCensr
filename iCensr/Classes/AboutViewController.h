//
//  AboutViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CameraViewController.h"

@interface AboutViewController : UIViewController {
	IBOutlet UITextField	*twtName;
	IBOutlet UITextField	*twtPW;
	IBOutlet UITextField	*email;
	//CameraViewController	*cameraViewController;
}

@property(nonatomic, retain) IBOutlet UITextField	*twtName;
@property(nonatomic, retain) IBOutlet UITextField	*twtPW;
@property(nonatomic, retain) IBOutlet UITextField	*email;
//@property(nonatomic, retain) CameraViewController *cameraViewController;

- (IBAction) back:(id) sender;
- (IBAction) hideKeyBoard:(id) sender;

- (void) saveInfo;

@end
