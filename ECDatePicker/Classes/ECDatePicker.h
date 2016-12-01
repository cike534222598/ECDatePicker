//
//  ECDatePicker.h
//  BeautyShop
//
//  Created by SSIC on 16/1/23.
//  Copyright © 2016年 SSIC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



#pragma mark ------PROTOCOL------
@protocol ECDatePickerDelegate <NSObject>

-(void)ECDatePickerDidConfirm:(NSString *)confirmString;

@end



#pragma mark ------PICKERSTYLE------
typedef enum {
    /**
     *  只显示时间
     */
    ECTimeStyle = 0,
    /**
     *  只显示日期
     */
    ECDateStyle = 1,
    /**
     *  显示日期和时间
     */
    ECAllStyle = 2,

} ECDatePickerStyle;



#pragma mark ------PICKER------
@interface ECDatePicker : NSObject
{
    UIView *_baseView;                      //datePicker根视图
    UIView *_datePickerView;                //datePicker背景
    UIDatePicker *_datePicker;              //datePicker
    UIButton *_dateConfirmButton;           //确定Button
    UIButton *_dateCancleButton;            //取消Button
    UIView *_maskView;                      //阴影View
}

@property (nonatomic, unsafe_unretained) id <ECDatePickerDelegate> delegate;

//是否可选择当前时间以前的时间,默认为YES
@property (nonatomic, assign) BOOL isBeforeTime;

//是否可以选择当前时间以后的时间,默认为YES
@property (nonatomic, assign) BOOL isAfterTime;

//datePicker显示类别,分别为1=只显示时间,2=只显示日期，3=显示日期和时间(默认为3)
@property (nonatomic,assign) ECDatePickerStyle theTypeOfDatePicker;

//默认显示时间
@property (nonatomic, copy) NSDate *showDate;


#pragma mark ------ACTION------
-(id)initWithView:(UIView *)view delegate:(id<ECDatePickerDelegate>)delegate backColor:(UIColor *)backgroundColor buttonTitleColor:(UIColor *)titleColor pickerStyle:(ECDatePickerStyle)style;

//设置pickerView不能早于date
- (void)pickerViewBeforeTimeWithDate:(NSDate *)date;

//出现
-(void)pushDatePicker;

//消失
-(void)popDatePicker;

@end
