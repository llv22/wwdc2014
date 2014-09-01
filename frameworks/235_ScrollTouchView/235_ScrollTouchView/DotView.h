//
//  DotView.h
//  235_ScrollTouchView
//
//  Created by llv23 on 9/1/14.
//  Copyright (c) 2014 llv23. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DotView : UIView

+ (DotView*) randomDotView;
+ (void) arrangeDotsRandomlyInView : (UIView*)view;

@end
