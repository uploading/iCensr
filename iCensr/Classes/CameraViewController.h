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

@interface CameraViewController : UIViewController {
	AboutViewController *aboutViewController;
	EditorViewController *editorViewController;
	AlbumViewController *albumViewController;
}

@property(nonatomic,retain) AboutViewController *aboutViewController;
@property(nonatomic,retain) EditorViewController *editorViewController;
@property(nonatomic,retain) AlbumViewController *albumViewController;

- (IBAction) aboutICensr:(id) sender;
- (IBAction) takePicture:(id) sender2;
- (IBAction) selectFromAlblum:(id) sender3;

@end
