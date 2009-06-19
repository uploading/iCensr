//
//  CameraViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "AboutViewController.h"
#import "EditorViewController.h"
#import "ORSTwitPicDispatcher.h"
//#import "MGTwitterEngine.h"
//#import "AlertViewController.h"


@interface CameraViewController : UIViewController {
	AboutViewController *aboutViewController;
	EditorViewController *editorViewController;
	
	//settings for buttons and views
	UIImagePickerController *imagePicker; // for use with the album
	UIImagePickerController *imageTaker; // for use with the camera
    IBOutlet UIBarItem *album; // button sending user to the album
	IBOutlet UIBarItem *camera; // button sending user to the camer
	IBOutlet UIBarItem *upload; // button allowing user to upload the image
    IBOutlet UIImageView *image; // image of the item
}

@property(nonatomic,retain) AboutViewController *aboutViewController;
@property(nonatomic,retain) EditorViewController *editorViewController;

@property(nonatomic,retain) UIImagePickerController *imagePicker;
@property(nonatomic,retain) UIImagePickerController *imageTaker;

- (IBAction) grabImage;
- (IBAction) takeImage;
- (IBAction) aboutICensr:(id) sender;

// for debugging purposes
- (IBAction) toEditor:(id)sender;


@end
