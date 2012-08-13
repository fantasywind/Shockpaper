//
//  SPSecondViewController.m
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/4.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import "SPAppDelegate.h"
#import "SPSecondViewController.h"
#import "SPWebBrowser.h"

@interface SPSecondViewController ()

@end

@implementation SPSecondViewController

@synthesize newsGather = _newsGather;

@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"峽客新聞", @"News");
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
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    if (self.newsGather.titles){
        cell.textLabel.text = [self.newsGather.titles objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [[self.newsGather.descriptions objectAtIndex:indexPath.row] substringToIndex:45];
        
    } else {
        cell.textLabel.text = @"文章";
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.newsGather.titles objectAtIndex:indexPath.row] != nil){
        SPAppDelegate *delegate = (SPAppDelegate *)[[UIApplication sharedApplication] delegate];
        SPWebBrowser *webBrowser = [[SPWebBrowser alloc] init];
        NSURL *theURL = [[NSURL alloc] initWithString:[self.newsGather.links objectAtIndex:indexPath.row]];
        (void)[webBrowser initWithURL:theURL andTitle:[self.newsGather.titles objectAtIndex:indexPath.row]];
        [delegate.newsTabNaviController pushViewController:webBrowser animated:YES];
        [tv deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
