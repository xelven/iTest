//
//  FirstViewController.h
//  iTest
//
//  Created by Allen Chan on 7/8/15.
//  Copyright (c) 2015 Allen Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray* arrayData;
}
// was retain
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

