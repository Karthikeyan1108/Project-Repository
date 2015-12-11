//
//  ViewController.h
//  biblappldem
//
//  Created by admin on 09/06/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatabaseManager.h"


@interface ViewController : UIViewController

{
    NSMutableArray *oldchapters, *newchapters;
    
    IBOutlet UITableView *main;
    
}
@end

