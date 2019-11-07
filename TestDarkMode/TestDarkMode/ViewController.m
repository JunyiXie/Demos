//
//  ViewController.m
//  TestDarkMode
//
//  Created by 谢俊逸 on 2019/11/6.
//  Copyright © 2019 谢俊逸. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    /// 1. 模拟用户切换 2. 模拟强制切换
//    [self currentStyle];
//
//
//    // 1. 模拟强切开关 变更
//    NSLog(@"force light");
//    [self setIsForceLightMode:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self currentStyle];
//
//        NSLog(@"don't force light");
//        [self setIsForceLightMode:NO];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self currentStyle];
//
//            NSLog(@"force light");
//            [self setIsForceLightMode:YES];
//        });
//    });
//
//    NSLog(@"%@", [self keyWindow]);
//
//    UIImage *image = [UIImage imageNamed:@""];
//
//    [image imageWithConfiguration:[image.configuration configurationWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 强制改为light
//    [self setIsForceLightMode:YES];

}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@"traitCollectionDidChange: %@", [UITraitCollection currentTraitCollection].userInterfaceStyle == UIUserInterfaceStyleLight ? @"light" : @"dark");
}

/**
 更改强制状态，判断是否通知。
 */
- (void)setIsForceLightMode:(BOOL)isForce {
    if (isForce) {
        [self keyWindow].overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    } else {
        [self keyWindow].overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
    }
}

- (void)currentStyle {
    // 优先覆盖的
    if ([self keyWindow].traitCollection.userInterfaceStyle != UIUserInterfaceStyleUnspecified) {
        NSLog(@"currentStyle %@", [self keyWindow].traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight ? @"light" : @"dark");
    } else {
        NSLog(@"currentStyle %@", [UITraitCollection currentTraitCollection].userInterfaceStyle == UIUserInterfaceStyleLight ? @"light" : @"dark");
    }
}

- (UIWindow *)keyWindow {
    UIWindow* window = nil;

    if (@available(iOS 13.0, *))
    {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
        {
            // ios13 不能准确拿到。UISceneActivationStateForegroundActive 时机比较早，则没有对应的
            window = windowScene.windows.firstObject;
            break;
        }
    }else{
        window = [UIApplication sharedApplication].keyWindow;
    }

    return window;
}

@end
