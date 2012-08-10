//
//  SPWebBrowser.m
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/10.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import "SPAppDelegate.h"
#import "SPWebBrowser.h"

@interface SPWebBrowser ()

@end

@implementation SPWebBrowser

- (id)initWithURL:(NSURL *)url andTitle:(NSString *)string{
    if (self = [super init]){
        theURL = url;
        theTitle = string;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = theTitle;
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:theURL];
    [webView loadRequest:requestObject];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    webView.delegate = nil;
    [webView stopLoading];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
