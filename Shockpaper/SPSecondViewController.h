//
//  SPSecondViewController.h
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/4.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPSecondViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {

    NSMutableArray *titles;
    NSMutableArray *descriptions;
    NSMutableArray *pictures;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
