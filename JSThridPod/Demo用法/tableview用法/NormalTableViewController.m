//
//  NormalTableViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//



#import "NormalTableViewController.h"
#import "HomeTableCell.h"
#import "FirstViewController.h"


/*
 
 步骤1： 实现JSTableViewControllerDelegate 方法 (必做）
 
 
 步骤2： 创建JSTableViewController 对象 （必做）
 
 
 步骤3： 实现 “网络加载数据” 方法  （必做）
 
 // 网络加载
 -(void)JSTableViewController:(JSTableViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage
 
 
 步骤4：实现代理中各个方法...
 
 
 //点击事件
 -(void)JSTableViewController:(JSTableViewController *)SWCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
 
 
 //高度
 -(CGFloat)JSTableViewController:(JSTableViewController *)SWCtrl heightForRowAtIndexPath:(NSIndexPath *)indexPath;
 
 ....
 
 
 */



@interface NormalTableViewController ()<JSTableViewControllerDelegate>
{
    UIView *headerView;
}
@end

@implementation NormalTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hiddenNav=NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"tableView的所用用法";
    [self addBackBtn];
   
    
    CGRect rect =self.contentView.bounds;
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewPullHeaderFooter tableViewCellClass:[HomeTableCell class] delegate:self];
    ctrl.view.frame=rect;
    [self.contentView addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

#pragma mark -实现网络请求数据

-(void)JSTableViewController:(JSTableViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    if (currentPage==1) {//初次加载 或者上拉刷新
        [JSCtrl.data removeAllObjects];
        NSArray *date=@[@"BrainTree",@"PayPal",@"click"];
        [JSCtrl.data addObjectsFromArray:date];
        [JSCtrl reloadHeader];
    }
    else if (currentPage==2){//下拉刷新
        NSArray *date=@[@"2",@"3"];
        [JSCtrl.data addObjectsFromArray:date];
        [JSCtrl reloadFooter];
        
    }
    else if(currentPage==3){//无数据的数据的时候调出 无网View
        
        [JSCtrl.data removeAllObjects];
        [JSCtrl reloadFooter];
        
    }
}

-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    
    if (indexPath.row==0) {//brainTree
        
        [[JSBraintree share] brainTreeWithClientID:@"aa" amount:@"100" currentCtrl:self braintreeCompletion:^(BOOL isSuccess, BTPaymentMethod *paypalmethod, BTData *btdate, UIViewController *ctrl) {
           
            if (isSuccess) {//支付成功
                
                NSLog(@"--nonce=%@---collectDeviceData=%@",paypalmethod.nonce,btdate.collectDeviceData);
                [ctrl dismissViewControllerAnimated:YES completion:^{
                    
                }];
                
                
            }
            else{
                [MBProgressHUD showError:@"支付失败" toView:self.view];
            }
            
            
            
        }];
        
        
    }
    
    else if(indexPath.row==1){//PayPal
    
    PayPalPayment *ment= [[JSPayPal share] paymentWithOrderId:@"001" subProductItems:nil total:@"100" shipping:nil tax:nil];
   [[JSPayPal share] PayPalment:ment currentCtrl:self payPalCompletion:^(BOOL isSuccess, PayPalPayment *paypalment) {
      
       if (isSuccess) {//支付成功
          
           CGFloat amount= [paypalment.amount floatValue];
           
     
       }
       else{
           
            [MBProgressHUD showError:@"支付失败" toView:self.view];
       }
       
       
   }];
        
    }
    else{
        
        FirstViewController *ctrl=[[FirstViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
        
    }
}


#pragma mark --实现自定头部View 协议

-(UIView *)JSTableViewControllerWithViewForTableHeaderView{
    
    UIView *contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 50)];
    contentView.backgroundColor=KCOLOR_BLACK;
    
    UILabel *lb=[UILabel LabWithFrame:contentView.bounds text:@"自定义头部View" textColor:KCOLOR_WHITE textAlign:NSTextAlignmentCenter font:KNormalFontSize];
    [contentView addSubview:lb];
    
    headerView=contentView;
    
    return contentView;
    
}

#pragma mark --实现自定尾部View 协议

-(UIView *)JSTableViewControllerWithViewForTableFooterView{
    UIView *contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 50)];
    contentView.backgroundColor=[UIColor redColor];
    
    UILabel *lb=[UILabel LabWithFrame:contentView.bounds text:@"自定义尾部View" textColor:KCOLOR_WHITE textAlign:NSTextAlignmentCenter font:KNormalFontSize];
    [contentView addSubview:lb];
    
    return contentView;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


-(void)leftBtnClicked:(UIButton *)btn{
    
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

@end
