//
//  iCensrViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SignUpViewController.h"

@implementation SignUpViewController

@synthesize twtName, twtPW, email, censrSequenceViewController;

- (IBAction) submit:(id) sender {
	NSLog(@"_______________________%@ transfered to sequence view__________________________",twtName.text);
	if(self.censrSequenceViewController == nil) {
		CensrSequenceViewController *view2 = [[CensrSequenceViewController alloc] initWithNibName:@"CensrSequenceView" bundle:[NSBundle mainBundle]];
		self.censrSequenceViewController = view2;
		[view2 release];
		NSLog(@"_____if statement run___");
	}
	[self.view addSubview:censrSequenceViewController.view];
	//[self.navigationController pushViewController:self.censrSequenceViewController animated:YES];
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
