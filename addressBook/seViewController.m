//
//  seViewController.m
//  addressBook
//
//  Created by 林泽森 on 2017/4/9.
//  Copyright © 2017年 PointStone. All rights reserved.
//

#import "seViewController.h"

@interface seViewController ()

@end

@implementation seViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addlabel];
}

- (void)addlabel{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"TESTTESTTESTTEST";
    label.frame = CGRectMake(100, 100, 100, 400);
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:50];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    //富文本
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
