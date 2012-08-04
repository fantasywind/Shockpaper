//
//  SPFirstViewController.m
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/4.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import "SPFirstViewController.h"

@interface SPFirstViewController ()

@end

@implementation SPFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    pictures = [NSArray arrayWithObjects:[UIImage imageNamed:@"London.jpg"], [UIImage imageNamed:@"Madrid.jpg"], [UIImage imageNamed:@"SanFrancisco.jpg"], [UIImage imageNamed:@"Sydney"], nil];

    slideshow.animationImages = pictures;
    slideshow.animationDuration = 8;
    slideshow.animationRepeatCount = 0;
    [slideshow startAnimating];
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
