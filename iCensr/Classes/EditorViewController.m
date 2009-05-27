//
//  EditorViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EditorViewController.h"
#import "ShareViewController.h"

@implementation EditorViewController

@synthesize shareViewController;

- (IBAction) renderImage:(id)sender {
	NSLog(@"____________render image____________");
	if(self.shareViewController == nil) {
		ShareViewController *newView = [[ShareViewController alloc] initWithNibName:@"ShareView" bundle:[NSBundle mainBundle]];
		self.shareViewController = newView;
		[newView release];
		NSLog(@"_____________if statement run_____________");
	}
	[self.view addSubview:shareViewController.view];
}

- (IBAction) cancelEdit:(id)sender {
	NSLog(@"_____________return to camera view________________");
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
