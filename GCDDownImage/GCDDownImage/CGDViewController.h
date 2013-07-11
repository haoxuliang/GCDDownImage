//
//  CGDViewController.h
//  GCDDownImage
//
//  Created by LeoHao on 13-4-12.
//  Copyright (c) 2013年 LeoHao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoGallery.h"

@interface CGDViewController : UIViewController<PhotoGalleryDelegate>{

}

@property (nonatomic, retain) NSMutableArray *arrImageName;
@property (nonatomic, retain) NSMutableArray *arrImage;

@property (nonatomic, retain) PhotoGallery *photoGallery;


@end
