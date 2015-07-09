//
//  ScannerViewController.h
//  iTest
//
//  Created by Allen Chan on 7/9/15.
//  Copyright (c) 2015 Allen Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTBBarcodeScanner.h"

@interface ScannerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *scanView;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet UITextField *textinput;
@property (strong,nonatomic)MTBBarcodeScanner* scanner;
@property (strong, nonatomic) NSMutableArray *scancodes;
@end
