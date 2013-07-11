//
//  ImageFromUrl.m
//  GCDDownImage
//
//  Created by LeoHao on 13-4-12.
//  Copyright (c) 2013年 LeoHao. All rights reserved.
//

#import "ImageFromUrl.h"

@implementation ImageFromUrl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)loadImageWithURL:(NSString *)urlString
{
    if (!urlString) {
        return;
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        if (!data) {
            [data release];
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [[UIImage alloc] initWithData:data];
            [self setImage:image];
            [image release];
            [data release];
        });
    });
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
