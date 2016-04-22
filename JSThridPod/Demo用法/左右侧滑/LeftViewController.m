//
//  LeftViewController.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/19.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "LeftViewController.h"
#import "HomeTableCell.h"

@interface LeftViewController ()<JSTableViewCellDelegate>

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
   CGRect rect =self.view.bounds;
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewNormal tableViewCellClass:[HomeTableCell class] delegate:self];
    ctrl.view.frame=rect;
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    NSArray *date=@[
                    
                    @"关闭左侧",
                    @"TableView头部动画用法",
                    @"CollectionView用法",
                    @"打开左侧滑",
                    @"CYLTabBarController的用法",
                    @"HUD的用法",
                    ];
    SWCtrl.data=date;
    [SWCtrl reloadHeader];
    
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UINavigationController *nav=(UINavigationController *)self.jaSidePanelCtrl.centerPanel;
    [nav popToRootViewControllerAnimated:YES];
    
   
    
    

    
    if (indexPath.row==0) {
        [self.jaSidePanelCtrl showRightPanelAnimated:YES];
     
    }
    else if (indexPath.row==1) {

        //
        [self.jaSidePanelCtrl showRightPanelAnimated:YES];
    }
    else if (indexPath.row==2) {
//        NormalCollecionViewController *ctrl=[[NormalCollecionViewController alloc] init];
//        [nav pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==3) {
        [self.jaSidePanelCtrl toggleLeftPanel:nil];
    }
    else if (indexPath.row==4) {
//        JSTabbarViewController *ctrl=[[JSTabbarViewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else if (indexPath.row==5) {
//        [[SDImageCache sharedImageCache] clearDisk];
//        HudViewController *ctrl=[[HudViewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
    }
    
    
    
    
}


@end
