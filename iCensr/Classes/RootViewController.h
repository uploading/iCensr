//
//  iCensrViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CensrSequenceViewController.m.h"

@interface RootViewController : UIViewController {
	IBOutlet UITextField	*twtName;	// user's twitter ID
	IBOutlet UITextField	*twtPW;		// user's twitter password
	IBOutlet UITextField	*email;		// user's email address
	//CensrSequenceViewController		*nextViewController;
}

@property(nonatomic, retain) IBOutlet UITextField	*twtName;
@property(nonatomic, retain) IBOutlet UITextField	*twtPW;
@property(nonatomic, retain) IBOutlet UITextField	*email;
//@property(nonatomic, retain) CensrSequenceViewController		*nextViewController;


- (IBAction) submit:(id) sender;

@end