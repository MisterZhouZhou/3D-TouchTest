//
//  AppDelegate.m
//  3DTouchTest
//
//  Created by rayootech on 16/3/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "AppDelegate.h"
#import "My3DTouchViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark-3DTouch添加的代理方法
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    //判断设定的唯一标识,当选择
    if ([shortcutItem.type isEqualToString:@"类型1"]) {
        My3DTouchViewController *vc = [[My3DTouchViewController alloc]init];
        self.window.rootViewController = vc;
    }
    if ([shortcutItem.localizedTitle isEqualToString:@"标题1"]) {
        
    }
    if ([shortcutItem.localizedTitle isEqualToString:@"标题1"]) {
        
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 判断系统版本，如果系统版本大于等于9.0,可以设置3D Touch
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        
        // 自定义图标
        UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"图片名称"];
        //定义type,标题,子标题，图片
        UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"类型1" localizedTitle:@"标题1" localizedSubtitle:@"子标题1" icon:icon1 userInfo:nil];
        //定义type,标题,子标题，图片
        UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"类型2" localizedTitle:@"标题2" localizedSubtitle:@"子标题2" icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeCompose] userInfo:nil];
        //定义type,标题,子标题，图片
        UIApplicationShortcutItem *shortItem3 = [[UIApplicationShortcutItem alloc] initWithType:@"类型3" localizedTitle:@"标题3" localizedSubtitle:@"子标题3" icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeCompose] userInfo:nil];
        // item 数组
        NSArray *shortItems = [[NSArray alloc] initWithObjects: shortItem1,shortItem2, shortItem3,nil];
        
        NSArray *existingItems = [UIApplication sharedApplication].shortcutItems;
        
        NSArray *updatedItems = [existingItems arrayByAddingObjectsFromArray:shortItems];
        // 设置按钮
        [UIApplication sharedApplication].shortcutItems = updatedItems;
        
     
    }

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *naviVc = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = naviVc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)setting3DTouchModule{
    // 判断系统版本，如果系统版本大于等于9.0,可以设置3D Touch
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        
        // 自定义图标
        UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"图片名称"];
        //定义type,标题,子标题，图片
        UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"类型1" localizedTitle:@"标题1" localizedSubtitle:@"子标题1" icon:icon1 userInfo:nil];
        //定义type,标题,子标题，图片
        UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"类型2" localizedTitle:@"标题2" localizedSubtitle:@"子标题2" icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeCompose] userInfo:nil];
         //定义type,标题,子标题，图片
         UIApplicationShortcutItem *shortItem3 = [[UIApplicationShortcutItem alloc] initWithType:@"类型3" localizedTitle:@"标题3" localizedSubtitle:@"子标题3" icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeLocation] userInfo:nil];
        // item 数组
        NSArray *shortItems = [[NSArray alloc] initWithObjects: shortItem1,shortItem2, shortItem3,nil];
        
        // 设置按钮
        [[UIApplication sharedApplication] setShortcutItems:shortItems];
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
