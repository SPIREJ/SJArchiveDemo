//
//  SJLoginViewController.m
//  SJArchiveDemo
//
//  Created by SPIREJ on 16/1/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJLoginViewController.h"
#import "SJUserModel.h"
#import "SJArchive.h"

@interface SJLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
- (IBAction)loginBtnTouch:(UIButton *)sender;

@end

@implementation SJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)loginBtnTouch:(UIButton *)sender {
    if (_nameTF.text.length == 0 || _ageTF.text.length == 0 || _phoneTF.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"信息填写不完整" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    SJUserModel *userModel = [SJUserModel userWithName:self.nameTF.text age:self.ageTF.text.integerValue phone:self.phoneTF.text];
    [SJArchive archiverUserInfo:userModel];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
