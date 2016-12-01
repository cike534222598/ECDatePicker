//
//  ECDatePicker.m
//  BeautyShop
//
//  Created by SSIC on 16/1/23.
//  Copyright © 2016年 SSIC. All rights reserved.
//

#import "ECDatePicker.h"

@implementation ECDatePicker


#pragma mark ------INIT------
-(id)initWithView:(UIView *)view delegate:(id<ECDatePickerDelegate>)delegate backColor:(UIColor *)backgroundColor buttonTitleColor:(UIColor *)titleColor pickerStyle:(ECDatePickerStyle)style
{
    if (self = [super init]) {
        
        _baseView = view;
        _delegate = delegate;
        _isBeforeTime = YES;
        _isAfterTime = YES;
        
        _maskView = [[UIView alloc] initWithFrame:_baseView.frame];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0;
        [_maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popDatePicker)]];
        [_baseView addSubview:_maskView];
        
        
        _datePickerView = [[UIView alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width,256)];
        _datePickerView.backgroundColor = backgroundColor;
        [_baseView addSubview:_datePickerView];
        
        
        _datePicker = [[UIDatePicker alloc]init];
        _datePicker.frame = CGRectMake(0,40,_datePickerView.frame.size.width,216);
        _datePicker.date = [NSDate date];
        _datePicker.backgroundColor = [UIColor whiteColor];
        self.theTypeOfDatePicker = style;
        [_datePickerView addSubview:_datePicker];

        
        _dateConfirmButton = [[UIButton alloc] initWithFrame:CGRectMake(_datePickerView.frame.size.width/2,0,_datePickerView.frame.size.width/2,40)];
        [_dateConfirmButton setTitle:@"确定" forState:UIControlStateNormal];
        _dateConfirmButton.titleLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        _dateConfirmButton.userInteractionEnabled = YES;
        _dateConfirmButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _dateConfirmButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        [_dateConfirmButton addTarget:self action:@selector(dateConfirmClick) forControlEvents:UIControlEventTouchUpInside];
        [_dateConfirmButton setTitleColor:titleColor forState:UIControlStateNormal];
        [_datePickerView addSubview:_dateConfirmButton];
        
        
        _dateCancleButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,_datePickerView.frame.size.width/2,40)];
        [_dateCancleButton setTitle:@"取消" forState:UIControlStateNormal];
        _dateCancleButton.titleLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:15];
        _dateCancleButton.userInteractionEnabled = YES;
        _dateCancleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _dateCancleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [_dateCancleButton addTarget:self action:@selector(popDatePicker) forControlEvents:UIControlEventTouchUpInside];
        [_dateCancleButton setTitleColor:titleColor forState:UIControlStateNormal];
        [_datePickerView addSubview:_dateCancleButton];
    }
    
    return self;
}


#pragma mark ------ACTION------
//确定选择
-(void)dateConfirmClick
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    switch (_theTypeOfDatePicker) {
        case ECTimeStyle:
        {
            [formatter setDateFormat:@"HH:mm"];
        }
            break;
        case ECDateStyle:
        {
            [formatter setDateFormat:@"yyyy-MM-dd"];
        }
            break;
        case ECAllStyle:
        {
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        }
            break;
            
        default:
            break;
    }
    
    NSString *string = [formatter stringFromDate:[_datePicker date]];
    [self.delegate ECDatePickerDidConfirm:string];
    [self popDatePicker];
    _datePicker.date = [NSDate date];
}



//是否可选择以前的时间
-(void)setIsBeforeTime:(BOOL)isBeforeTime
{
    if (isBeforeTime == NO) {
        [_datePicker setMinimumDate:[NSDate date]];
    }
    else{
        [_datePicker setMinimumDate:[NSDate dateWithTimeIntervalSince1970:0]];
    }
}


//是否可选择以后的时间
- (void)setIsAfterTime:(BOOL)isAfterTime
{
    if (isAfterTime == NO) {
        [_datePicker setMaximumDate:[NSDate date]];
    }
    else{
        [_datePicker setMaximumDate:nil];
    }
}


- (void)pickerViewBeforeTimeWithDate:(NSDate *)date
{
    if ([self compareOneDay:date withAnotherDay:[NSDate date]] == -1) {
        self.isBeforeTime = YES;
    }
    [_datePicker setMinimumDate:date];
}



- (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
}



- (void)setShowDate:(NSDate *)showDate
{    
    if (showDate) {
        _showDate = showDate;
    }else{
        _showDate = [NSDate date];
    }
    _datePicker.date = _showDate;
}



#pragma mark ------TYPE------
-(void)setTheTypeOfDatePicker:(ECDatePickerStyle)theTypeOfDatePicker
{
    _theTypeOfDatePicker = theTypeOfDatePicker;
    
    if (theTypeOfDatePicker == ECTimeStyle) {
        //只显示时间
        _datePicker.datePickerMode = UIDatePickerModeTime;
    }
    else if(theTypeOfDatePicker == ECDateStyle){
        //只显示日期
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }
    else if(theTypeOfDatePicker == ECAllStyle){
        //时间与日期都显示
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }
    else{
        NSLog(@"时间类别选择错误");
    }
}


#pragma mark ------PICKERVIEW动画效果------
//出现
-(void)pushDatePicker
{
    [UIView animateWithDuration:0.3 animations:^{
        _maskView.alpha = 0.3;
        _datePickerView.frame = CGRectMake(0,_baseView.frame.size.height-256,_baseView.frame.size.width,256);
    }];
}


//消失
-(void)popDatePicker
{
    [UIView animateWithDuration:0.3 animations:^{
        _maskView.alpha = 0;
        _datePickerView.frame = CGRectMake(0,_baseView.frame.size.height,_baseView.frame.size.width,256);
    }];
}


#pragma mark ------DEALLOC------
-(void)dealloc
{
    self.delegate = nil;
}


@end
