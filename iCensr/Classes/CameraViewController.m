//
//  CameraViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


@implementation CameraViewController

@synthesize aboutViewController, editorViewController, timer, imagePicker, imageTaker; //, alertViewController, twtName, twtPW, signinAlertView;

- (IBAction) aboutICensr:(id) sender {
	NSLog(@"ABOUT iCENSR called");
	if(aboutViewController == nil) {
		 AboutViewController *newView = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:[NSBundle mainBundle]];
		 self.aboutViewController = newView;
		 [newView release];
		//[aboutViewController setCameraViewController:self];
		//[aboutViewController initWithNibName:@"AboutView" bundle:[NSBundle mainBundle]];
		 NSLog(@"_____________if statement run_____________");
		 [self.view addSubview:self.aboutViewController.view];
		self.aboutViewController.view.hidden = YES;
		timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(slideScreen) userInfo:nil repeats:NO];
	}
	else {
		//self.aboutViewController.view.hidden = NO;
		[self slideScreen];
	}
	//self.aboutViewController.view.origin.x = 230;
	//[self slideScreen];
	NSLog(@"ABOUT iCENSR complete");
}

- (void)viewDidLoad {
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		camera.enabled = NO;
	}
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		album.enabled = NO;
	}
}

- (IBAction)pickImage:(id)sender {
	NSLog(@"PICK IMAGE called");
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		UIImagePickerController* picker = [[UIImagePickerController alloc] init];
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		picker.delegate = self;
		
		[self presentModalViewController:picker animated:YES];
	}
}

- (IBAction)takeImage:(id)sender {
	NSLog(@"TAKE IMAGE called");
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		UIImagePickerController* picker = [[UIImagePickerController alloc] init];
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		picker.delegate = self;
		
		[self presentModalViewController:picker animated:YES];
	}
}

- (void)imagePickerController:(UIImagePickerController*)picker
		didFinishPickingImage:(UIImage*)image editingInfo:(NSDictionary*)editingInfo {
	// set up editor

	if(self.editorViewController == nil) {
		EditorViewController *newView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:[NSBundle mainBundle]];
		self.editorViewController = newView;
		[newView release];
		[self.view addSubview:editorViewController.view];
	}
	else {
		self.editorViewController.view.hidden = NO;
	}
	
	[editorViewController setPic:image];
	
	// Dismiss the image picker
	[self dismissModalViewControllerAnimated:YES];
	[picker release];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker {
	//Dismiss the image picker
	[self dismissModalViewControllerAnimated:YES];
	[picker release];
}

#pragma mark TRANSITION

// call to fade out splash view
- (void)slideScreen
{
	self.aboutViewController.view.hidden = NO;
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	//[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	//self.aboutViewController.view.origin.x = 0;	//fades the alpha channel of this view to "0.0" over the animation
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:aboutViewController.view cache:YES];
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}

/*- (void) setAboutViewController:(AboutViewController*)newAboutViewController {
	aboutViewController = newAboutViewController;
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	//[alertViewController release];
    [super dealloc];
}

@end
