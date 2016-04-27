//
//  HeaderAnimationTableViewViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "HeaderAnimationTableViewViewController.h"
#import "FirstViewController.h"
#import "HomeTableCell.h"




@interface HeaderAnimationTableViewViewController ()<JSTableViewControllerDelegate>
//@property (nonatomic, strong) BTAPIClient *braintreeClient;
@end

@implementation HeaderAnimationTableViewViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    CGRect rect =self.view.bounds;
    
    JSTableViewController *ctrl=[[JSTableViewController alloc] initWithState:JSTableViewPullFooter tableViewCellClass:[HomeTableCell class] delegate:self];
    ctrl.view.frame=rect;
    
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
    
    
    
    //子view
    
    UIImageView *avater = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
    avater.image = [UIImage imageNamed:@"avater"];
    avater.center = CGPointMake(IPHONScreenWidth*0.5f, 100);
    
    
    [ctrl stretchHeaderImgUrl:@"photo.jpg" subViews:avater];
    
    
//    // TODO: Switch this URL to your own authenticated API
//    NSURL *clientTokenURL = [NSURL URLWithString:@"https://braintree-sample-merchant.herokuapp.com/client_token"];
//    NSMutableURLRequest *clientTokenRequest = [NSMutableURLRequest requestWithURL:clientTokenURL];
//    [clientTokenRequest setValue:@"text/plain" forHTTPHeaderField:@"Accept"];
//    
//    [[[NSURLSession sharedSession] dataTaskWithRequest:clientTokenRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        // TODO: Handle errors
//        NSString *clientToken = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        
//        self.braintreeClient = [[BTAPIClient alloc] initWithAuthorization:clientToken];
//        // As an example, you may wish to present our Drop-in UI at this point.
//        // Continue to the next section to learn more...
//    }] resume];
    
    
    
    
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    
    if (currentPage==1) {
        NSArray *temp=@[@"1",@"2"];
        [SWCtrl.data addObjectsFromArray:temp];
        [SWCtrl reloadHeader];
    }
    else if (currentPage==2){
        
        [SWCtrl.data addObject:@"dd"];
        [SWCtrl reloadFooter];
    }
    else{
        [SWCtrl.data removeAllObjects];
        [SWCtrl reloadFooter];
    }
    
    
    
    
    
    
}

-(void)JSTableViewController:(JSTableViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    BTDropInViewController *dropInViewController = [[BTDropInViewController alloc]
//                                                    initWithAPIClient:self.braintreeClient];
//    dropInViewController.delegate = self;
//    
//    // This is where you might want to customize your view controller (see below)
//    
//    // The way you present your BTDropInViewController instance is up to you.
//    // In this example, we wrap it in a new, modally-presented navigation controller:
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]
//                             initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
//                             target:self
//                             action:@selector(userDidCancelPayment)];
//    dropInViewController.navigationItem.leftBarButtonItem = item;
//    UINavigationController *navigationController = [[UINavigationController alloc]
//                                                    initWithRootViewController:dropInViewController];
//    [self presentViewController:navigationController animated:YES completion:nil];
}


@end
