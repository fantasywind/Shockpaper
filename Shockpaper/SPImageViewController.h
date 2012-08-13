//
//  SPImageViewController.h
//  Shockpaper
//
//  Created by Yen Shau shan on 12/8/13.
//  Copyright (c) 2012年 Chai Yu Pai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPImageViewController : UIViewController
{
    UILabel *pageNumberLabel;
    int pageNumber;
    
    UILabel *numberTitle;
    UIImageView *numberImage;
}

@property (nonatomic, retain) IBOutlet UILabel *pageNumberLabel;

@property (nonatomic, retain) IBOutlet UILabel *numberTitle;
@property (nonatomic, retain) IBOutlet UIImageView *numberImage;

- (id)initWithPageNumber:(int)page;
@end
