//
//  ShareViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGTwitterEngine.h"
//#import "EditorViewController.h"

@interface ShareViewController : UIViewController {
	IBOutlet UITextField	*twtName;	// user's twitter ID
	IBOutlet UITextField	*twtPW;		// user's twitter password
	IBOutlet UITextView		*twtMessage;		// user's email address
	IBOutlet UISwitch		*willShare;	// send the edit and text to the NCAC site
	MGTwitterEngine			*twitterEngine; //class to connect and post to twitter
}

@property(nonatomic,retain)	IBOutlet UITextField	*twtName;	// user's twitter ID
@property(nonatomic,retain) IBOutlet UITextField	*twtPW;		// user's twitter password
@property(nonatomic,retain) IBOutlet UITextView		*twtMessage;		// user's email address
@property(nonatomic,retain) IBOutlet UISwitch		*willShare;

- (IBAction) share:(id)sender;
- (IBAction) hideKeyBoard:(id) sender;
- (IBAction) hideViewKeyBoard:(id) sender;

@end
