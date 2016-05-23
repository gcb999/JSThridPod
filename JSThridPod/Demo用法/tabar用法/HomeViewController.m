//
//  HomeViewController.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/19.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "HomeViewController.h"
#import  "HomeTableCell.h"

//tableview
#import "NormalTableViewController.h"
#import "HeaderAnimationTableViewViewController.h"

//collectionview
#import "JSCollectioinController.h"
#import "FlowOutCollectionViewController.h"

//tabbar
#import "JSTabbarViewController.h"

#import "WYController.h"

#import "JSPickerViewController.h"

#import "JSPopViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titlelb.text=@"Home";
  
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    
    
    
    
    CGRect rect =self.contentView.bounds;
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewNormal tableViewCellClass:[HomeTableCell class] delegate:self];
    ctrl.view.frame=rect;
    [self.contentView addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    NSArray *date=@[
                    
                    @"TableView用法",
                    @"TableView头部动画用法",
                    @"CollectionView用法",
                    @"CollectionView流水布局",
                    @"CYLTabBarController的用法",
                    @"网易横栏的用法",
                     @"日期与下弹出列表用法",
                     @"动画弹出VC列表用法"
                    ];
    SWCtrl.data=date;
    [SWCtrl reloadHeader];
    
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
  
        NormalTableViewController *ctrl=[[NormalTableViewController alloc] init];
          [self.navigationController pushViewController:ctrl animated:YES];

    }
    else if (indexPath.row==1) {
        HeaderAnimationTableViewViewController *ctrl=[[HeaderAnimationTableViewViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==2) {
        JSCollectioinController *ctrl=[[JSCollectioinController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==3) {
        FlowOutCollectionViewController *ctrl=[[FlowOutCollectionViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==4) {
        JSTabbarViewController *ctrl=[[JSTabbarViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==5) {
   
        WYController *ctrl=[[WYController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==6) {
        
        JSPickerViewController *ctrl=[[JSPickerViewController alloc] init];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==7) {
        
        JSPopViewController *ctrl=[[JSPopViewController alloc] init];
     [self.navigationController pushViewController:ctrl animated:YES];
    }
    
    //CYLTabBarViewController
    
    
}


/** zoom */
-(void)zoomPhotoVC:(JSBasicViewController *)vc{
    
    
    //拿到window
    UIWindow *window = [UIWindow appWindow];
    vc.view.frame=window.bounds;
 
    //添加视图
    [window addSubview:vc.view];
    
    //添加子控制器
    [self addChildViewController:vc];
    
//    vc.navView.hidden = YES;
// 
//    
//     vc.navView.alpha=0;
//    
//    [UIView animateWithDuration:.25f animations:^{
//         vc.navView.alpha=1;
//    } completion:^(BOOL finished) {
////        photoModel.sourceImageView.hidden = NO;
//    }];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.6f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        vc.view.backgroundColor = [UIColor blackColor];
//    });
}


@end
