//
//  CameraViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


@implementation CameraViewController

@synthesize aboutViewController, editorViewController, imagePicker, imageTaker; //, alertViewController, twtName, twtPW, signinAlertView;

- (IBAction) aboutICensr:(id) sender {
	NSLog(@"__________transition to iCensr Info___________");
	if(aboutViewController == nil) {
		 AboutViewController *newView = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:[NSBundle mainBundle]];
		 self.aboutViewController = newView;
		 [newView release];
		 NSLog(@"_____________if statement run_____________");
		 [self.view addSubview:aboutViewController.view];
	}
	else {
		self.aboutViewController.view.hidden = NO;
	}
		 //[self.navigationController pushViewController:self.aboutViewController animated:YES];
}

- (void)viewDidLoad {
	// setup navigation controller
	//navigationController = [[UINavigationController alloc] init];

	//[self.view addSubview:navigationController.view];
	// disable incompatable buttons (no camera button if there is no camera
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		camera.enabled = NO;
	}
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		album.enabled = NO;
	}
	/*
	self.imagePicker = [[UIImagePickerController alloc] init];
	self.imagePicker.allowsImageEditing = YES;
	self.imagePicker.delegate = self;
	self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	self.imageTaker = [[UIImagePickerController alloc] init];
	self.imageTaker.allowsImageEditing = YES;
	self.imageTaker.delegate = self;
	self.imageTaker.sourceType = UIImagePickerControllerSourceTypeCamera;
	
	[super viewDidLoad];
	 */
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
	
	/*
	// save or use image here
	NSLog(@"navigating to EDITOR VIEW");
	// create an instrance of Editor View
	EditorViewController *nextView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:nil];
	NSLog(@"navigationController %@", self.navigationController);
	[self.navigationController pushViewController:nextView animated:NO];
	// set picture to be edited
	[nextView setPic:image];
	// release the controller, navigation contrtoller is retaining it
	[nextView release];*/
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
	//Dismiss the imae picker
	[self dissmissModalViewControllerAnimated:YES];
	[picker release];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	//[alertViewController release];
    [super dealloc];
}

// for editing purposes only
- (IBAction) toEditor:(id)sender {
	if(self.editorViewController == nil) {
		EditorViewController *newView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:[NSBundle mainBundle]];
		self.editorViewController = newView;
		[newView release];
		NSLog(@"_____________if statement run_____________");
		[self.view addSubview:editorViewController.view];
	}
	else {
		self.editorViewController.view.hidden = NO;
	}
	/*
	// save or use image here
	NSLog(@"navigating to EDITOR VIEW");
	// create a navigation controller
	UINavigationController *navigationController = [[UINavigationController alloc] init];
	// create an instrance of Editor View
	EditorViewController *nextView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:nil];
	NSLog(@"navigationController %@", navigationController);
	[navigationController pushViewController:nextView animated:YES];
	// set picture to be edited
	[nextView setPic:nil];
	// release the controller, navigation contrtoller is retaining it
	[nextView release];
	// Add the navigation controller's view to the view
	[self.view addSubview:navigationController.view];
	
	//[editorViewController setPic:nil];
	*/
}

@end
