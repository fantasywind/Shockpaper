//
//  SPThirdViewController.h
//  Shockpaper
//
//  Created by Yen Shau shan on 12/8/6.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface SPThirdViewController : UIViewController <UIScrollViewDelegate>
{
    NSArray * views;
    UIPageControl *pageControl;
    UIScrollView *scrollView;
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
    NSArray *contentList;
}
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl * pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) NSArray *contentList;

- (IBAction) changePage:(id)sender;
//- (void) animateToView:(UIView *)newView;
@end
