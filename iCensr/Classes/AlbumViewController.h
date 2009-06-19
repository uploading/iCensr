//
//  AlbumViewController.h
//  iCensr
//
//  Created by Elizabeth Fuller on 5/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditorViewController.h"

@interface AlbumViewController : UIViewController {
	EditorViewController *editorViewController;
}

@property(nonatomic,retain) EditorViewController	*editorViewController;

- (IBAction) toEditor:(id)sender;
- (IBAction) back:(id)sender;

@end
