//
//  WYController.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "WYController.h"
#import "JSNinaPagerViewConfig.h"

@interface WYController ()<NinaPagerViewDelegate>

@end


@implementation WYController


#pragma mark -标题集合

-(NSArray *)titles{
    
    NSArray *titleArray =   @[
                              @"大连市",
                              @"甘井子",
                              @"星海广场",
                              @"西岗",
                              @"马栏子",
                              @"革镇堡",
                              @"中山",
                              @"人民广场",
                              @"中山广场"
                              ];
    
    
    
    
    return titleArray;
}


#pragma mark -代码控制器集合

-(NSArray *)Controllers{
    
    NSArray *vcsArray = @[
                          @"NormalTableViewController",
                          @"HeaderAnimationTableViewViewController",
                          @"NormalCollecionViewController",
                          @"FlowOutCollectionViewController",
                          @"JSTabbarViewController",
                          @"FirstViewController",
                          @"FlowOutCollectionViewController",
                          @"NormalTableViewController",
                          @"HeaderAnimationTableViewViewController",
                          ];
    
    return vcsArray;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"网易横栏的用法";
    CGRect rect = CGRectMake(0, 44, IPHONScreenWidth, IPHONScreenHeight-44);
    JSNinaPagerViewConfig *config=[[JSNinaPagerViewConfig alloc] initWithFrame:rect titles:[self titles] vcs:[self Controllers] delegate:self];
    [config loadingConfig];
    [self.view addSubview:config];
  
    
}

-(BOOL)deallocVCsIfUnnecessary{
    return YES;
}
@end
