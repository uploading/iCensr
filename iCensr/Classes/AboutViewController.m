//
//  AboutViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"


@implementation AboutViewController

@synthesize twtName, twtPW, email;// cameraViewController;

- (IBAction) back:(id) sender {
	NSLog(@"__________back called___________");
	/*if(self.censrSequenceViewController == nil) {
		CensrSequenceViewController *newView = [[CensrSequenceViewController alloc] initWithNibName:@"CensrSequenceView" bundle:[NSBundle mainBundle]];
		self.censrSequenceViewController = newView;
		[newView release];
		NSLog(@"_____________if statement run_____________");
	}
	[self.view addSubview:censrSequenceViewController.view]; */
	[self saveInfo];
	self.view.hidden = YES;
}


/*
- (void)viewWillAppear:(BOOL)animated {
	NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
	twtName.text = name;
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
	twtPW.text = password;
	NSString *eM = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
	email.text = eM;
}
*/

/*
- (void)viewWillDisappear:(BOOL)animated
{
	NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
	NSString *password = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
	NSString *em = email.text;
	[[NSUserDefaults standardUserDefaults] setObject:em forKey:@"email"];
}
 */

- (IBAction) hideKeyBoard:(id) sender {
	[twtName resignFirstResponder];
}

- (IBAction) save:(id) sender {
	[self saveInfo];
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
	NSUserDefaults *login = [NSUserDefaults standardUserDefaults];
	NSString *name = [login stringForKey:@"name"];
	twtName.text = name;
	NSString *password = [login stringForKey:@"password"];
	twtPW.text = password;
	NSString *eM = [login stringForKey:@"email"];
	email.text = eM;
	
    [super viewDidLoad];
}

- (void)saveInfo {
	NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
	NSString *password = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
	NSString *em = email.text;
	[[NSUserDefaults standardUserDefaults] setObject:em forKey:@"email"];
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
