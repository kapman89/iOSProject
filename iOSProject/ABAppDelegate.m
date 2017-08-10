//
//  ABAppDelegate.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/5/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAppDelegate.h"

#import "ABUsersViewController.h"
#import "ABUser.h"
#import "ABArrayModel.h"

#import "NSObject+ABObjectExtension.h"

static const NSUInteger usersCount    = 3000;

@interface ABAppDelegate ()

@end

@implementation ABAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;

    ABUsersViewController *controller = [ABUsersViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    ABArrayModel *arrayModel = [[ABArrayModel alloc] initWithObjects:[ABUser objectsWithCount:usersCount]];
    self.arrayModel = arrayModel;
    
    controller.users = arrayModel;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.arrayModel saveData];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.arrayModel loadData];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
