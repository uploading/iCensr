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

@synthesize shareViewController, timer, image, redactor, toolbar;//, transition;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		//self.redactor = [[redactor alloc] initWithFrame
    }
    return self;
}

- (void) setPic:(UIImage *)picture {
	image.image = picture;
	//[redactor setBackgroundImage:picture forState:UIControlStateNormal];
}

// handle touches to draw black lines
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"_______touche!______________");
}

- (IBAction) cancelEdit:(id)sender {
	NSLog(@"_____________return to camera view________________");
	[self curlUpScreen];
	self.view.hidden = YES;
	[redactor clearEdits];
	//[self.image.class clearEdits];
	//[self.view removeFromSuperview];
	//[self.view release];
	//[self.viewCont release];
}

- (IBAction) shareImage:(id)sender {
	UIImage *screenShot = [self render];
	NSLog(@"____________render image____________");
	if(self.shareViewController == nil) {
		ShareViewController *newView = [[ShareViewController alloc] initWithNibName:@"ShareView" bundle:[NSBundle mainBundle]];
		self.shareViewController = newView;
		[newView release];
		NSLog(@"_____________if statement run_____________");
		[self.view addSubview:shareViewController.view];
		
		AlertViewController *alertViewController = [[AlertViewController alloc] init];
		[shareViewController setAlertViewController:alertViewController];
		[alertViewController setShareViewController:shareViewController];
		
		self.shareViewController.view.hidden = YES;
		timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(curlDownScreen) userInfo:nil repeats:NO];

		
		//place image from picture taken in
		/*
		 fetch from app budle
		 [UIImage imageNamed:(NSString*)name]
		 read from file on disk
		 [UIImage initWithContentsOfFile:(NSString *)path]
		 from data in memory
		 [UIImage initWithData:(NSData *)data]
		 */
	}
	//shareViewController.view.hidden = NO;
	else {
		//[transition curlDownView:shareViewController.view];
		[self curlDownScreen];
	}
	
	[shareViewController setImage:screenShot];
}

- (UIImage *) render {
	// conceal toolbar
	self.toolbar.hidden = YES;
	
	// grab full image
	/*UIGraphicsBeginImageContext(image.bounds.size);
	[image.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();*/
	UIGraphicsBeginImageContext(self.view.bounds.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	// reveal toolbar
	self.toolbar.hidden = NO;
	
	// return screenshot
	return viewImage;
}

- (void)curlDownScreen
{
	//[transition curlDownView:shareViewController.view];
	self.shareViewController.view.hidden = NO;
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	//[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	//self.aboutViewController.view.origin.x = 0;	//fades the alpha channel of this view to "0.0" over the animation
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.shareViewController.view cache:YES];
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}

- (void)curlUpScreen
{
	//self.shareViewController.view.hidden = NO;
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	//[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	//self.aboutViewController.view.origin.x = 0;	//fades the alpha channel of this view to "0.0" over the animation
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}


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
