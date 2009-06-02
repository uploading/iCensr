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
#import "AlbumViewController.h"
#import "ORSTwitPicDispatcher.h"

@interface CameraViewController : UIViewController {
	AboutViewController *aboutViewController;
	EditorViewController *editorViewController;
	AlbumViewController *albumViewController;
	
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
@property(nonatomic,retain) AlbumViewController *albumViewController;

@property(nonatomic,retain) UIImagePickerController *imagePicker;
@property(nonatomic,retain) UIImagePickerController *imageTaker;

- (IBAction)grabImage;
- (IBAction)takeImage;

// uploading methods for pictures
- (IBAction)uploadImage;
- (void) upload2twitpic:(NSData *)picture;
- (void) upload2site:(NSData *)picture;

- (IBAction) aboutICensr:(id) sender;
- (IBAction) takePicture:(id) sender2;
- (IBAction) selectFromAlblum:(id) sender3;

@end
