//
//  ViewController.m
//  日期计算器
//
//  Created by Tzion on 15/4/27.
//  Copyright (c) 2015年 Dongqw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *Date;

@end

@implementation ViewController
@synthesize label,Date;

- (void)viewDidLoad {
    [super viewDidLoad];
    Date.minimumDate = Date.date;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:Date.date];
    dateComponents.year = dateComponents.year + 1;
    Date.maximumDate = [calendar dateFromComponents:dateComponents];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)DateChanged:(UIDatePicker *)sender {
    NSDate *now = [NSDate date];
    NSInteger seconds = [Date.date timeIntervalSinceDate:now];
    NSInteger days = seconds/(60*60*24);
    if(seconds%(60*60*24)>0)
        days = days+1;
    label.text = [NSString stringWithFormat:@"%ld",days];
}


@end
