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
	IBOutlet UITextField	*twtName;	// user name for Twitter account
	IBOutlet UITextField	*twtPW;		// user password for Twitter account
	IBOutlet UITextField	*email;		// user email for recieving NCAC announcements
	
	//CameraViewController	*cameraViewController;
}

@property(nonatomic, retain) IBOutlet UITextField	*twtName;
@property(nonatomic, retain) IBOutlet UITextField	*twtPW;
@property(nonatomic, retain) IBOutlet UITextField	*email;

- (IBAction) back:(id) sender;			// take user back to camera view
- (IBAction) hideKeyBoard:(id) sender;	// hide keyboard after done typing
- (void) saveInfo;						// save name, password, and email
// establish communication to Camera View Controller
//- (void) setCameraViewController:(CameraViewController*)newCameraViewController;

@end
