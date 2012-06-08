//
//  YouTubeThumb.h

#import <UIKit/UIKit.h>

@interface YouTubeThumb : UIWebView  < UIWebViewDelegate > {

	UIActivityIndicatorView *activityIndicator;	

}

- (YouTubeThumb *)initWithURL:(NSString *)url frame:(CGRect)frame;

@end
