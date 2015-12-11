//
//  ViewController.m
//  biblappldem
//
//  Created by admin on 09/06/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    oldchapters = [[NSMutableArray alloc] init];
    
    newchapters = [[NSMutableArray alloc] init];
    
    main.dataSource=self;
    
    main.delegate=self;
    
   // NSLog(@"Content array %@",[[DatabaseManager sharedManager]getAllcontents]);
    
   // [newchapters addObjectsFromArray:[[DatabaseManager sharedManager]getAllcontents]];
    [newchapters addObjectsFromArray:[[DatabaseManager sharedManager]getcontent1]];

    
    NSLog(@"new %@",newchapters);
  
       [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Old Testament";
    }
    return @"New Testament";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        
        return oldchapters.count;
    }
    
    return newchapters.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
    }
    
    
    NSString* str=[NSString stringWithFormat:@"%@ %@", [[newchapters objectAtIndex:indexPath.row] objectForKey:@"Eng_chapname" ], [[newchapters objectAtIndex:indexPath.row] objectForKey:@"Content" ]];
    
    
    cell.textLabel.text=str;

    
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
