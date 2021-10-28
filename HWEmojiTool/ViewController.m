//
//  ViewController.m
//  HWEmojiTool
//
//  Created by Hacks Wang on 2021/10/27.
//

#import "ViewController.h"

#import "HWEmojiTool/View/HWEmojiToolView_EmojiSingleJudgement.h"
#import "HWEmojiTool/View/HWEmojiToolView_EmojiFilter.h"
#import "HWEmojiTool/View/HWEmojiToolView_EmojiListRouter.h"

#import "Masonry/Masonry.h"

#import "support/NSString+Emoji.h"

@interface ViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) HWEmojiToolView_EmojiSingleJudgement *emojiSingleJudgement;
@property (nonatomic, strong) HWEmojiToolView_EmojiFilter *emojiFilter;
@property (nonatomic, strong) HWEmojiToolView_EmojiListRouter *emojiListRouter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setup];
    [self _layout];
    [self _prepare];
}

- (void)_setup {
    [self setTitle:@"Emoji Tools"];
    [self.view setBackgroundColor:UIColor.whiteColor];
}

- (void)_layout {
    
    self.contentView = ({
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView;
    });
    [self.view addSubview:self.contentView];
    {
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(self.view);
        }];
    }
    
    self.emojiSingleJudgement = ({
        HWEmojiToolView_EmojiSingleJudgement *view = [[HWEmojiToolView_EmojiSingleJudgement alloc] init];
        view.backgroundColor = HEXACOLOR(0x7feaea, 0.2);
        view.layer.cornerRadius = 6.f;
        view.layer.masksToBounds = YES;
        view;
    });
    self.emojiFilter = ({
        HWEmojiToolView_EmojiFilter *view = [[HWEmojiToolView_EmojiFilter alloc] init];
        view.backgroundColor = HEXACOLOR(0x7feaea, 0.2);
        view.layer.cornerRadius = 6.f;
        view.layer.masksToBounds = YES;
        view;
    });
    self.emojiListRouter = ({
        HWEmojiToolView_EmojiListRouter *view = [[HWEmojiToolView_EmojiListRouter alloc] init];
        view.backgroundColor = HEXACOLOR(0x7feaea, 0.2);
        view.userInteractionEnabled = YES;
        view.layer.cornerRadius = 6.f;
        view.layer.masksToBounds = YES;
        view;
    });
    [self.contentView addSubview:self.emojiSingleJudgement];
    [self.contentView addSubview:self.emojiFilter];
    [self.contentView addSubview:self.emojiListRouter];
    {
        [self.emojiSingleJudgement mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10.f);
            make.left.equalTo(self.contentView).offset(15.f);
            make.width.equalTo(self.contentView).offset(-30.f);
            make.height.mas_equalTo(200.f);
        }];
        [self.emojiFilter mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emojiSingleJudgement.mas_bottom).offset(15.f);
            make.left.right.equalTo(self.emojiSingleJudgement);
        }];
        [self.emojiListRouter mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emojiFilter.mas_bottom).offset(15.f);
            make.bottom.equalTo(self.contentView).offset(-20.f);
            make.left.right.equalTo(self.emojiSingleJudgement);
            make.height.mas_equalTo(40.f + 40.f + self.emojiListRouter.emojiVersionCount * 45.f);
        }];
    }
}

- (void)_prepare {
    // scroll view delegate
    [self.contentView setDelegate:self];
    // tap action
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)tap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

 
@end
