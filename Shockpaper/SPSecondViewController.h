//
//  SPSecondViewController.h
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/4.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPNewsGather.h"

@interface SPSecondViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) SPNewsGather *newsGather;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
