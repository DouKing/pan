//
//  SecondViewController.m
//  UILesson-Gesture-Image
//
//  Created by William on 14-1-23.
//  Copyright (c) 2014年 Wuyikai. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    
    
    // 动画
    self.displayImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 200)] autorelease];
    self.displayImageView.image = [UIImage imageNamed:@"1.tiff"];
    NSMutableArray *imageArray = [NSMutableArray array];
    for ( int i = 1; i < 12; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.tiff", i];
        UIImage *tempImage = [UIImage imageNamed:imageName];
        [imageArray addObject:tempImage];
    }
    self.displayImageView.animationImages = imageArray;
    self.displayImageView.animationDuration = 5;//设置动画时间间隔  5秒钟
//    [self.displayImageView startAnimating];//开始动画
    [self.view addSubview:self.displayImageView];
    
    //实例化 一个滑竿
    UISlider *timeSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 260, 300, 34)];//高 默认为34，设置不起作用
    [timeSlider addTarget:self action:@selector(handleSliderValueChanged:) forControlEvents:UIControlEventValueChanged];//值发生改变的事件
    //默认值为0~1
    timeSlider.minimumValue = 0;//设置最小值
    timeSlider.maximumValue = 10;//设置最大值
    timeSlider.value = self.displayImageView.animationDuration;//设置默认值
    
    [self.view addSubview:timeSlider];
    [timeSlider release];
    
    // 实例化 一个开关， 它的frame 不起作用
    UISwitch *aSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 280, 30, 20)];
    [aSwitch addTarget:self action:@selector(aSwitchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:aSwitch];
    [aSwitch release];
    
    //分段控件
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"男",@"女", nil]];
    segmentedControl.frame = CGRectMake(10, 320, 300, 100);
    segmentedControl.selectedSegmentIndex = 0;//默认选中状态
    [segmentedControl addTarget:self action:@selector(handleSegementedAction:) forControlEvents:UIControlEventValueChanged];
//    [segmentedControl setContentOffset:CGSizeMake(20, 20) forSegmentAtIndex:0];
    [self.view addSubview:segmentedControl];
    [segmentedControl release];
    
    
    
}

- (void)handleSegementedAction:(UISegmentedControl *)sender
{
    [self.displayImageView stopAnimating];
    switch (sender.selectedSegmentIndex) {
        case 0:NSLog(@"男的");
            self.displayImageView.image = [UIImage imageNamed:@"e.jpg"];
            break;
        case 1:NSLog(@"女的");
            self.displayImageView.image = [UIImage imageNamed:@"g.jpg"];
//            [sender setImage:[UIImage imageNamed:@"12.jpg"] forSegmentAtIndex:1];
            break;
        default:
            break;
    }
}

- (void)aSwitchAction:(UISwitch *)sender
{
    if ([sender isOn]) {
        [self.displayImageView startAnimating];
    } else {
        [self.displayImageView stopAnimating];
    }
}

- (void)handleSliderValueChanged:(UISlider *)sender
{
//    [self.displayImageView stopAnimating];
    
    //Slider中的Value属性，会返回slider指示的值
    self.displayImageView.animationDuration = [sender value];
    //设置播放时间之后需要重新启动播放
    [self.displayImageView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
