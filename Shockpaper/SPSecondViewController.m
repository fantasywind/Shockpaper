//
//  SPSecondViewController.m
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/4.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import "SPSecondViewController.h"

@interface SPSecondViewController ()

@end

@implementation SPSecondViewController

@synthesize newsGather = _newsGather;

@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"新聞", @"News");
        self.tabBarItem.image = [UIImage imageNamed:@"newspaper"];
    }
    
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"峽客新聞";
    [self.newsGather rssGetter:self];
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

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"Loading Table Cell Data");
    NSLog(@"Title when init: %@", self.newsGather.titles);
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //NSLog(@"Status: %@", self.newsGather.titles);
    if (self.newsGather.titles){
        cell.textLabel.text = [self.newsGather.titles objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [[self.newsGather.descriptions objectAtIndex:indexPath.row] substringToIndex:45];
    } else {
        cell.textLabel.text = @"文章";
    }
    
    //UIImage *image = [UIImage imageNamed:@"London.jpg"];
    //cell.imageView.image = image;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

#pragma mark - UITableViewDelegate Methods

@end
