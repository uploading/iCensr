//
//  ORSTwitPicController.m
//  iCensr
//
//  Created by Elizabeth Fuller on 6/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ORSTwitPicController.h"


@implementation ORSTwitPicController
/*
// TwitPic functionality

// Action: shows the picture taker to the user
- (IBAction) showPictureTaker:sender {
	IKPictureTaker *pictureTaker = [IKPictureTaker pictureTaker];
	[pictureTaker setValue:[NSNumber numberWithBool:NO]
					forKey:IKPictureTakerShowEffectsKey];
	[pictureTaker setValue:[NSNumber numberWithBool:YES]
					forKey:IKPictureTakerAllowsEditingKey];
	[pictureTaker setValue:[NSNumber numberWithBool:YES]
					forKey:IKPictureTakerAllowsVideoCaptureKey];
	[pictureTaker beginPictureTakerSheetForWindow:self.window
									 withDelegate:self
								   didEndSelector:@selector(
															pictureTakerDidEnd:returnCode:contextInfo:)
									  contextInfo:nil];
}

// This gets called when the picture taker has an output image
- (void) pictureTakerDidEnd:(IKPictureTaker *)picker
				 returnCode:(NSInteger)code
				contextInfo:(void *)contextInfo {
	if (code == NSOKButton) { 
		NSImage *image = [picker outputImage];
		NSData *dataTiffRep = [image TIFFRepresentation];
		NSBitmapImageRep *bitmapRep = [NSBitmapImageRep 
									   imageRepWithData:dataTiffRep];
		NSData *jpegData = [bitmapRep representationUsingType:NSJPEGFileType
												   properties:nil];
		[self executeAsyncCallToTwitPicWithData:jpegData];
	}
}

// Action: This sends an image to TwitPic
- (IBAction) sendImageToTwitPic:sender {
	NSArray *acceptableFileTypes = [NSArray arrayWithObjects:@"jpg", @"jpeg", 
									@"png", @"gif", @"jpe", nil];
	NSOpenPanel *oPanel = [NSOpenPanel openPanel];
	[oPanel setAllowsMultipleSelection:NO];
	int result = [oPanel runModalForDirectory:NSHomeDirectory() 
										 file:nil
										types:acceptableFileTypes];
	if (result = NSOKButton) {
		[self executeAsyncCallToTwitPicWithFile:[oPanel filename]];
	}
}

// This method executes the call to twitpic and adds the resulting url in the
// text field
- (void) executeCallToTwitPicWithFile:(NSString *)filename {
	NSData *imageData = [[NSData alloc] initWithContentsOfFile:filename];
	ORSTwitPicDispatcher *twitPicDispatcher = [[ORSTwitPicDispatcher alloc]
											   init];
	NSString *twitPicURLString = [twitPicDispatcher uploadData:imageData
												  withUsername:twitterEngine.sessionUserID
													  password:twitterEngine.sessionPassword
													  filename:filename];
	
	[self insertStringTokenInNewStatusTextField:twitPicURLString];
	
	NSString *msg = [NSString 
					 stringWithFormat:@"Picture has been sent to Twitpic"];
	[statusBarTextField setStringValue:msg];
	[statusBarImageView setImage:[NSImage imageNamed:@"picture_link"]];
	[statusBarTextField setHidden:NO];
	[statusBarImageView setHidden:NO];
	[statusBarButton setEnabled:NO];
	[statusBarButton setHidden:YES];
	
	messageDurationTimer = [NSTimer 
							scheduledTimerWithTimeInterval:60 
							target:self selector:@selector(hideStatusBar) 
							userInfo:nil repeats:NO];
}

// This method executes the call to twitpic and adds the resulting url in the
// text field
- (void) executeCallToTwitPicWithData:(NSData *)imageData {
	ORSTwitPicDispatcher *twitPicDispatcher = [[ORSTwitPicDispatcher alloc]
											   init];
	NSString *twitPicURLString = [twitPicDispatcher uploadData:imageData
												  withUsername:twitterEngine.sessionUserID
													  password:twitterEngine.sessionPassword
													  filename:@"user_selection.jpeg"];
	
	[self insertStringTokenInNewStatusTextField:twitPicURLString];
	
	NSString *msg = [NSString 
					 stringWithFormat:@"Picture has been sent to Twitpic"];
	[statusBarTextField setStringValue:msg];
	[statusBarImageView setImage:[NSImage imageNamed:@"picture_link"]];
	[statusBarTextField setHidden:NO];
	[statusBarImageView setHidden:NO];
	[statusBarButton setEnabled:NO];
	[statusBarButton setHidden:YES];
	
	messageDurationTimer = [NSTimer 
							scheduledTimerWithTimeInterval:60 
							target:self selector:@selector(hideStatusBar) 
							userInfo:nil repeats:NO];
}

// This method executes the call to twitpic asynchronously and sends the given
// file
- (void) executeAsyncCallToTwitPicWithFile:(NSString *)filename {
	[charsLeftIndicator setHidden:YES];
	[indicator startAnimation:self];
	NSData *imageData = [[NSData alloc] initWithContentsOfFile:filename];
	ORSAsyncTwitPicDispatcher *asyncTwitPicDispatcher = 
	[[ORSAsyncTwitPicDispatcher alloc] init];
	[asyncTwitPicDispatcher uploadData:imageData
						  withUsername:twitterEngine.sessionUserID
							  password:twitterEngine.sessionPassword
							  filename:filename];
	NSString *msg = [NSString 
					 stringWithFormat:@"Sending picture to Twitpic..."];
	[statusBarTextField setStringValue:msg];
	[statusBarImageView setImage:[NSImage imageNamed:@"information"]];
	[statusBarTextField setHidden:NO];
	[statusBarImageView setHidden:NO];
	[statusBarButton setEnabled:NO];
	[statusBarButton setHidden:YES];
}

// This method executes the call to twitpic asynchronously and sends the given
// data
- (void) executeAsyncCallToTwitPicWithData:(NSData *)imageData {
	[charsLeftIndicator setHidden:YES];
	[indicator startAnimation:self];
	ORSAsyncTwitPicDispatcher *asyncTwitPicDispatcher = 
	[[ORSAsyncTwitPicDispatcher alloc] init];
	[asyncTwitPicDispatcher uploadData:imageData
						  withUsername:twitterEngine.sessionUserID
							  password:twitterEngine.sessionPassword
							  filename:@"user_selection.jpeg"];
	NSString *msg = [NSString 
					 stringWithFormat:@"Sending picture to Twitpic..."];
	[statusBarTextField setStringValue:msg];
	[statusBarImageView setImage:[NSImage imageNamed:@"information"]];
	[statusBarTextField setHidden:NO];
	[statusBarImageView setHidden:NO];
	[statusBarButton setEnabled:NO];
	[statusBarButton setHidden:YES];
}

// Prints the TwitPic URL in the status text box (called asynchronously)
- (void) printTwitPicURL:(NSNotification *)note {
	NSString *twitPicURLString = (NSString *)[note object];
	[self insertStringTokenInNewStatusTextField:twitPicURLString];
	
	[indicator stopAnimation:self];
	[charsLeftIndicator setHidden:NO];
	
	NSString *msg = [NSString 
					 stringWithFormat:@"Picture has been sent to Twitpic"];
	[statusBarTextField setStringValue:msg];
	[statusBarImageView setImage:[NSImage imageNamed:@"picture_link"]];
	[statusBarTextField setHidden:NO];
	[statusBarImageView setHidden:NO];
	[statusBarButton setEnabled:NO];
	[statusBarButton setHidden:YES];
	
	messageDurationTimer = [NSTimer 
							scheduledTimerWithTimeInterval:60 
							target:self selector:@selector(hideStatusBar) 
							userInfo:nil repeats:NO];
}
*/
 
@end
