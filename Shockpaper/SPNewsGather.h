//
//  SPNewsGather.h
//  Shockpaper
//
//  Created by Chai Yu Pai on 12/8/9.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SPSecondViewController;

@interface SPNewsGather : NSObject {
    
    SPSecondViewController *viewController;
    
    NSMutableData *responseData;
    NSURL *theURL;
}

@property (weak, nonatomic) NSArray *titles;
@property (weak, nonatomic) NSMutableArray *links;
@property (weak, nonatomic) NSMutableArray  *descriptions;
@property (weak, nonatomic) NSMutableArray *images;

- (void)rssGetter:(UIViewController *)controller;

@end
