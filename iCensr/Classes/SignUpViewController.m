//
//  iCensrViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SignUpViewController.h"

@implementation SignUpViewController

@synthesize twtName, twtPW, email, cameraViewController;

- (IBAction) submit:(id) sender {
	NSLog(@"_______________________%@ transfered to sequence view__________________________",twtName.text);
	if(self.cameraViewController == nil) {
		CameraViewController *view2 = [[CameraViewController alloc] initWithNibName:@"CameraView" bundle:[NSBundle mainBundle]];
		self.cameraViewController = view2;
		[view2 release];
		NSLog(@"_____if statement run___");
		
		NSString *name = twtName.text;
		[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
		NSString *password = twtPW.text;
		[[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
		NSString *em = email.text;
		[[NSUserDefaults standardUserDefaults] setObject:em forKey:@"email"];

	}
	[self.view addSubview:cameraViewController.view];
	//[self.navigationController pushViewController:self.censrSequenceViewController animated:YES];
}

- (IBAction) hideKeyBoard:(id) sender {
	[twtName resignFirstResponder];
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
