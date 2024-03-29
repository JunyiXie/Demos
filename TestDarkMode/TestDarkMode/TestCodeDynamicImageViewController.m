//
//  TestCodeDynamicImageViewController.m
//  TestDarkMode
//
//  Created by 谢俊逸 on 2019/11/7.
//  Copyright © 2019 谢俊逸. All rights reserved.
//

#import "TestCodeDynamicImageViewController.h"
#import "UIImage+DarkModeDynamic.h"

/// https://gist.github.com/timonus/8b4feb47eccb6dde47ca6320d8fc6b11 查看这个


@interface TestCodeDynamicImageViewController ()

@end

@implementation TestCodeDynamicImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imgView];
    
    // load from assets
    UIImage *day = [UIImage imageNamed:@"Day"];
    UIImage *night = [UIImage imageNamed:@"Night"];
    
    NSLog(@"day %@", day.configuration);
    NSLog(@"night %@", night.configuration);
    
    // normal resources
    UIImage *day1 = [UIImage imageNamed:@"Day1.jpg"];
    UIImage *night1 = [UIImage imageNamed:@"Dight1.jpg"];
    
    NSLog(@"day1 %@", day1.configuration);
    NSLog(@"night1 %@", night1.configuration);
    
    // 这个处理过了configuration
    imgView.image = [UIImage imageWithLightImageBlock:^UIImage * _Nonnull{
        return day1;
    } darkImageBlock:^UIImage * _Nonnull{
        return night1;
    }];
    
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
