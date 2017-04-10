//
//  ViewController.m
//  addressBook
//
//  Created by 林泽森 on 2017/4/9.
//  Copyright © 2017年 PointStone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView* tableView;

@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //OC 是一个动态语言
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"array"])
    {
        NSMutableArray *T_array = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"array"]];
        
        
        //[[NSUserDefaults standardUserDefaults] objectForKey:@"array"] 默认是NSArray
        
        self.array = T_array; //NSMutableArray
    }
    else{
        self.array = [[NSMutableArray alloc] init];

        for (int i = 0; i<30; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [self.array addObject:str];
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:self.array forKey:@"array"];

    }
    
    /*
        */
    
    [self setNavTitle];
    
    [self setNavBtn];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
    

}



#pragma mark - 设置导航栏标题
-(void)setNavTitle{
    //方法一
    //self.title = @"addressBook";
    //方法二
    [self.navigationItem setTitle:@"addressBook"];
}

- (void)setNavBtn{
    //UIBarButtonItem *roadLoad = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(roadLoadClicked)];
    
    UIBarButtonItem *rBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = rBtn;
}

- (void)add{
    [self.array insertObject:@"add" atIndex:0];
    [[NSUserDefaults standardUserDefaults] setObject:self.array forKey:@"array"];
    [self.tableView reloadData];
}

#pragma mark - 数据库

#pragma mark - 懒加载
- (UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - tableView 协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.array[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"第%ld组第%ld行",indexPath.section,indexPath.row);
    
    //栈
    seViewController* VC = [[seViewController alloc] init];
    
    //Push
    [self.navigationController pushViewController:VC animated:YES];
    
    //[self presentModalViewController:VC animated:YES];
    
}

/**
 *  只要实现了这个方法，左滑出现Delete按钮的功能就有了
 *  点击了“左滑出现的Delete按钮”会调用这个方法
 */
//IOS9前自定义左滑多个按钮需实现此方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除模型
    [self.array removeObjectAtIndex:indexPath.row];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.array forKey:@"array"];
    
    // 刷新
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

/**
 *  修改Delete按钮文字为“删除”
 */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
