//
//  iCensrViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "iCensrViewController.h"

@implementation iCensrViewController

@synthesize twtName, twtPW, email;

- (IBAction) submit:(id) sender {
	NSLog(@"_______________________%@__________________________",twtName.text);
	//[self.view removeFromSuperview];
	//nextViewController = [[CensrSequenceViewController alloc] initWithNibName:@"CensrSequenceViewController" bundle:[NSBundle mainBundle]];
	//NSLog(@"__________________VIEW CONTROLLER CREATED____________________");
	//[self.view addSubview:nextViewController.view];
	//NSLog(@"__________________VIEW ADDED________________________");
	//[self.view removeFromSuperview];
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
