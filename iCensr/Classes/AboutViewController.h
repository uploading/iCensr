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
	IBOutlet UITextView		*twtName;
	IBOutlet UITextView		*twtPW;
	IBOutlet UITextView		*email;
	//CameraViewController	*cameraViewController;
}

@property(nonatomic, retain) IBOutlet UITextView	*twtName;
@property(nonatomic, retain) IBOutlet UITextView	*twtPW;
@property(nonatomic, retain) IBOutlet UITextView	*email;
//@property(nonatomic, retain) CameraViewController *cameraViewController;

- (IBAction) back:(id) sender;

@end
