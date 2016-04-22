//
//  CenterViewController.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/19.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect rect =CGRectMake(0, 100, 100, 100);
    
    UIButton *btn=[UIButton ButtonWithImageName:nil hImageName:nil frame:rect title:@"打开左侧栏" titleColor:KCOLOR_RED font:KNormalFontSize target:self action:@selector(openleft)];
    [self.view addSubview:btn];
    
    rect =CGRectMake(0, 200, 100, 100);
    btn=[UIButton ButtonWithImageName:nil hImageName:nil frame:rect title:@"打开右侧栏" titleColor:KCOLOR_RED font:KNormalFontSize target:self action:@selector(openright)];
    [self.view addSubview:btn];
    
    
}

//打开左侧
-(void)openleft{
    
    [self.jaSidlePanel showLeftPanelAnimated:YES];
}

-(void)openright{
    
    [self.jaSidlePanel showRightPanelAnimated:YES];
}



@end
