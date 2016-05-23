//
//  JSPopViewController.m
//  JSThridPod
//
//  Created by gcb999 on 16/5/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPopViewController.h"
#import "CollectionViewCell.h"

@interface JSPopViewController(){
    
}

@end

@implementation JSPopViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.

 
    
    CGRect hrect=CGRectMake(0, 0, IPHONScreenWidth, 200);
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[CollectionViewCell class] delegate:self];
    ctrl.pagingEnabled=YES;
    ctrl.view.frame=hrect;

    
 
    
    
    [self.contentView addSubview:ctrl.view];
    
    [self addChildViewController:ctrl];
    
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithContentFrame:hrect DirectionHorizontal:CGSizeMake(IPHONScreenWidth, 200) minimumLineSpacing:0];
    
    ctrl.flowLayout=flowout;

}



#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    [SWCtrl.data removeAllObjects];
    NSArray *date=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"];
    [SWCtrl.data addObjectsFromArray:date];
    [SWCtrl reloadHeader];
    
    
}
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
