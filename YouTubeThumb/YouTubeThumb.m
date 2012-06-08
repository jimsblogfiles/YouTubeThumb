//
//  YouTubeThumb.m

#import "YouTubeThumb.h"

@implementation YouTubeThumb

#pragma mark -
#pragma mark Initialization

- (id)init {
	@throw [NSException exceptionWithName:@"YouTubeThumb Init Fail" reason:@"Use initWithURL:(NSString*)url frame:(CGRect)frame;, not init" userInfo:nil];
}

- (YouTubeThumb *)initWithURL:(NSString*)url frame:(CGRect)frame {
	
	if (self = [super init]) {
		
		self = [self initWithFrame:frame];

		NSString *finalHTML = [NSString stringWithFormat:@"\
							   <html>\
							   <head></head>\
							   <body style=\"margin:0\">\
							   <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" width=\"%0.0f\" height=\"%0.0f\"></embed>\
							   </body>\
							   </html>", url, self.frame.size.width, self.frame.size.height ];
		
		for (id subview in self.subviews) {
			if ([[subview class] isSubclassOfClass: [UIScrollView class]]) {
				((UIScrollView *)subview).bounces = NO;
			}
		}
	
		[self loadHTMLString:finalHTML baseURL:nil];
		[self setDelegate:self];

	}
	
	return self;
	
}

- (void)webViewDidStartLoad:(UIWebView *)wv {

	activityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
	activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[activityIndicator startAnimating];
	[self addSubview:activityIndicator];

}

- (void)webViewDidFinishLoad:(UIWebView *)wv {

	[activityIndicator stopAnimating];
	activityIndicator = nil;

}

@end
