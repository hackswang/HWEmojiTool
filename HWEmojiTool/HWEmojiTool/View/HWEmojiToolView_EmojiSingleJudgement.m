//
//  HWEmojiToolView_EmojiSingleJudgement.m
//  _idx_AppUniversal_library_74D01191_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/13.
//

#import "HWEmojiToolView_EmojiSingleJudgement.h"

#import "../../Masonry/Masonry.h"

#import "../../support/NSString+Emoji.h"

@interface HWEmojiToolView_EmojiSingleJudgement () <UITextViewDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *separatorLine;
@property (nonatomic, strong) UILabel *inputTitle;
@property (nonatomic, strong) UITextView *inputField;
@property (nonatomic, strong) UILabel *resultTitle;
@property (nonatomic, strong) UILabel *resultLable;
@end

@implementation HWEmojiToolView_EmojiSingleJudgement

- (instancetype)init {
    if (self = [super init]) {
        [self _setup];
        [self _layout];
        [self _prepare];
    }
    return self;
}

- (void)_setup {
    
}

- (void)_layout {
    // main views
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:17.f weight:UIFontWeightBold];
        label.text = @"Emoji Single Judgement";
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    self.separatorLine = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColor.lightGrayColor;
        view;
    });
    [self addSubview:self.titleLabel];
    [self addSubview:self.separatorLine];
    {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).inset(10.f);
            make.left.right.equalTo(self).inset(15.f);
            make.height.mas_equalTo(40.f);
        }];
        [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
            make.bottom.equalTo(self).inset(15.f);
            make.width.mas_equalTo(1.f);
        }];
    }
    // input views
    self.inputTitle = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Input Emoji";
        label.textColor = UIColor.darkGrayColor;
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    self.inputField = ({
        UITextView *field = [[UITextView alloc] init];
        field.delegate = self;
        field.font = [UIFont systemFontOfSize:20.f];
        field.textAlignment = NSTextAlignmentCenter;
        field.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
        field;
    });
    [self addSubview:self.inputTitle];
    [self addSubview:self.inputField];
    {
        [self.inputTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30.f);
            make.left.equalTo(self).offset(15.f);
            make.right.equalTo(self.mas_centerX).offset(-15.f);
        }];
        [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputTitle.mas_bottom).offset(15.f);
            make.centerX.equalTo(self.inputTitle);
            make.width.mas_equalTo(75.f);
            make.height.mas_equalTo(45.f);
        }];
    }
    // result views
    self.resultTitle = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Is Emoji?";
        label.textColor = UIColor.darkGrayColor;
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    self.resultLable = ({
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];
        label.font = [UIFont systemFontOfSize:17.f weight:UIFontWeightBold];
        label;
    });
    [self addSubview:self.resultTitle];
    [self addSubview:self.resultLable];
    {
        [self.resultTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(30.f);
            make.left.equalTo(self.mas_centerX).offset(15.f);
            make.right.equalTo(self).offset(-15.f);
        }];
        [self.resultLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.resultTitle.mas_bottom).offset(15.f);
            make.centerX.equalTo(self.resultTitle);
            make.width.mas_equalTo(75.f);
            make.height.mas_equalTo(45.f);
        }];
    }
}

- (void)_prepare {
    
}

#pragma mark - TextView Delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    textView.text = @"";
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {

    NSString *currentString = textView.text;
    
    if (currentString.length > 0) {
        __block NSString *firstString = @"";
        [currentString enumerateSubstringsInRange:NSMakeRange(0, currentString.length)
                                          options:NSStringEnumerationByComposedCharacterSequences
                                       usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop)
         {
            firstString = substring;
            *stop = YES;
        }];
        textView.text = firstString;
    }
    
    if (textView.text.length > 0) {
        BOOL isEmoji = [textView.text isEmoji];
        self.resultLable.text = isEmoji ? @"YES" : @"NO";
        self.resultLable.textColor = isEmoji ? UIColor.greenColor : UIColor.redColor;
    } else {
        self.resultLable.text = @"";
    }
}

@end
