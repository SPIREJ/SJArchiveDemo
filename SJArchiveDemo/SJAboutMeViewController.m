//
//  SJAboutMeViewController.m
//  SJArchiveDemo
//
//  Created by SPIREJ on 16/1/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJAboutMeViewController.h"
#import "SJUserModel.h"
#import "SJArchive.h"
#import "SJLoginViewController.h"

@interface SJAboutMeViewController ()<UIAlertViewDelegate>
- (IBAction)loginBtnTouch:(UIButton *)sender;
- (IBAction)logoutBtnTouch:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UILabel *ageLB;
@property (weak, nonatomic) IBOutlet UILabel *phoneLB;

@end

@implementation SJAboutMeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    SJUserModel *model = [SJArchive currentArchiverUserInfo];
    self.nameLB.text = model.userName;
    self.ageLB.text = [NSString stringWithFormat:@"%ld",model.userAge];
    if ([self.ageLB.text isEqualToString:@"0"]) {
        self.ageLB.text = @"";
    }
    self.phoneLB.text = model.userPhone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)loginBtnTouch:(UIButton *)sender {
    SJLoginViewController *loginVC = [[SJLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

- (IBAction)logoutBtnTouch:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"确定退出登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"退出", nil];
    alertView.tag = 1000;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1000) {
        if (1 == buttonIndex) {
            SJUserModel *model = [SJArchive currentArchiverUserInfo];
            model.userName = @"";
            model.userPhone = @"";
            model.userAge = @"".integerValue;
            
            //归档
            [SJArchive archiverUserInfo:model];
            [self.tabBarController setSelectedIndex:0];
            [self.navigationController popToRootViewControllerAnimated:NO];
        }else if (0 == buttonIndex){
            return;
        }
    }
}
@end
