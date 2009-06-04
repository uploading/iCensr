//
//  CameraViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


@implementation CameraViewController

@synthesize aboutViewController, editorViewController, imagePicker, imageTaker, navigationController;

- (IBAction) aboutICensr:(id) sender {
	NSLog(@"__________transition to iCensr Info___________");
		 AboutViewController *newView = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:[NSBundle mainBundle]];
		 self.aboutViewController = newView;
		 [newView release];
		 NSLog(@"_____________if statement run_____________");
		 //[self.view addSubview:aboutViewController.view];
		 [self.navigationController pushViewController:self.aboutViewController animated:YES];
}
/*
- (void)viewDidLoad {
	self.imagePicker = [[UIImagePickerController alloc] init];
	self.imagePicker.allowsImageEditing = YES;
	self.imagePicker.delegate = self;
	self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	self.imageTaker = [[UIImagePickerController alloc] init];
	self.imageTaker.allowsImageEditing = YES;
	self.imageTaker.delegate = self;
	self.imageTaker.sourceType = UIImagePickerControllerSourceTypeCamera;
}
*/
- (IBAction)grabImage {
    [self presentModalViewController:self.imagePicker animated:YES];
	NSLog(@"+++++ Image Grabbed ++++++++");
}

- (IBAction)takeImage {
	[self presentModalViewController:self.imageTaker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
	//open share editor controller
	if(self.editorViewController == nil) {
		EditorViewController *newView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:[NSBundle mainBundle]];
		self.editorViewController = newView;
		[newView release];
		NSLog(@"_____________if statement run_____________");
		[self.view addSubview:editorViewController.view];
	}
	
	[editorViewController setPic:img];
	
	//image.image = img;
	[[picker parentViewController] dismissModalViewControllerAnimated:YES];
	upload.enabled = YES;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self.view addSubview:navigationController.view];
	self.imagePicker = [[UIImagePickerController alloc] init];
	self.imagePicker.allowsImageEditing = YES;
	self.imagePicker.delegate = self;
	self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	self.imageTaker = [[UIImagePickerController alloc] init];
	self.imageTaker.allowsImageEditing = YES;
	self.imageTaker.delegate = self;
	self.imageTaker.sourceType = UIImagePickerControllerSourceTypeCamera;
	
    [super viewDidLoad];
}


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
    [super dealloc];
}


@end
