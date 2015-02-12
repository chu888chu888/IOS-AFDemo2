//
//  LoginView.m
//  noodleBlue
//
//  Created by apple on 15/1/15.
//  Copyright (c) 2015年 noodles. All rights reserved.
//

#import "LoginView.h"
#import "UIButton+Base.h"
#import "UIFont+Base.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
        
        //点击空白区域，键盘隐藏
        UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
        //不发送取消事件消息
        tapGr.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tapGr];
    }
    return self;
}

- (void) initialize
{
    [self setBack];
    [self addLogo];
    [self addView];
    
}

-(void) setBack{
    
    UIImageView *back = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, [UIView globalWidth], [UIView globalScreenHeight])];
    back.image = [UIImage imageNamed:@"bg_galaxy"];
    [self.linearLayoutView addSubview:back];
    
}

-(void) addLogo{
    
    UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, 110, 100)];
    
    [logo setImage:[UIImage imageNamed:@"logo"]];
    
    CSLinearLayoutItem *logoItem = [CSLinearLayoutItem layoutItemForView:logo];
    logoItem.padding = CSLinearLayoutMakePadding(50.0, 0.0, 0.0, 0.0);
    logoItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:logoItem];
}

-(void) addView
{
    UILabel *nameLeftLab = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 50, 30)];
    nameLeftLab.font = [UIFont fontWithName:@"iconfont" size:20];
    nameLeftLab.textColor = [UIColor whiteColor];
    nameLeftLab.text = @"   \U0000e613";
    
    UILabel *passwordLeftLab = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 50, 30)];
    passwordLeftLab.font = [UIFont fontWithName:@"iconfont" size:20];
    passwordLeftLab.textColor = [UIColor whiteColor];
    passwordLeftLab.text = @"   \U0000e608";
    
    _nameText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIView globalWidth] - 20, 44)];
    _nameText.keyboardType = UIKeyboardTypeEmailAddress;
    _nameText.borderStyle = UITextBorderStyleNone;
    _nameText.placeholder = @"请输入电话号码";
    _nameText.returnKeyType = UIReturnKeyDone;
    _nameText.textColor = [UIColor whiteColor];
    _nameText.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameText.layer.borderWidth = 1;
    _nameText.layer.borderColor = [[UIColor colorWithWhite:1 alpha:0.2] CGColor];
    _nameText.leftView = nameLeftLab;
    _nameText.leftViewMode = UITextFieldViewModeAlways;
    [_nameText setValue:[UIFont baseWithSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    //设置placeholder的颜色
    [_nameText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _nameText.delegate = self;
    
    CSLinearLayoutItem *nameTextItem = [CSLinearLayoutItem layoutItemForView:_nameText];
    nameTextItem.padding = CSLinearLayoutMakePadding(20.0, 10.0, 0.0, 10.0);
    nameTextItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:nameTextItem];
    
    _passwordText = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIView globalWidth] - 20, 44)];
    _passwordText.borderStyle = UITextBorderStyleNone;
    _passwordText.placeholder = @"请输入密码";
    _passwordText.secureTextEntry=YES;
    _passwordText.returnKeyType = UIReturnKeyDone;
    _passwordText.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _passwordText.textColor = [UIColor whiteColor];
    _passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordText.leftView = passwordLeftLab;
    _passwordText.leftViewMode = UITextFieldViewModeAlways;
    _passwordText.layer.borderWidth = 1;
    _passwordText.layer.borderColor = [[UIColor colorWithWhite:1 alpha:0.2] CGColor];
    [_passwordText setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordText setValue:[UIFont baseWithSize:15] forKeyPath:@"_placeholderLabel.font"];
    _passwordText.delegate = self;
    
    CSLinearLayoutItem *passwordTextItem = [CSLinearLayoutItem layoutItemForView:_passwordText];
    passwordTextItem.padding = CSLinearLayoutMakePadding(10.0, 10.0, 0.0, 10.0);
    passwordTextItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:passwordTextItem];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(97.0, 30.0, 50, 1)];
    line.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    
    _registerBtn = [UIButton baseButtonWithColor:[UIColor clearColor] andTitle:@"新用户?"];
    _registerBtn.frame = CGRectMake( [UIView globalWidth]- 170, 0.0, 150, 35);
    _registerBtn.titleLabel.font = [UIFont baseWithSize:15];
    [_registerBtn addSubview:line];
    _registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _findBtn = [UIButton baseButtonWithColor:[UIColor clearColor] andTitle:@"忘记密码？"];
    _findBtn.titleLabel.font = [UIFont baseWithSize:15];
    _findBtn.frame =CGRectMake(0.0, 0.0, 150, 35);
    _findBtn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
    UIView *btnItemsView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIView globalWidth] - 20, 35)];
    [btnItemsView addSubview:_registerBtn];
    [btnItemsView addSubview:_findBtn];
    
    CSLinearLayoutItem *btnItems = [CSLinearLayoutItem layoutItemForView:btnItemsView];
    btnItems.padding = CSLinearLayoutMakePadding(0.0, 10.0, 0.0, 10.0);
    btnItems.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:btnItems];
    
    
    _loginBtn = [UIButton baseButtonWithColor:[UIColor clearColor] andTitle:@"登 录"];
    _loginBtn.layer.borderColor = [[UIColor colorWithWhite:1 alpha:0.6] CGColor];
    _loginBtn.layer.borderWidth = 1;
    CSLinearLayoutItem *loginBtnItem = [CSLinearLayoutItem layoutItemForView:_loginBtn];
    loginBtnItem.padding = CSLinearLayoutMakePadding([UIView globalHeight]-440, 10.0, 0.0, 10.0);
    loginBtnItem.horizontalAlignment = CSLinearLayoutItemHorizontalAlignmentCenter;
    [self.linearLayoutView addItem:loginBtnItem];
    
    NSLog(@"%f",[UIView globalWidth]);
}

#pragma mark 点击别的地方使输入框隐藏
-(void)viewTapped
{
    [self endEditing:YES];
}

//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame;
    
    frame = textField.frame;
    
    int offset = frame.origin.y + 32 - (self.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.frame = CGRectMake(0.0f, -offset, self.frame.size.width, self.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [UIView commitAnimations];
}
@end
