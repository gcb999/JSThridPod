//
//  WYController.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "WYController.h"
#import "JSNinaPagerViewConfig.h"

@interface WYController ()<JSNinaPagerViewConfigDelegate>

@end


@implementation WYController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"网易横栏的用法";
    CGRect rect = CGRectMake(0, 44, IPHONScreenWidth, IPHONScreenHeight-44);
    [[JSNinaPagerViewConfig share]initWithFrame:rect delegate:self];
  
    
}

-(BOOL)deallocVCsIfUnnecessary{
    return NO;
}
@end
