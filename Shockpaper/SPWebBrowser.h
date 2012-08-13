//
//  SPWebBrowser.h
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/10.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPWebBrowser : UIViewController <UIWebViewDelegate>{
    NSURL *theURL;
    NSString *theTitle;
    

    UIApplication *app;
    
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *indicator;
}

- (id)initWithURL:(NSURL *)url andTitle:(NSString *)string;

@end
