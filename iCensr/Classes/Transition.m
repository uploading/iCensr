//
//  Transition.m
//  iCensr
//
//  Created by Elizabeth Fuller on 7/2/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Transition.h"


@implementation Transition

- (void)curlUpView:(UIView *)view {
	//self.shareViewController.view.hidden = NO;
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	//[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	//self.aboutViewController.view.origin.x = 0;	//fades the alpha channel of this view to "0.0" over the animation
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:view cache:YES];
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}

- (void)curlDownView:(UIView *)view {
	view.hidden = NO;
	[UIView beginAnimations:nil context:nil]; //begins animation block
	[UIView setAnimationDuration:0.75];			// sets animation duration
	[UIView setAnimationDelegate:self];			// sets delegate for this block
	//[UIView	setAnimationDidStopSelector:@selector(finishedFading)];	// calls the finishedFading
	//self.aboutViewController.view.origin.x = 0;	//fades the alpha channel of this view to "0.0" over the animation
	[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:view cache:YES];
	[UIView commitAnimations]; //commicts the animation block.  This block is done.
}

@end
