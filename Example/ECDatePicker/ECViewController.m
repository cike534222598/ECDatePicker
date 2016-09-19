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
    self.datePicker = [[ECDatePicker alloc] initWithView:self.view delegate:self backColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.7f] buttonTitleColor:[UIColor orangeColor] pickerStyle:ECAllStyle];
}


- (void)ECDatePickerDidConfirm:(NSString *)confirmString
{
    self.dateLabel.text = confirmString;
}


- (IBAction)dateClick:(UIButton *)sender
{
    [self.datePicker pushDatePicker];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
