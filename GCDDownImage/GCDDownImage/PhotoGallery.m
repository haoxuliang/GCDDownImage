//
//  PhotoGallery.m
//  GCDDownImage
//
//  Created by LeoHao on 13-4-12.
//  Copyright (c) 2013年 LeoHao. All rights reserved.
//

#import "PhotoGallery.h"
#import "ImageFromUrl.h"

#define IMAGE_TAG   10000

@implementation PhotoGallery

-(void)gotoDetailPage:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"\n\none tap\n\n");
    CGPoint point = [gestureRecognizer locationInView:self];
    NSLog(@"point is x is %f , y is %f",point.x,point.y);
    
    int xNum = point.x/(photoWidth + photoMargin);
    int yNum = point.y/(photoHeight + photoMargin);
    
    NSInteger index = (yNum + 1)*columnNum + xNum;
    if (_photoDelegate && [_photoDelegate respondsToSelector:@selector(gotoDetailPageWithIndex:)]) {
        [_photoDelegate gotoDetailPageWithIndex:index];
    }
}

-(void)scalePhoto:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"\n\ntwo tap\n\n");
//    CGPoint point = [gestureRecognizer locationInView:self];
    
}

-(void)setGestureForView{
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoDetailPage:)];
    [oneTap setNumberOfTapsRequired:1];
    [oneTap setNumberOfTouchesRequired:1];
    [self addGestureRecognizer:oneTap];
    
    UITapGestureRecognizer *twoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scalePhoto:)];
    [twoTap setNumberOfTapsRequired:2];
    [twoTap setNumberOfTouchesRequired:1];
    [self addGestureRecognizer:twoTap];
    
    //可以区分 单击 和 双击
    [oneTap requireGestureRecognizerToFail: twoTap];
    [oneTap release];
    [twoTap release];
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setGestureForView];
    }
    return self;
}

-(void)setViewWithArray:(NSArray *)array
             imageWidth:(CGFloat)imageWidth
            imageHeight:(CGFloat)imageHeight
            imageMargin:(CGFloat)imageMargin
{
    photoWidth = imageWidth;
    photoHeight = imageHeight;
    photoMargin = imageMargin;
    imageNum = [array count];

    columnNum = (self.frame.size.width)/(imageWidth + imageMargin);
    lineNum = 0;
    if (imageNum % columnNum == 0) {
        lineNum = imageNum / columnNum ;
    }else{
        lineNum = imageNum / columnNum + 1;
    }
    
    if (lineNum * (imageHeight + imageMargin) > self.frame.size.height) {
        [self setContentSize:CGSizeMake(self.frame.size.width,lineNum * (imageMargin + imageHeight))];
    }
    
    for (int i = 0; i < imageNum; i++) {
        int left = (i%columnNum)*(imageMargin + imageWidth);
        int top = (i/columnNum) * (imageHeight + imageMargin);
        
        [((ImageFromUrl*)[array objectAtIndex:i]) setFrame:CGRectMake(left, top, imageWidth, imageHeight)];
        [((ImageFromUrl*)[array objectAtIndex:i]) setTag:IMAGE_TAG + i];
        [self addSubview:((ImageFromUrl*)[array objectAtIndex:i])];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - UIGestureRecognizerDelegate 手势代理方法
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    return YES;
//}
//
//// called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
//// return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
////
//// note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}
//
//// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    return YES;
//}

@end
