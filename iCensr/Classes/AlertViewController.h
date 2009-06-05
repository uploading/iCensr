//
//  AlertViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 6/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGTwitterEngine.h"

@interface AlertViewController : UIViewController {
	// fields for login alert box
	IBOutlet UIAlertView	*signinAlertView;
	IBOutlet UITextField	*twtName;
	IBOutlet UITextField	*twtPW;
	MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
}

@property(nonatomic,retain) IBOutlet UIAlertView *signinAlertView;
@property(nonatomic,retain) IBOutlet UITextField *twtName;
@property(nonatomic,retain) IBOutlet UITextField *twtPW;

// login related functions
- (BOOL) isSignedIn;
- (void) askForLoginInfo;
- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void) checkContent;
- (void) checkConnection;
- (void) saveValues;

- (UITextField*)addTextFieldWithValue:(NSString*)value label:(NSString*)label;
- (UITextField*)textFieldAtIndex:(NSUInteger)index;
- (NSUInteger)textFieldCount;
- (UITextField*)textField;

@end
