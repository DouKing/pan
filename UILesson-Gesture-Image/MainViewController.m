//
//  MainViewController.m
//  UILesson-Gesture-Image
//
//  Created by William on 14-1-23.
//  Copyright (c) 2014年 Wuyikai. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)dealloc
{
    [_displayImageView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.displayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
              //实例化一个UIimage类的对象
    self.displayImageView.image = [UIImage imageNamed:@"a.jpg"];
    self.displayImageView.userInteractionEnabled = YES;
        //该属性的默认值为NO，它是控制UIImage对象是否可以接受用户交互的属性
    [self.view addSubview:self.displayImageView];
    [self.displayImageView release];
    
    //给ImageView添加手势
    
//    //1.轻拍（单击）手势
//    UITapGestureRecognizer *tapGeesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureAction)];//实例化一个轻拍手势
//        //1.1设置 点击次数，默认为1
//    tapGeesture.numberOfTapsRequired = 2;//2表示双击
//    tapGeesture.numberOfTouchesRequired = 2;//2表示两个手指同时操作
//    [self.displayImageView addGestureRecognizer:tapGeesture];//添加到图像视图上
//    [tapGeesture release];
    
//    //2.轻扫手势
//    UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hasndleGestureAction)];
//    swipGesture.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft ;// 设置滑动方向
//    [self.displayImageView addGestureRecognizer:swipGesture];
//    [swipGesture release];
    
//    //3.捏合手势
    UIPinchGestureRecognizer *painchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(painchGestureAction:)];
    [self.displayImageView addGestureRecognizer:painchGesture];
    [painchGesture release];
    
//    //4.拖拽手势
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestureAction:)];
//    [self.displayImageView addGestureRecognizer:panGesture];
//    [panGesture release];
    
    //旋转手势
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [self.displayImageView addGestureRecognizer:rotationGesture];
    [rotationGesture release];
    
}

- (void)handleGestureAction
{
    self.displayImageView.image = [UIImage imageNamed:@"b.jpg"];
}

- (void)painchGestureAction:(id)sender
{
    UIPinchGestureRecognizer *pinchGesture = (UIPinchGestureRecognizer *)sender;
    NSLog(@"scale= %f, velocity= %f", pinchGesture.scale, pinchGesture.velocity);
    
//    if (self.displayImageView.frame.size.width > 50 ) {
//        self.displayImageView.transform = CGAffineTransformScale(self.displayImageView.transform, pinchGesture.scale, pinchGesture.scale);//改变大小
//    } else if (pinchGesture.scale > 1) {
//        self.displayImageView.transform = CGAffineTransformScale(self.displayImageView.transform, pinchGesture.scale, pinchGesture.scale);//改变大小
//    }
    
    //第一种方法
//    self.displayImageView.transform = CGAffineTransformMakeScale(pinchGesture.scale, pinchGesture.scale);
    
    //第二种方法
    self.displayImageView.transform = CGAffineTransformScale(self.displayImageView.transform, pinchGesture.scale, pinchGesture.scale);
    pinchGesture.scale = 1;
}

- (void)handlePanGestureAction:(UIPanGestureRecognizer *)sender
{
//    NSLog(@"%@", NSStringFromCGPoint([sender translationInView:self.displayImageView]));
//    NSLog(@"location = %@",NSStringFromCGPoint([sender locationInView:self.view]));
//    NSLog(@"location = %@",NSStringFromCGPoint([sender locationInView:self.displayImageView]));
    
//    CGPoint currentPoint = [sender translationInView:self.displayImageView];
//    self.displayImageView.transform = CGAffineTransformTranslate(self.displayImageView.transform, currentPoint.x, currentPoint.y);
//    [sender setTranslation:CGPointZero inView:self.displayImageView];
    
    CGPoint offSetPoint = [sender translationInView:self.displayImageView];//获得偏移量
    self.displayImageView.transform = CGAffineTransformMakeTranslation(offSetPoint.x, offSetPoint.y);//移动
    
}

- (void)rotationAction:(UIRotationGestureRecognizer *)sender
{
//    self.displayImageView.transform = CGAffineTransformMakeRotation(sender.rotation);
    
    // 第二种方法 推荐
//    self.displayImageView.transform = CGAffineTransformRotate(self.displayImageView.transform, sender.rotation);
//    sender.rotation = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
