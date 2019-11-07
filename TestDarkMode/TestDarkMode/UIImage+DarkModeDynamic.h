//
//  UIImage+DarkModeDynamic.h
//  TestDarkMode
//
//  Created by 谢俊逸 on 2019/11/7.
//  Copyright © 2019 谢俊逸. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DarkModeDynamic)
+ (instancetype)imageWithLightImageBlock:(UIImage *(^)(void))lightImageBlock
                          darkImageBlock:(UIImage *(^)(void))darkImageBlock;
@end

NS_ASSUME_NONNULL_END
