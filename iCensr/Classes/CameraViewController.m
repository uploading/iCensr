//
//  CameraViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


@implementation CameraViewController

@synthesize aboutViewController, editorViewController, albumViewController, imagePicker, imageTaker;

- (IBAction) aboutICensr:(id) sender {
	NSLog(@"__________transition to iCensr Info___________");
	 if(self.aboutViewController == nil) {
		 AboutViewController *newView = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:[NSBundle mainBundle]];
		 self.aboutViewController = newView;
		 [newView release];
		 NSLog(@"_____________if statement run_____________");
		 [self.view addSubview:aboutViewController.view];
	 }
	 else {
		 aboutViewController.view.hidden = NO;
	 }
}

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

- (IBAction)uploadImage {
	/*
	 turning the image into a NSData object
	 getting the image back out of the UIImageView
	 setting the quality to 90
	 */
	NSData *imageData = UIImageJPEGRepresentation(image.image, 90);
	[self upload2twitpic:imageData];
	[self upload2site:imageData];
}

- (void) upload2twitpic:(NSData *)picture {
	// upload to twitpic with Canary app
	ORSTwitPicDispatcher *twitPicDispatcher = [[ORSTwitPicDispatcher alloc] init];
	[twitPicDispatcher uploadData:picture withUsername:@"iCensr" password:@"pic2process" filename:@"censrd"];
}

- (void) upload2site:(NSData *)picture {
	// setting up the URL to post to
	NSString *urlString = @"http://www.itp.efuller.net/09summer/icensr/support/uploader.php";
	
	//setting up the request object now
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	
	/*
	 add some header info now
	 we always need a boundary when we post a file
	 also we need to set the content type
	 
	 You might want to generate a random boundary.. this is just the same 
	 as my output from wireshark on a valid html post
	 */
	NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
	[request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	
	// create the body of the post
	
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"ipodfile.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[NSData dataWithData:picture]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	// setting the body of the post to the request
	[request setHTTPBody:body];
	
	// now lets make the connection to the web
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
	
	NSLog(returnString);
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
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
    [super dealloc];
}


@end
