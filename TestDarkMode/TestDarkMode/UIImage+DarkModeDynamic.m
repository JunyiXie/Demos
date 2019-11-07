//
//  UIImage+DarkModeDynamic.m
//  TestDarkMode
//
//  Created by 谢俊逸 on 2019/11/7.
//  Copyright © 2019 谢俊逸. All rights reserved.
//

#import "UIImage+DarkModeDynamic.h"

@implementation UIImage (DarkModeDynamic)
+ (instancetype)imageWithLightImageBlock:(UIImage *(^)(void))lightImageBlock
                          darkImageBlock:(UIImage *(^)(void))darkImageBlock
{
    
    __block UIImage *image = nil;
    if (@available(iOS 13.0, *)) {
        UITraitCollection *const scaleTraitCollection = [UITraitCollection currentTraitCollection];
        
        UITraitCollection *const lightUnscaledTraitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
        UITraitCollection *const darkUnscaledTraitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
        
        UITraitCollection *const lightScaledTraitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[scaleTraitCollection, lightUnscaledTraitCollection]];
        UITraitCollection *const darkScaledTraitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[scaleTraitCollection, darkUnscaledTraitCollection]];
        
        [lightScaledTraitCollection performAsCurrentTraitCollection:^{
            image = lightImageBlock();
            image = [image imageWithConfiguration:[image.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]]];
        }];
        __block UIImage *darkImage;
        [darkScaledTraitCollection performAsCurrentTraitCollection:^{
            darkImage = darkImageBlock();
            darkImage = [darkImage imageWithConfiguration:[darkImage.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]]];
        }];
        
        [image.imageAsset registerImage:darkImage withTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]];
    } else {
        image = lightImageBlock();
    }
    return image;
}
@end
