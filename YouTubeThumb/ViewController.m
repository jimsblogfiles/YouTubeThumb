//
//  ViewController.m
//  YouTubeThumb
//
//  Created by James Border on 6/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "YouTubeThumb.h"

@interface ViewController ()
-(void)simulatorFail;
@end

@implementation ViewController

-(void)simulatorFail {
	
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle: @"App Build:"
						  message: @"Doesn't work in Simulator"
						  delegate: nil
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
	[alert show];
	
}

- (void)viewDidLoad {

    [super viewDidLoad];

	#if TARGET_IPHONE_SIMULATOR
	
	[self simulatorFail];
	return;
	
	#endif
	
	// WILL NOT WORK WITH UPLOADED .FLV FILES!!!
	YouTubeThumb *youTubeThumb = [[YouTubeThumb alloc] initWithURL:@"http://www.youtube.com/watch?v=QodrSfsboFk" frame:CGRectMake(0, 0, 240, 135)];
	[self.view addSubview:youTubeThumb];
	
	youTubeThumb.center = self.view.center;
	youTubeThumb.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
