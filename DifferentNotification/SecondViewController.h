//
//  SecondViewController.h
//  DifferentNotification
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^mBlock) (NSString *message);

@protocol myDelegate <NSObject>
-(void)transMessage:(NSString *)message;
@end

@interface SecondViewController : UIViewController
@property (nonatomic,copy) mBlock block;
@property (nonatomic) id<myDelegate> delegate;
@property (nonatomic,strong) NSString *message;
@end
