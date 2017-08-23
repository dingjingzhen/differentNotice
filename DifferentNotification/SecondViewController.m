//
//  SecondViewController.m
//  DifferentNotification
//
//  Created by Apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *popBtn;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)popTofirst:(UIButton *)sender {
    [self.delegate transMessage:self.textField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)notification:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeMessageNotification" object:self userInfo:@{@"message":self.textField.text}];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)block:(UIButton *)sender {
    if (self.block) {
        self.block(self.textField.text);
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)KVO:(UIButton *)sender {
    self.message = self.textField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
