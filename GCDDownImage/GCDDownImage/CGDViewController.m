//
//  CGDViewController.m
//  GCDDownImage
//
//  Created by LeoHao on 13-4-12.
//  Copyright (c) 2013年 LeoHao. All rights reserved.
//

#import "CGDViewController.h"
#import "ImageFromUrl.h"

#define IMAGE_NUMBER 70


@interface CGDViewController ()

@end

@implementation CGDViewController


-(void)gotoDetailPageWithIndex:(NSInteger)index
{
    
}


-(void)setDataForView{
    _arrImageName  = [[NSMutableArray alloc] initWithObjects:@"http://www.sinaimg.cn/blog/qing/image/Fancynew/jiaodiantu/3.18/qing031803.jpg",@"http://www.sinaimg.cn/blog/qing/image/Fancynew/jiaodiantu/3.18/qing031804.jpg",@"http://www.sinaimg.cn/blog/qing/image/Fancynew/jiaodiantu/3.18/qing031806.jpg",@"http://www.sinaimg.cn/blog/qing/image/Fancynew/jiaodiantu/3.18/qing031805.jpg", nil];
    
    _arrImage = [[NSMutableArray alloc] initWithCapacity:IMAGE_NUMBER];
    for (int i = 0; i < IMAGE_NUMBER; i++) {
        ImageFromUrl *image = [[ImageFromUrl alloc] init];
        [image loadImageWithURL:[_arrImageName objectAtIndex:i%4]];
        [_arrImage addObject:image];
    }
}

-(void)arrayImageInView{
    _photoGallery = [[PhotoGallery alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width - 10, self.view.frame.size.height - 10)];

//    [_photoGallery setViewWithArray:_arrImage imageWidth:45 imageHeight:45 imageMargin:5];
    [self.view addSubview:_photoGallery];
    [_photoGallery setViewWithArray:_arrImage imageWidth:50 imageHeight:70 imageMargin:5];

}

#pragma mark - Init
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"照片墙";
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    [self setDataForView];
    [self arrayImageInView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [_arrImageName release];
    [_photoGallery release];
    [super dealloc];
}

@end
