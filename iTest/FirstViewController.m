//
//  FirstViewController.m
//  iTest
//
//  Created by Allen Chan on 7/8/15.
//  Copyright (c) 2015 Allen Chan. All rights reserved.
//

#import "FirstViewController.h"
#import "ItemData.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

-(void)initData
{
    arrayData = [[NSMutableArray alloc]initWithCapacity:5];
    
    ItemData *item = [[ItemData alloc] init];
    item.itemName = @"11:00 花蓮縣..";
    item.itemName2 = @"配送 16KGX3";
    item.userName = @"范先生";
    item.PhoneNumber = @"0980282656";
    [arrayData addObject:item];
//    [item release];
    
    ItemData *item2 = [[ItemData alloc] init];
    item2.itemName = @"11:00 花蓮縣..";
    item2.itemName2 = @"配送 16KGX3";
    item2.userName = @"范先生";
    item2.PhoneNumber = @"0980282656";
    [arrayData addObject:item2];
//    [item2 release];
    
    ItemData *item3 = [[ItemData alloc] init];
    item3.itemName = @"11:00 花蓮縣..";
    item3.itemName2 = @"配送 16KGX3";
    item3.userName = @"范先生";
    item3.PhoneNumber = @"0980282656";
    [arrayData addObject:item3];
//    [item3 release];
    
    ItemData *item4 = [[ItemData alloc] init];
    item4.itemName = @"11:00 花蓮縣..";
    item4.itemName2 = @"配送 16KGX3";
    item4.userName = @"范先生";
    item4.PhoneNumber = @"0980282656";
    [arrayData addObject:item4];
//    [item4 release];
    
    ItemData *item5 = [[ItemData alloc] init];
    item5.itemName = @"11:00 花蓮縣..";
    item5.itemName2 = @"配送 16KGX3";
    item5.userName = @"范先生";
    item5.PhoneNumber = @"00471122345";
    [arrayData addObject:item5];
//    [item5 release];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //init array data
    [self initData];
    [[self tableView]setDelegate:self];
    [[self tableView]setDataSource:self];
    [[self tableView]reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takeAction:(id)sender {
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle ==UITableViewCellEditingStyleDelete)
    {
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayData count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"type1"];
    
    ItemData* item = [arrayData objectAtIndex:indexPath.row];
    if(item){
        UIImageView *image = (UIImageView *)[cell viewWithTag:100];
        [image setHidden:NO];
        UILabel *itemName = (UILabel *)[cell viewWithTag:101];
        [itemName setText:item.itemName];
        UILabel *itemName2 = (UILabel *)[cell viewWithTag:102];
        [itemName2 setText:item.itemName2];
        UILabel *userName = (UILabel *)[cell viewWithTag:103];
        [userName setText:item.userName];
        UITextView *phoneNumber = (UITextView *)[cell viewWithTag:104];
        phoneNumber.editable = NO;
//        textview.dataDetectorTypes = UIDataDetectorTypeAll
        [phoneNumber setDataDetectorTypes:UIDataDetectorTypePhoneNumber];
        [phoneNumber setText:item.PhoneNumber];
    }
    return cell;
}

/*
- (void)dealloc {
    [arrayData release];
    [_tableView release];
    [super dealloc];
}
 */
    
@end
