//
//  EditorViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewController.h"

@interface EditorViewController : UIViewController {
	ShareViewController		*shareViewController;
}
@property(nonatomic, retain) ShareViewController *shareViewController;

- (IBAction) renderImage:(id)sender;

@end
