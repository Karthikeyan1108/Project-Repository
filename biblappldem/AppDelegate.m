//
//  AppDelegate.m
//  biblappldem
//
//  Created by admin on 09/06/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self copyDatabseIfNeeded];
    [self openAppDatabase];
   // [self closeAppDatabase];

    return YES;
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
- (NSString *)documentDirectoryPath
{
    NSArray *tempArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [tempArray objectAtIndex:0];
}

-(void)copyDatabseIfNeeded
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [[self documentDirectoryPath] stringByAppendingPathComponent:@"holybible.sqlite"];
    if (![fileManager fileExistsAtPath:filePath]) {
        NSString *bundlePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"holybible.sqlite"];
        if(![fileManager copyItemAtPath:bundlePath toPath:filePath error:nil]){
            NSLog(@"Copy not successful");
        }else {
            [self openAppDatabase];
        }
    }
}
-(void)openAppDatabase{
    NSString *dbPath = [[self documentDirectoryPath] stringByAppendingPathComponent:@"holybible.sqlite"];
    if (sqlite3_open([dbPath UTF8String], & database_MIA) == SQLITE_OK){
        //isDbOpenned = YES;
        NSLog(@"Database is opened");
    }else {
        //isDbOpenned = NO;
         NSLog(@"Database is not opened");
    }
    
}

-(void)closeAppDatabase{
    sqlite3_close(database_MIA);
    NSLog(@"Database is closed");
}


@end
