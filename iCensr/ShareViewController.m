//
//  ShareViewController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ShareViewController.h"


@implementation ShareViewController

@synthesize back, submit, twtPic, twtName, twtPW, twtMessage, alertViewController, willShareOnTwitter, willSaveInAlbum, willSubmitToNCAC, uploadingView, uploadingSpinner;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	NSLog(@"INIT WITH NIB NAME called");
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		twtPic.userInteractionEnabled = NO;
		twtPic.exclusiveTouch = NO;
    }
	
    return self;
}
/*
- (void)viewWillAppear:(BOOL)animated {
	NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
	twtName.text = name;
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
	twtPW.text = password;
}
*/

- (void) setAlertViewController:(AlertViewController*)newAlertViewController {
	alertViewController = newAlertViewController;
}

- (void) setImage:(UIImage *)picture {
	NSLog(@"SET IMAGE called");
	twtPic.image = picture;
	
	// piggy backing to set user default name and password
	NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
	twtName.text = name;
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
	twtPW.text = password;
	
	//switch tweet off if there is not name and password
	if(![alertViewController isSignedInWithName:twtName.text andPassword:twtPW.text]) {
		[self.willShareOnTwitter setOn:NO animated:NO]; 
	}
	
	//hiding uploading view
	[uploadingSpinner stopAnimating];
	uploadingView.hidden = YES;
}

#pragma mark share action methods

- (IBAction) share:(id)sender {
	NSLog(@"SHARE called");
	
	NSInteger *operationsCount = 0;
	
	[self disableFurtherInput];
	BOOL uploadedSomething = NO;
	// hide keyboard
	//[twtName resignFirstResponder];
	
	// submit picture and text to Twitter
    //NSString *username = twtName.text;
    //NSString *password = twtPW.text;
	
	// if selected, share on Twitter
	if(self.willShareOnTwitter.on) {
		operationsCount++;
		NSLog(@"WILL SHARE ON TWITTER selected");
		NSString *name = twtName.text;
		[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
		NSString *pw = twtPW.text;
		[[NSUserDefaults standardUserDefaults] setObject:pw forKey:@"password"];
		
		//alertViewController = [[AlertViewController alloc] init];
		if([alertViewController isSignedInWithName:twtName.text andPassword:twtPW.text]) {
			NSLog(@"IS SIGNED IN succeded");
			[alertViewController uploadPicture:twtPic.image withText:twtMessage.text];
			[alertViewController checkContent];
		}
		else {
			NSLog(@"IS SIGNED IN failed");
			[alertViewController uploadPicture:twtPic.image withText:twtMessage.text];
			[alertViewController askForLoginInfo];
		}
		uploadedSomething = YES;
	}
	
	// if selected, submit to NCAC
	if(self.willSubmitToNCAC.on) {
		//operationsCount++;
		NSLog(@"WILL SUBMIT TO NCAC selected");
		NSData *imageData = UIImageJPEGRepresentation(twtPic.image, 90);
		[self upload2site:imageData];
		
		//uploadedSomething = YES;
	}
	
	if(self.willSaveInAlbum.on) {
		//operationsCount++;
		NSLog(@"WILL SAVE IN ALBUM selected");
		UIImageWriteToSavedPhotosAlbum(twtPic.image, nil, nil, nil);//self, (SEL)@selector(image:didFinishSavingWithError:contextInfo:), nil); 
		
		//uploadedSomething = YES;
	}
    // if nothing was uploaded, free the screen commands
	if(!uploadedSomething) {
		[self enableFurtherInput];
	}
	[self setOperations:operationsCount];
	NSLog(@"SHARE complete");
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
	// fill in announcement here
	NSLog(@"DID FINISH SAVING WITH ERROR called: @%", error);
}

- (void) upload2site:(NSData *)picture {
	NSLog(@"UPLOAD 2 SITE called");
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
	[self operationCompleted];
	NSLog(@"UPLOAD 2 SITE finished");
}

- (IBAction)back:(id) sender {
	[self curlUpScreen];
	self.view.hidden = YES;
}

- (void) backToEditor {
	[self curlUpScreen];
	self.view.hidden = YES;
}

- (IBAction) hideKeyBoard:(id) sender {
	[twtName resignFirstResponder];
}

/*- (void)textViewDidEndEditing:(UITextView *)textView {
	[twtMessage resignFirstResponder];
}*/

#pragma mark MGTwitterEngineDelegate methods

/*
- (void)requestSucceeded:(NSString *)requestIdentifier
{
    NSLog(@"Request succeeded (%@)", requestIdentifier);
	
	// save settings
	NSString *name = twtName.text;
	[[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
	NSString *pw = twtPW.text;
	[[NSUserDefaults standardUserDefaults] setObject:pw forKey:@"password"];
	
	// return to camera view
	[[self parentViewController] view].hidden = YES;
	self.view.hidden = YES;
}


- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
    NSLog(@"Twitter request failed! (%@) Error: %@ (%@)", 
          requestIdentifier, 
          [error localizedDescription], 
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	// send alert asking for name and password
	UIAlertView *prompt = [UIAlertView alloc];
	prompt = [prompt initWithTitle:@"Connection Failed" message:@"iCensr could not reach Twitter.  Check your name and password." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[prompt show];
	[prompt release];
}


- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier
{
    NSLog(@"Got statuses:\r%@", statuses);
}


- (void)directMessagesReceived:(NSArray *)messages forRequest:(NSString *)identifier
{
    NSLog(@"Got direct messages:\r%@", messages);
}


- (void)userInfoReceived:(NSArray *)userInfo forRequest:(NSString *)identifier
{
    NSLog(@"Got user info:\r%@", userInfo);
}


- (void)miscInfoReceived:(NSArray *)miscInfo forRequest:(NSString *)identifier
{
	NSLog(@"Got misc info:\r%@", miscInfo);
} */

#pragma mark moving screen for keyboard
// the amount of vertical shift upwards keep the Notes text view visible as the keyboard appears
#define kOFFSET_FOR_KEYBOARD					140.0

// the duration of the animation for the view shift
#define kVerticalOffsetAnimationDuration		0.50

/*- (IBAction)textFieldDoneEditing:(id)sender {
	NSLog(@"TEXT FIELD DONE EDITING called");
	[sender resignFirstResponder];
}*/

/*- (IBAction)backgroundClick:(id)sender
{
	NSLog(@"BACKGROUND CLICK called");
	//[latitudeField resignFirstResponder];
	//[longitudeField resignFirstResponder];
	//[notesField resignFirstResponder];
	
	if (viewShifted)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:kVerticalOffsetAnimationDuration];
		
		CGRect rect = self.view.frame;
		rect.origin.y += kOFFSET_FOR_KEYBOARD;
		rect.size.height -= kOFFSET_FOR_KEYBOARD;
		self.view.frame = rect;
		
		[UIView commitAnimations];
		
		viewShifted = FALSE;
	}		
}*/

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
	NSLog(@"TEXT VIEW SHOULD BEGIN EDITING called");
	/*
	if (!viewShifted) {		// don't shift if it's already shifted
		NSLog(@"VIEW SHOULD BEGIN EDITING called");
		
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:kVerticalOffsetAnimationDuration];
		
		CGRect rect = self.view.frame;		
		rect.origin.y -= kOFFSET_FOR_KEYBOARD;
		rect.size.height += kOFFSET_FOR_KEYBOARD;
		self.view.frame = rect;
		
		[UIView commitAnimations];
		
		viewShifted = TRUE;
	}*/
	return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
	NSLog(@"TEXT VIEW SHOULD END EDITING called");
	[twtMessage resignFirstResponder];
	return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView {
	NSLog(@"TEXT VIEW DID END EDITING called");
	[twtMessage resignFirstResponder];
}

#pragma mark default code

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)disableFurtherInput {
	NSLog(@"DISABLE FURTHER INPUT called");
	// show uploading animation
	[uploadingSpinner startAnimating];
	uploadingView.hidden = NO;
	// disable buttons
	willShareOnTwitter.enabled = NO;
	willSubmitToNCAC.enabled = NO;
	willSaveInAlbum.enabled = NO;
	// change text for back button to "Cancle"

	NSLog(@"DISABLE FURTHER INPUT finished");
}

- (void)enableFurtherInput {
	NSLog(@"ENABLE FURTHER INPUT called");
	
	// return text for back button to "Back"
	// enable buttons
	willShareOnTwitter.enabled = YES;
	willSubmitToNCAC.enabled = YES;
	willSaveInAlbum.enabled = YES;
	
	// hide uploading animation
	[uploadingSpinner stopAnimating];
	uploadingView.hidden = YES;
	//[alertViewController release];
}

- (void)setOperations:(NSInteger *)operations {
	operationsToComplete = operations;
}

- (NSInteger)operationsLeft {
	return operationsToComplete;
}

- (void)operationCompleted {
	operationsToComplete--;
	if(operationsToComplete <= 0) {
		[self enableFurtherInput];
	}
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

- (void)dealloc {
	//[twitterEngine release];
	//[alertViewController release];
    [super dealloc];
}


@end
