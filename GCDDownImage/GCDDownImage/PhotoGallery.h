//
//  PhotoGallery.h
//  GCDDownImage
//
//  Created by LeoHao on 13-4-12.
//  Copyright (c) 2013年 LeoHao. All rights reserved.
//
#import <UIKit/UIKit.h>


@protocol PhotoGalleryDelegate <NSObject>

-(void)gotoDetailPageWithIndex:(NSInteger)index;

@end



@interface PhotoGallery : UIScrollView{
    int columnNum;
    int imageNum;
    int lineNum;
    
    CGFloat photoHeight;
    CGFloat photoWidth;
    CGFloat photoMargin;
}

@property (nonatomic,assign) id<PhotoGalleryDelegate> photoDelegate;


-(void)setViewWithArray:(NSArray *)array
             imageWidth:(CGFloat)width
            imageHeight:(CGFloat)height
            imageMargin:(CGFloat)margin;


@end


