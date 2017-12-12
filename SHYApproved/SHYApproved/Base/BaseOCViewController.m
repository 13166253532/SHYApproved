//
//  BaseOCViewController.m
//  NineClouds
//
//  Created by xiejiangbo on 2017/11/23.
//  Copyright © 2017年 yin chen. All rights reserved.
//

#import "BaseOCViewController.h"

@interface BaseOCViewController ()

@end

@implementation BaseOCViewController
//+(UIViewController *)createViewController{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"QRCodeTwoViewController" bundle:nil];
//    QRCodeTwoViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"QRCodeTwoViewController"];
//    return vc;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    //[self.navigationController setNavigationBarHidden:NO animated:YES];
   
}
-(void)viewWillDisappear:(BOOL)animated{
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}
//导航栏不遮挡
-(void)isNavigationBarObstructed{
    self.edgesForExtendedLayout = UIRectEdgeBottom;
}
// 设置状态栏颜色
-(void)initSetStatusBarColor{
    // 无需设置 plist
    [self.navigationController navigationBar].barStyle = UIBarStyleBlack;
    // 需要设置 plist
    //View controller-based status bar appearance 设置为 NO
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
// 设置导航栏 透明
-(void)hideNavigationBar{
    [self.navigationController navigationBar].shadowImage = [[UIImage alloc]init];
    [[self.navigationController navigationBar] lt_setBackgroundColor:[UIColor clearColor]];
}
//恢复导航栏 透明
-(void)displayNavigationBar{
    [[self.navigationController navigationBar] lt_reset];
}
// 设置导航栏
-(void)initTitleBar{
    [self initReturnBtn];
    [self defaultBackButtonItem];
    [self initTitleBarColor];
}

-(void)initTitleBarColor{
    NSDictionary *dict = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName: [UIFont systemFontOfSize:20] };
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}
-(void)initReturnBtn{
    UIBarButtonItem *leftN = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return_image"] style:UIBarButtonItemStylePlain target:self action:@selector(arrowResponse)];
    self.navigationItem.leftBarButtonItem = leftN;
}
-(void)arrowResponse{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)defaultBackButtonItem{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = UICOLORFROMRGB(0x007bc9);
    self.navigationController.navigationBar.subviews[0].backgroundColor = UICOLORFROMRGB(0x007bc9);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

-(void)dealloc{
    NSLog(@"------------------------");
    NSLog(@"%@",self.classForCoder);
    NSLog(@"------------------------");
}


@end
