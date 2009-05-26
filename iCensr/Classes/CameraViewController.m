//
//  CameraViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"


@implementation CameraViewController

@synthesize aboutViewController, editorViewController;

- (IBAction) aboutICensr:(id) sender {
	NSLog(@"__________transition to iCensr Info___________");
	 if(self.aboutViewController == nil) {
	 AboutViewController *newView = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:[NSBundle mainBundle]];
	 self.aboutViewController = newView;
	 [newView release];
	 NSLog(@"_____________if statement run_____________");
	 }
	 [self.view addSubview:aboutViewController.view];
}

- (IBAction) takePicture:(id)sender2 {
	NSLog(@"_________click!__________");
	if(self.editorViewController == nil) {
		EditorViewController *newView = [[EditorViewController alloc] initWithNibName:@"EditorView" bundle:[NSBundle mainBundle]];
		self.editorViewController = newView;
		[newView release];
		NSLog(@"_____________if statement run_____________");
	}
	[self.view addSubview:editorViewController.view];
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
