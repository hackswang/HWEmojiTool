//
//  HWEmojiToolView_EmojiListRouter.m
//  _idx_AppUniversal_library_74D01191_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/13.
//

#import "HWEmojiToolView_EmojiListRouter.h"

#import "../ViewController/HWEmojiToolVC_List.h"

#import "../../Masonry/Masonry.h"

#import "../../support/UIViewController+TopMost.h"

@interface HWEmojiToolView_EmojiListRouter () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITableView *listTable;
@end

@implementation HWEmojiToolView_EmojiListRouter

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
        label.text = @"Emoji List Router";
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    self.listTable = ({
        UITableView *view = [[UITableView alloc] init];
        view.delegate = self;
        view.dataSource = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.backgroundColor = UIColor.clearColor;
        view.layer.cornerRadius = 5.f;
        view.layer.masksToBounds = YES;
        view;
    });
    [self addSubview:self.titleLabel];
    [self addSubview:self.listTable];
    {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).inset(10.f);
            make.left.right.equalTo(self).inset(15.f);
            make.height.mas_equalTo(40.f);
        }];
        [self.listTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
            make.left.right.equalTo(self).inset(15.f);
            make.height.mas_equalTo(self.dataSource.count * 45.f);
        }];
    }
}

- (void)_prepare {
    
}

- (NSArray *)dataSource {
    return @[
        @"1.0",
        @"2.0",
        @"3.0",
        @"4.0",
        @"5.0",
        @"11.0",
        @"12.0",
        @"12.1",
        @"13.0",
        @"13.1",
        @"14.0",
    ];
}

- (NSInteger)emojiVersionCount {
    return self.dataSource.count;
}

#pragma mark - TableView Delegate & DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HWTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"HWTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColor.clearColor;
        cell.contentView.backgroundColor = [[UIColor alloc] initWithWhite:1 alpha:0.3];
    }
    cell.textLabel.text = [@"Emoji - " stringByAppendingString:self.dataSource[indexPath.row]];
    cell.textLabel.textColor = UIColor.lightGrayColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HWEmojiToolVC_List *viewController = [[HWEmojiToolVC_List alloc] initWithVersion:self.dataSource[indexPath.row]];
    [[UIViewController topMostNavigationController] pushViewController:viewController animated:YES];
}

@end
