//
//  HWEmojiToolCell_ListItem.m
//  _idx_AppUniversal_library_03751F71_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/13.
//

#import "HWEmojiToolCell_ListItem.h"

#import "../../Masonry/Masonry.h"

@interface HWEmojiToolCell_ListItem ()
@property (nonatomic, strong) UILabel *emojiLabel;
@end

@implementation HWEmojiToolCell_ListItem

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.emojiLabel = [[UILabel alloc] init];
        self.emojiLabel.font = [UIFont systemFontOfSize:25.f];
        self.emojiLabel.textAlignment = NSTextAlignmentCenter;
        self.emojiLabel.adjustsFontSizeToFitWidth = YES;
        
        [self.contentView addSubview:self.emojiLabel];
        [self.emojiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return self;
}

- (void)updateWithModel:(HWEmojiToolModel_ListItem *)model
{
    self.emojiLabel.text = model.emoji;
}

@end
