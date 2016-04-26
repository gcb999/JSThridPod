//
//  DLBasicViewController.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 15/12/16.
//  Copyright © 2015年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"

@interface JSBasicViewController ()
{
    
}

@end

@implementation JSBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //解决滚动视图20像素的偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    self.fd_prefersNavigationBarHidden = YES;
    
    if (self.hiddenNav) {
        self.contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, IPHONScreenHeight)];
        [self.view addSubview:self.contentView];
    }
    else{
         [self loadTitleView];
        self.contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 64, IPHONScreenWidth, IPHONScreenHeight-64)];
        [self.view addSubview:self.contentView];
    }
  
   
  
}

#pragma mark ---导航栏
- (void)loadTitleView{
    self.navView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 64)];
    self.navView.backgroundColor = KCOLOR_BLACK;
    [self.view addSubview:self.navView];
    [self addTitlelb];
}


#pragma mark ---左侧按钮
- (void)addBackBtn
{
    self.leftBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.leftBtn.frame=CGRectMake(5 , 20.f, 44, 44);
    [self.leftBtn setImage:[UIImage imageNamed:@"ic_detail_back"] forState:UIControlStateNormal];
    self.leftBtn.tintColor=[UIColor whiteColor];
    [self.leftBtn addTarget:self action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.leftBtn];
}


#pragma mark ---标题---
-(void)addTitlelb{
    self.titlelb=[[UILabel alloc]initWithFrame:CGRectMake(self.navView.frame.size.width/2-70, self.navView.frame.size.height/2-10, 140, 25)];
    
    self.titlelb.backgroundColor=[UIColor clearColor];
    self.titlelb.textAlignment=NSTextAlignmentCenter;
    self.titlelb.textColor=[UIColor whiteColor];
    
    self.titlelb.font=[UIFont systemFontOfSize:18];//[UIFont fontWithName: size:18];
    [self.navView addSubview:self.titlelb];
    
}

#pragma mark ---右边按钮---

-(void)addRightBtn{
    self.rightBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.rightBtn.frame=CGRectMake(IPHONScreenWidth- 49.f, 20.f, 44, 44);
    self.rightBtn.tintColor=[UIColor whiteColor];
    [self.navView addSubview:self.rightBtn];
}


-(void)addrightTitleBtn:(NSString *)title Event:(SEL)event{
    self.rightBtn=[UIButton ButtonWithImageName:nil hImageName:nil frame:CGRectMake(IPHONScreenWidth-52.f, 30.f, 48, 30) title:title titleColor:[UIColor whiteColor] font:KNormalFontSize target:self action:event];
    [self.navView addSubview:self.rightBtn];
}


-(void)addRightBtn:(NSString *)imgName method:(SEL)method{
    self.rightBtn=[UIButton ButtonWithImageName:imgName hImageName:imgName frame:CGRectMake(IPHONScreenWidth-50, 30, 40, 30) title:nil titleColor:nil font:nil target:self action:method];
    [self.navView addSubview:self.rightBtn];
}


-(void)leftBtnClicked:(UIButton *)btn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}


#pragma mark -注册3DTouch 功能

-(void)register3DTouchWithSourceView:(UIView *)sourceView  peekViewCtrCls:(Class)peekCls{
  
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        
        [self registerForPreviewingWithDelegate:self sourceView:sourceView];
        self.peekCls=peekCls;
        
        NSLog(@"3D Touch  可用!");
        
    }else{
        
        NSLog(@"3D Touch 无效");
    }
}


/**
 *  peek手势
 */
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    //避免重复
    if ([self.presentedViewController isKindOfClass:self.peekCls]){
        return nil;
    }
    else {
        
        if ([self respondsToSelector:@selector(previewingContext:viewControllerForLocation:)]) {
            
            return [self previewingContext:previewingContext viewControllerForLocation:location];
        }
        else{
            
            UIViewController *ctrl=(UIViewController *)[[self.peekCls alloc] init];
            return ctrl;
        }
        
        
    }
}


/**
 *  pop手势
 */
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self previewingContext:previewingContext commitViewController:viewControllerToCommit];
}







@end
