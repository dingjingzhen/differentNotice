//
//  ViewController.m
//  DifferentNotification
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<myDelegate>
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (nonatomic,strong) SecondViewController *second;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeMessageNotification:) name:@"ChangeMessageNotification" object:nil];
    
    
}



- (IBAction)delegateTosecond:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *secondVC = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    secondVC.delegate = self;
    [self presentViewController:secondVC animated:YES completion:nil];
    
}

- (IBAction)notification:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *secondVC = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self presentViewController:secondVC animated:YES completion:nil];
    
}
- (IBAction)block:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *secondVC = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self presentViewController:secondVC animated:YES completion:nil];
    secondVC.block = ^(NSString *str){
        self.myLabel.text = str;
    };
    
}
- (IBAction)KVO:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.second = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.second addObserver:self forKeyPath:@"message" options:NSKeyValueObservingOptionNew context:nil];
    [self presentViewController:self.second animated:YES completion:nil];
}

//delegate传递数据
-(void)transMessage:(NSString *)message{
    self.myLabel.text = message;
}

//noticefication
-(void)ChangeMessageNotification:(NSNotification*)notification{
    NSDictionary *nameDictionary = [notification userInfo];
    self.myLabel.text = [nameDictionary objectForKey:@"message"];
}
-(void)dealloc{
    //不使用时记得清除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //清理观察
    [self.second removeObserver:self forKeyPath:@"userName"];
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //此处监听key对应值的变化情况
    if ([keyPath isEqualToString:@"message"]) {
        self.myLabel.text = self.second.message;
    }
}


@end
