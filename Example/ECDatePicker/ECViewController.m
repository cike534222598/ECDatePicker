//
//  ECViewController.m
//  ECDatePicker
//
//  Created by Jame on 09/19/2016.
//  Copyright (c) 2016 Jame. All rights reserved.
//

#import "ECViewController.h"
#import "ECDatePicker.h"

@interface ECViewController () <ECDatePickerDelegate>

@property (nonatomic, strong) ECDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ECViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self creatDatePicker];
}


- (void)creatDatePicker
{
    NSDateFormatter *dateFormatter = [NSDate shareDateFormatter];
    [dateFormatter setDateFormat:kDateFormatYYYYMMDD];
    NSDate *maxDate = [dateFormatter dateFromString:@"2050-01-01"];
    NSDate *minDate = [dateFormatter dateFromString:@"2016-01-01"];
    
    self.datePicker = [[ECDatePicker alloc] initDatePickerMode:ECDatePickerModeYearAndMonth minDate:minDate maxMamDate:maxDate andAddToSuperView:self.view];
    self.datePicker.delegate = self;
}


- (IBAction)dateClick:(UIButton *)sender
{
    [self.datePicker show];
}


- (void)datePicker:(ECDatePicker *)datePicker didSelectedDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    if (datePicker.datePickerMode == ECDatePickerModeDate) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    } else if (datePicker.datePickerMode == ECDatePickerModeTime) {
        [dateFormatter setDateFormat:@"HH:mm:ss"];
    } else if (datePicker.datePickerMode == ECDatePickerModeYearAndMonth){
        [dateFormatter setDateFormat:@"yyyy-MM"];
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    
    NSString *value = [dateFormatter stringFromDate:date];
    self.dateLabel.text = value;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
