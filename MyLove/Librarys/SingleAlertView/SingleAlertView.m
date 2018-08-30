//
//  SingleAlertView.m
//  SOHUAssistant
//
//  Created by uway_soft on 13-10-13.
//  Copyright (c) 2013年 uway_soft. All rights reserved.
//

#import "SingleAlertView.h"
#import <QuartzCore/QuartzCore.h>
#import "MyDefine.h"
#import "BaseViewController.h"
@implementation SingleAlertView

- (id)initWithFrame:(CGRect)frame Text:(NSString *)content
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.image = [UIImage imageNamed:@"translucent_blackBottom"];
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
        self.layer.cornerRadius = 13.5;

        
        if (content) {
            
            _contentLabel = [[RichLabel alloc]initWithFrame:CGRectMake(7.0,10.0, frame.size.width-14.0, frame.size.height-20)];
            _contentLabel.fontname = @"Helvetica";
            _contentLabel.textAlignment = NSTextAlignmentCenter;
            _contentLabel.backgroundColor = [UIColor clearColor];
            [_contentLabel setRichLinebreakMode:kCTLineBreakByWordWrapping];
            _contentLabel.lineSpace = 7;
            
            [_contentLabel setText:content WithFont:[UIFont systemFontOfSize:14.0] AndColor:[UIColor whiteColor]];
            float height=[_contentLabel boundingHeightForWidth:frame.size.width-14];
            
            _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y, frame.size.width-14.0, iOS7?height:(height+4));
            
            
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,[_contentLabel boundingHeightForWidth:frame.size.width-14]+20);
            [self addSubview:_contentLabel];
        }
        // Initialization code
    }
    return self;
}


- (id)initWithFrameTwo:(CGRect)frame Text:(NSString *)content
{
    self = [super initWithFrame:frame];
    if (self) {
        //        self.image = [UIImage imageNamed:@"translucent_blackBottom"];
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
        self.layer.cornerRadius = 13.5;
        
        
        if (content) {
            
            _contentLabel = [[RichLabel alloc]initWithFrame:CGRectMake(5,10.0, frame.size.width-7, frame.size.height-20)];
            _contentLabel.fontname = @"Helvetica";
            _contentLabel.textAlignment = NSTextAlignmentCenter;
            _contentLabel.backgroundColor = [UIColor clearColor];
            [_contentLabel setRichLinebreakMode:kCTLineBreakByWordWrapping];
            _contentLabel.lineSpace = 7;
            
            [_contentLabel setText:content WithFont:[UIFont boldSystemFontOfSize:16.0] AndColor:[UIColor whiteColor]];
            float height=[_contentLabel boundingHeightForWidth:frame.size.width-7];
            
            _contentLabel.frame=CGRectMake(_contentLabel.frame.origin.x, _contentLabel.frame.origin.y, frame.size.width-7, iOS7?height:(height+4));
            

            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width,[_contentLabel boundingHeightForWidth:frame.size.width-14]+20);
            [self addSubview:_contentLabel];
        }
        // Initialization code
    }
    return self;
}

- (void)show
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    NSLog(@"show");
    self.alpha = 1;
    
    [self.layer addAnimation:popAnimation forKey:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSelector:@selector(hide) withObject:nil afterDelay:1.5];
    });

}


- (void)showtwo
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    NSLog(@"show");
    self.alpha = 1;
    
    [self.layer addAnimation:popAnimation forKey:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSelector:@selector(hide) withObject:nil afterDelay:3.0];
    });
    
}

- (void)hide
{
   // NSLog(@"hideAlertAction");
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //NSLog(@"animationDidStop");
    
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
