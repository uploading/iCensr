//
//  AboutViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/25/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"


@implementation AboutViewController

@synthesize twtName, twtPW, email;

- (IBAction) back:(id) sender {
	NSLog(@"__________back called___________");
	[self saveInfo];
	self.view.hidden = YES;
}


- (IBAction) hideKeyBoard:(id) sender {
	[twtName resignFirstResponder];
}

- (IBAction) save:(id) sender {
	[self saveInfo];
}

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
	// if the email is different from what was saved before, submit email to NCAC
	NSString *pastEmail = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
	if ([pastEmail isEqualToString:email.text]) {
		NSLog(@"email changed");
		// send email address to NCAC mailing list
	}
	// save changed values
	NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
	NSString *password = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
	NSString *em = email.text;
	[[NSUserDefaults standardUserDefaults] setObject:em forKey:@"email"];
}

- (void)curlDownView
{
	//self.aboutViewController.view.hidden = NO;
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	//[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	//self.aboutViewController.view.origin.x = 0;	//fades the alpha channel of this view to "0.0" over the animation
	//NSArray *controllers = self.viewControllers;
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
