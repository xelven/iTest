//
//  ScannerViewController.m
//  iTest
//
//  Created by Allen Chan on 7/9/15.
//  Copyright (c) 2015 Allen Chan. All rights reserved.
//

#import "ScannerViewController.h"

@interface ScannerViewController ()

@end

@implementation ScannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scancodes = [[NSMutableArray alloc]init];
    self.scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:self.scanView];
    [self startScan];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startScan{
    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if (success) {
            
            [self.scanner startScanningWithResultBlock:^(NSArray *codes) {
                AVMetadataMachineReadableCodeObject *code = [codes firstObject];
                NSLog(@"Found code: %@", code.stringValue);
                
                [self.scancodes addObject:code.stringValue];
                [self.scanner stopScanning];
                [self.tableview reloadData];
            }];
            
        } else {
            // The user denied access to the camera
            NSLog(@"The user denied access to the camera");
        }
    }];
}
- (IBAction)inputFinishAction:(id)sender {
    if([self.textinput.text length] > 0){
        [self.scancodes addObject:self.textinput.text];
        [self.textinput setText:@""];
        [self.textinput resignFirstResponder];
        [self.tableview reloadData];
    }
}

- (IBAction)rescanAction:(id)sender {
    [self startScan];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(self.scancodes != nil)
        return [self.scancodes count];
    else
        return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"codesCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if(self.scancodes != nil){
        NSString* eventText = [self.scancodes objectAtIndex:indexPath.row];
        UILabel *itemName = (UILabel *)[cell viewWithTag:1000];
        [itemName setText:eventText];
        
    }
    return cell;
}
@end
