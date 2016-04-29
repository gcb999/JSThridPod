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
                     @"网易横栏的用法"
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
//    else if (indexPath.row==6) {
//        
//        DLTabedSlideView_ViewController *ctrl=[[DLTabedSlideView_ViewController alloc] init];
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
    
    //CYLTabBarViewController
    
    
}



@end
