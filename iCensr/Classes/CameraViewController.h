//
//  CameraViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutViewController.h"
#import "EditorViewController.h"

@interface CameraViewController : UIViewController {
	AboutViewController *aboutViewController;
	EditorViewController *editorViewController;
}

@property(nonatomic,retain) AboutViewController *aboutViewController;
@property(nonatomic,retain) EditorViewController *editorViewController;

- (IBAction) aboutICensr:(id) sender;
- (IBAction) takePicture:(id) sender2;

@end
