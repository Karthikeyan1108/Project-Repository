//
//  AppDelegate.h
//  biblappldem
//
//  Created by admin on 09/06/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
     sqlite3			*database_MIA;
}

@property (strong, nonatomic) UIWindow *window;


@end

