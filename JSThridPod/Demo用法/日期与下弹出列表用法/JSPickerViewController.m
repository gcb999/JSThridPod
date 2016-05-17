//
//  JSPickerViewController.m
//  JSThridPod
//
//  Created by gcb999 on 16/5/17.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSPickerViewController.h"

@implementation JSPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"网易横栏的用法";

    CGRect hrect, rect=self.contentView.bounds;
    NSArray *date=@[@"日期",@"PickView",@"列表"];
    for (int i=0; i<3; i++) {
        CGRectDivide(rect, &hrect, &rect, 40, CGRectMinYEdge);
        UIButton *btn=[UIButton ButtonWithSystemImage:hrect title:date[i] titleColor:KCOLOR_RED font:KBigFontSize target:self action:@selector(click:)];
        btn.tag=i;
        [self.contentView addSubview:btn];
    }
    
    
}

-(void)click:(UIButton *)btn{
    
    int tag=btn.tag;
    
    for (UIViewController *ctrl in self.childViewControllers) {
        
        if (ctrl.view.tag==1 || ctrl.view.tag==2) {
            [ctrl.view removeFromSuperview];
            [ctrl removeFromParentViewController ];
        }
      
        
    }
   
    
    if (tag==0) {
        
        
        JSPresentCommonViewCtrl *ctrl=[[JSPresentCommonViewCtrl alloc] init];
        [ctrl pickerViewWithDataArr:@[@"1",@"2"] selectBlock:^(JSPresentCommonViewCtrl *ctrl, NSString *text) {
           
            if (text.length==0) {//取消
                 [JSPresentView hidePresentSubView];
            }
            else{//OK
         
                NSLog(@"--%@",text);
                [JSPresentView hidePresentSubView];
                
            }
            
        }];
        
        
        ctrl.view.tag=1;
        [JSPresentView showWithSubView:ctrl.view];
        [self addChildViewController:ctrl];
        
    }
    else if ( tag==1){
        JSPresentCommonViewCtrl *ctrl=[[JSPresentCommonViewCtrl alloc] init];
        [ctrl datePickWithSelectBlock:^(JSPresentCommonViewCtrl *ctrl, NSString *text) {
            if (text.length==0) {//取消
                [JSPresentView hidePresentSubView];
            }
            else{//OK
                
                NSLog(@"--%@",text);
                [JSPresentView hidePresentSubView];
                
            }
        }];
        ctrl.view.tag=2;
        [JSPresentView showWithSubView:ctrl.view];
        [self addChildViewController:ctrl];
    }
    else if ( tag==2){
        
    }
    
}




@end
