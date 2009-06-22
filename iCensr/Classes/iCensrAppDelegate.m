//
//  iCensrAppDelegate.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iCensrAppDelegate.h"
//#import "iCensrViewController.h"

@implementation iCensrAppDelegate

@synthesize window;
@synthesize viewController, aboutViewController, editorViewController, imagePickerController, imageTakerController;
/*
- (void)swapInViewAspectWithIdentifier:(NSString *)key {

	
	//SEL *viewController = [aspectControllers objectForKey:key];
	UIResponder *view = [viewController view];
	
	// now, do stuff with the view, such as making it the current subview of the window
}
*/
- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    NSLog(@"________________________________DELEGATE SCREEN LOADED___________________________");
	/*
	UIViewController *myContentController = [[UIViewController alloc] init];
	UINavigationController *presentModalViewController = [[UINavigationController alloc] initWithRootViewController: myContentController];
	
	// self is a UIViewController
	myContentController.cameraViewController = self;
	[self presentModalViewController: presentModalViewController animated: YES];
	*/
	// Create window
    /*self.window = [[[UIWindow alloc]
					initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];	
	
	UIImagePickerController *picker;
	picker = [[UIImagePickerController alloc] init];
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	picker.delegate = self;*/
	//[picker.delegate presentModalViewController:picker animated:NO];
	//[window addSubview:picker.view];
	//[picker release];
	
	/*
    self.window = [[[UIWindow alloc]
					initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	
    // Set up the image picker controller and add it to the view
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = 
	UIImagePickerControllerSourceTypePhotoLibrary;
    [window addSubview:imagePickerController.view];
	
    // Set up the image view and add it to the view but make it hidden
    imageView = [[UIImageView alloc] initWithFrame:[window bounds]];
    imageView.hidden = YES;
    [window addSubview:imageView];
	
    [window makeKeyAndVisible];
	*/
	
	
	// SPLASH SCREEN LOAD
	viewController = [[SplashViewController alloc] init];
	
	//populate NSDictionary
	//[aspectControllers setValue:@"SignUpViewController" forKey:@"SignUpView"];
	
    // Override point for customization after app launch    
    [window addSubview:[viewController view]];
    [window makeKeyAndVisible];
	 
}

- (IBAction)grabImage:(id)sender {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.allowsImageEditing = YES;
    [self presentModalViewController:picker animated:YES];
	/*
	NSLog(@"GRAB IMAGE pressed");
	
	imagePickerController =[[UIImagePickerController alloc] init];
	imagePickerController.delegate = self;
	imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
	[self  presentModalViewController: imagePickerController animated: YES];
	 */
	/*
	// Create window
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] &&
		[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary]) {
		imageTakerController = [[UIImagePickerController alloc] init];
		 imageTakerController.delegate = self;
		 imageTakerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		 [window addSubview:imageTakerController.view];
	*/
	/*self.imagePickerController = [[UIImagePickerController alloc] init];
	 //self.imagePickerController.allowsImageEditing = YES;
	 self.imagePickerController.delegate = self;
	 self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	 */
	//[imagePickerController release];
	
	// Set up the image view and add it to the view but make it hidden
	/*imageView = [[UIImageView alloc] initWithFrame:[window bounds]];
	imageView.hidden = YES;
	[window addSubview:imageView];		
	}*/
    //[self presentModalViewController:self.imagePickerController animated:YES];
	NSLog(@"+++++ Image Grabbed ++++++++");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
	 //open share editor controller
	 if(self.editorViewController == nil) {
	 EditorViewController *newView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:[NSBundle mainBundle]];
	 self.editorViewController = newView;
	 [newView release];
	 NSLog(@"_____________if statement run_____________");
	 [window addSubview:editorViewController.view];
	 }
	 
	 [editorViewController setPic:img];
	 
	 //image.image = img;
	 [[picker parentViewController] dismissModalViewControllerAnimated:YES];
	 //upload.enabled = YES;
}
/*
// from PickImageAppDelegate.m
- (void)imagePickerController:(UIImagePickerController *)picker 
		didFinishPickingImage:(UIImage *)image
				  editingInfo:(NSDictionary *)editingInfo
{
    // Dismiss the image selection, hide the picker and
    //show the image view with the picked image
    [picker dismissModalViewControllerAnimated:YES];
    imagePickerController.view.hidden = YES;
    imageView.image = image;
    imageView.hidden = NO;
    [window bringSubviewToFront:imageView];
}
*/
- (IBAction) aboutICensr:(id) sender {
	NSLog(@"__________transition to iCensr Info___________");
	AboutViewController *newView = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:nil];
	self.aboutViewController = newView;
	[newView release];
	NSLog(@"_____________if statement run_____________");
	[window addSubview:self.aboutViewController.view];
	//[window pushViewController:aboutViewController animated:YES];
}

// from PickImageAppDelegate.m
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    // Dismiss the image selection and close the program
    [picker dismissModalViewControllerAnimated:YES];
    exit(0);
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
