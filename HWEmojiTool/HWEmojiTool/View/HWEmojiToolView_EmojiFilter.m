//
//  HWEmojiToolView_EmojiFilter.m
//  _idx_AppUniversal_library_74D01191_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/13.
//

#import "HWEmojiToolView_EmojiFilter.h"

#import "../../Masonry/Masonry.h"

#import "../../support/NSString+Emoji.h"

@interface HWEmojiToolView_EmojiFilter () <UITextViewDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *inputView;
@property (nonatomic, strong) UILabel *resultLabel;
@end

@implementation HWEmojiToolView_EmojiFilter

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
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:17.f weight:UIFontWeightBold];
        label.text = @"Emoji Filter";
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    self.inputView = ({
        UITextView *view = [[UITextView alloc] init];
        view.delegate = self;
        view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.4];
        view;
    });
    self.resultLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Emoji contains: ";
        label.textColor = UIColor.darkGrayColor;
        label.numberOfLines = 0;
        label;
    });
    [self addSubview:self.titleLabel];
    [self addSubview:self.inputView];
    [self addSubview:self.resultLabel];
    {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).inset(10.f);
            make.left.right.equalTo(self).inset(15.f);
            make.height.mas_equalTo(40.f);
        }];
        [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
            make.left.right.equalTo(self).inset(15.f);
            make.height.mas_equalTo(130.f);
        }];
        [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputView.mas_bottom).offset(15.f);
            make.left.right.equalTo(self.inputView);
            make.bottom.equalTo(self).inset(15.f);
        }];
    }
}

- (void)_prepare {
    
}

#pragma mark - TextView Delegate
- (void)textViewDidChange:(UITextView *)textView {
    
    __block NSString *emojiContains = @"";
    
    [textView.text enumerateSubstringsInRange:NSMakeRange(0, textView.text.length)
                                      options:NSStringEnumerationByComposedCharacterSequences
                                   usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop)
     {
        if ([substring isEmoji]) {
            emojiContains = [emojiContains stringByAppendingString:substring];
        }
    }];
    
    if (emojiContains.length > 0) {
        self.resultLabel.text = [@"Emoji contains: " stringByAppendingString:emojiContains];
    } else {
        self.resultLabel.text = @"Emoji contains: ";
    }
}

@end
