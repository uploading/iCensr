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
    AboutViewController *aboutViewController;
	EditorViewController *editorViewController;
	
	UIWindow	*window;
	UIImagePickerController* imagePickerController;
	UIImagePickerController* imageTakerController;
	UIImageView* imageView;
    SplashViewController *viewController;
}

@property(nonatomic,retain) AboutViewController *aboutViewController;
@property(nonatomic,retain) EditorViewController *editorViewController;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashViewController *viewController;
@property(nonatomic,retain) UIImagePickerController *imagePickerController;
@property(nonatomic,retain) UIImagePickerController *imageTakerController;

//- (void)swapInViewAspectWithIdentifier:(NSString *)key;
- (void)applicationDidFinishLaunching:(UIApplication *)application;
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
				  editingInfo:(NSDictionary *)editingInfo;
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

- (IBAction)aboutICensr:(id) sender;
- (IBAction)grabImage:(id)sender;

@end