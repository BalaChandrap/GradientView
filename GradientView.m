//
//  Gradient.m
//  gradientSample
//
//  Created by Bala Chandra on 28/03/16.
//  Copyright © 2016 neobric. All rights reserved.
//

#import "GradientView.h"


@implementation GradientView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize rating;
-(id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.333 green:0.333 blue:0.333 alpha:1];
        
        width = (frame.size.width-4)/5;
        
        NSLog(@"the width is %f",width);
        
        self.rating  = @"0";
        
        gradientDisplay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
          [self addSubview:gradientDisplay];
        
        [self drawGradientOverContainer:gradientDisplay];
        [self drawMaskwithRating:0];
        
        
        UILabel *oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, frame.size.height)];
        oneLabel.text = @"1";
        oneLabel.textColor = [UIColor whiteColor];
        oneLabel.tag = 1;
        oneLabel.textAlignment = NSTextAlignmentCenter;
        oneLabel.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateRating:)];
        tapGestureRecognizer1.numberOfTapsRequired = 1;
        [oneLabel addGestureRecognizer:tapGestureRecognizer1];
        oneLabel.userInteractionEnabled = YES;
        
        [self addSubview:oneLabel];
        
        UILabel *twoLabel = [[UILabel alloc] initWithFrame:CGRectMake(width+1, 0, width, frame.size.height)];
        twoLabel.text = @"2";
        twoLabel.textColor = [UIColor whiteColor];
        twoLabel.tag = 2;
        twoLabel.textAlignment = NSTextAlignmentCenter;
        twoLabel.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateRating:)];
        tapGestureRecognizer2.numberOfTapsRequired = 1;
        [twoLabel addGestureRecognizer:tapGestureRecognizer2];
        twoLabel.userInteractionEnabled = YES;
        
        [self addSubview:twoLabel];
        
        UILabel *threeLabel = [[UILabel alloc] initWithFrame:CGRectMake(width*2+2, 0, width, frame.size.height)];
        threeLabel.text = @"3";
        threeLabel.textColor = [UIColor whiteColor];
        threeLabel.tag = 3;
        threeLabel.textAlignment = NSTextAlignmentCenter;
        threeLabel.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateRating:)];
        tapGestureRecognizer3.numberOfTapsRequired = 1;
        [threeLabel addGestureRecognizer:tapGestureRecognizer3];
        threeLabel.userInteractionEnabled = YES;
        
        [self addSubview:threeLabel];
        
        UILabel *fourLabel = [[UILabel alloc] initWithFrame:CGRectMake(width*3+3, 0, width, frame.size.height)];
        fourLabel.text = @"4";
        fourLabel.textColor = [UIColor whiteColor];
        fourLabel.tag = 4;
        fourLabel.textAlignment = NSTextAlignmentCenter;
        fourLabel.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tapGestureRecognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateRating:)];
        tapGestureRecognizer4.numberOfTapsRequired = 1;
        [fourLabel addGestureRecognizer:tapGestureRecognizer4];
        fourLabel.userInteractionEnabled = YES;
        
        [self addSubview:fourLabel];
        
        UILabel *fiveLabel = [[UILabel alloc] initWithFrame:CGRectMake(width*4+4, 0, width, frame.size.height)];
        fiveLabel.text = @"5";
        fiveLabel.textColor = [UIColor whiteColor];
        fiveLabel.tag = 5;
        fiveLabel.textAlignment = NSTextAlignmentCenter;
        fiveLabel.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tapGestureRecognizer5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateRating:)];
        tapGestureRecognizer5.numberOfTapsRequired = 1;
        [fiveLabel addGestureRecognizer:tapGestureRecognizer5];
        fiveLabel.userInteractionEnabled = YES;
        
        [self addSubview:fiveLabel];
        
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(width, 0, 1, frame.size.height)];
        line1.backgroundColor = [UIColor whiteColor];
        [self addSubview:line1];
        
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(width*2+1, 0, 1, frame.size.height)];
        line2.backgroundColor = [UIColor whiteColor];
        [self addSubview:line2];
        
        UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(width*3+2, 0, 1, frame.size.height)];
        line3.backgroundColor = [UIColor whiteColor];
        [self addSubview:line3];
        
        UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(width*4+3, 0, 1, frame.size.height)];
        line4.backgroundColor = [UIColor whiteColor];
        [self addSubview:line4];
        
       
        
        
        
    }
    return self;
}


-(void)updateRating:(UITapGestureRecognizer *)sender
{
    int ratingValue = (int)sender.view.tag;
    self.rating = [NSString stringWithFormat:@"%d",ratingValue];
    
    
    NSLog(@"rating given is %d",ratingValue);
    
    gradientDisplay.layer.mask = nil;
    
    [self drawMaskwithRating:ratingValue];
    
}

-(void)drawMaskwithRating:(int)ratingGiven
{
    float maskStartFrom = width*ratingGiven + 1*(ratingGiven-1);
    NSLog(@"mask start from value is %f",maskStartFrom);
    CALayer *maskLayer = [CALayer layer];
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    maskLayer.frame = CGRectMake(0, 0.0, maskStartFrom, gradientDisplay.frame.size.height);
    
    gradientDisplay.layer.mask = maskLayer;
    
    NSLog(@"rating is %@",self.rating);
}

-(void)drawGradientOverContainer:(UIView *)container
{
    UIColor *orange = [UIColor orangeColor];
    UIColor *red = [UIColor redColor];
    UIColor *green = [UIColor greenColor];
    CAGradientLayer *maskLayer = [CAGradientLayer layer];
    maskLayer.opacity = 0.8;
    maskLayer.colors = [NSArray arrayWithObjects:(id)red.CGColor,
                        (id)red.CGColor,(id)orange.CGColor, (id)green.CGColor, (id)green.CGColor, nil];
    
    // Hoizontal - commenting these two lines will make the gradient veritcal
    maskLayer.startPoint = CGPointMake(0.0, 0.5);
    maskLayer.endPoint = CGPointMake(1.0, 0.5);
    
    NSNumber *gradTopStart = [NSNumber numberWithFloat:0.0];
    NSNumber *gradTopEnd = [NSNumber numberWithFloat:0.4];
    NSNumber *gradBottomStart = [NSNumber numberWithFloat:0.6];
    NSNumber *gradBottomEnd = [NSNumber numberWithFloat:1.0];
    maskLayer.locations = @[gradTopStart, gradTopEnd, gradBottomStart, gradBottomEnd];
    
    maskLayer.bounds = container.bounds;
    maskLayer.anchorPoint = CGPointZero;
    [container.layer addSublayer:maskLayer];
}
@end
