//
//  SPImageViewController.m
//  Shockpaper
//
//  Created by Yen Shau shan on 12/8/13.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import "SPImageViewController.h"

@interface SPImageViewController ()

@end

@implementation SPImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
@synthesize pageNumberLabel, numberTitle, numberImage;

// load the view nib and initialize the pageNumber ivar
- (id)initWithPageNumber:(int)page
{
    if (self = [super initWithNibName:@"SPImageViewController" bundle:nil])
    {
        pageNumber = page;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    pageNumberLabel.text = [NSString stringWithFormat:@"Page %d", pageNumber + 1];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
