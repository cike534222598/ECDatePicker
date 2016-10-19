//
//  ECDatePicker.h
//  BeautyShop
//
//  Created by SSIC on 16/1/23.
//  Copyright © 2016年 SSIC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSDate+ECDatePicker.h"

typedef NS_ENUM(NSInteger,ECDatePickerMode) {
    ECDatePickerModeTime,    // Displays hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. 6 | 53 | PM)
    ECDatePickerModeDate,     // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
    ECDatePickerModeDateAndTime, // Displays date, hour, minute, and optionally AM/PM designation depending on the locale setting (e.g. Wed Nov 15 | 6 | 53 | PM)
    ECDatePickerModeYearAndMonth // Displays Year, Month,  designation depending on the locale setting (e.g. November | 2007)
};

@class ECDatePicker;

@protocol ECDatePickerDelegate<NSObject>
@optional
- (void)datePicker:(ECDatePicker *)datePicker dateDidChange:(NSDate *)date;
- (void)datePicker:(ECDatePicker *)datePicker didCancel:(UIButton *)sender;
- (void)datePicker:(ECDatePicker *)datePicker didSelectedDate:(NSDate *)date;
@end

@interface ECDatePicker : UIControl
/**
 *  Title on the top of HooDatePicker
 */
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSDate *date;
/**
 *  specify min/max date range. default is nil. When min > max, the values are ignored.
 */
@property (nonatomic, strong) NSDate *minimumDate;

@property (nonatomic, strong) NSDate *maximumDate;
/**
 * default is HooDatePickerModeDate. setting nil returns to default
 */
@property (nonatomic, assign) ECDatePickerMode datePickerMode;
/**
 *  default is [NSLocale currentLocale]. setting nil returns to default
 */
@property(nonatomic,strong) NSLocale      *locale;
/**
 *  default is [NSCalendar currentCalendar]. setting nil returns to default
 */
@property(nonatomic,copy)   NSCalendar    *calendar;
/**
 *   default is nil. use current time zone or time zone from calendar
 */
@property(nonatomic,strong) NSTimeZone    *timeZone;
/**
 *  read only property, indicate in datepicker is open.
 */
@property(nonatomic,readonly) BOOL        isOpen;

@property (nonatomic, weak) id<ECDatePickerDelegate> delegate;

- (instancetype)initWithSuperView:(UIView*)superView;

- (instancetype)initDatePickerMode:(ECDatePickerMode)datePickerMode andAddToSuperView:(UIView *)superView;

- (instancetype)initDatePickerMode:(ECDatePickerMode)datePickerMode minDate:(NSDate *)minimumDate maxMamDate:(NSDate *)maximumDate  andAddToSuperView:(UIView *)superView;

- (void)setDate:(NSDate *)date animated:(BOOL)animated;

- (void)setTintColor:(UIColor *)tintColor;

- (void)setHighlightColor:(UIColor *)highlightColor;

- (void)show;

- (void)dismiss;


@end
