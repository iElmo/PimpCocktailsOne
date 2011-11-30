//
//  Common.m
//  PimpCocktails
//
//  Created by Dan on 18/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Common.h"

@implementation Common

void drawLinearGradient (CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor){
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat locations [] ={ 0, 1 };
    
    NSArray *colours = [NSArray arrayWithObjects:(id) startColor, (id) endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) colours, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    
    CGContextAddRect(context, rect);
    
    CGContextClip(context);

    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
}


@end
