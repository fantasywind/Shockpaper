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

@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSMutableArray *links;
@property (strong, nonatomic) NSMutableArray  *descriptions;
@property (strong, nonatomic) NSMutableArray *images;

- (void)rssGetter:(UIViewController *)controller;

@end
