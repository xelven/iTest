//
//  CalendarViewController.h
//  iTest
//
//  Created by Allen Chan on 7/9/15.
//  Copyright (c) 2015 Allen Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTCalendar.h"

@interface CalendarViewController : UIViewController<JTCalendarDataSource,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;
@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (strong, nonatomic) JTCalendar *calendar;
@property (strong, nonatomic) NSArray *currentEvents;
@end
