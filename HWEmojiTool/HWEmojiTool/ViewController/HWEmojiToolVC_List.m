//
//  HWEmojiToolVC_List.m
//  _idx_AppUniversal_library_03751F71_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/12.
//

#import "HWEmojiToolVC_List.h"

#import "../View/HWEmojiToolCell_ListItem.h"

#import "../Model/HWEmojiToolModel_ListItem.h"

#import "../../Masonry/Masonry.h"
#import "../../YYModel/YYModel.h"

#import "../../support/NSString+Emoji.h"

@interface HWEmojiToolVC_List () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSString *_version;     // Emoji 版本
    NSInteger _lineCount;   // 每行显示的 Emoji 个数
    NSArray *_dataSource;   // 数据源
}
@property (nonatomic, strong) UIView *infoContent;
@property (nonatomic, strong) UILabel *maskLabel;
@property (nonatomic, strong) UIView *separatorLine;
@property (nonatomic, strong) UICollectionView *listView;

@property (nonatomic, strong) UILabel *emojiLable;
@property (nonatomic, strong) UILabel *emojiCode;
@property (nonatomic, strong) UILabel *emojiStatus;
@property (nonatomic, strong) UILabel *emojiVersion;
@property (nonatomic, strong) UILabel *emojiDescription;
@end

@implementation HWEmojiToolVC_List

- (instancetype)initWithVersion:(NSString *)verison {
    if (self = [super init]) {
        _version = verison;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setup];
    [self _layout];
    [self _prepare];
}

- (void)_setup {
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setTitle:[@"Emoji List - " stringByAppendingString:_version]];
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    _lineCount = 8;
}

- (void)_layout {
    // layout main views
    self.infoContent = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
    self.maskLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"The official documentation for this version is too old to be easily handled, so a list of this version is not available at this time";
        label.textAlignment = NSTextAlignmentCenter;
        label.hidden = YES;
        label.numberOfLines = 0;
        label.backgroundColor = UIColor.whiteColor;
        label;
    });
    self.separatorLine = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColor.brownColor;
        view;
    });
    self.listView = ({
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        view.delegate = self;
        view.dataSource = self;
        view.backgroundColor = HEXACOLOR(0x7feaea, 0.2);
        view.allowsMultipleSelection = NO;
        
        [view registerClass:HWEmojiToolCell_ListItem.class forCellWithReuseIdentifier:@"HWCollectionViewCell"];
        
        view;
    });
    [self.view addSubview:self.infoContent];
    [self.view addSubview:self.maskLabel];
    [self.view addSubview:self.separatorLine];
    [self.view addSubview:self.listView];
    {
        [self.infoContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(230.f);
        }];
        [self.maskLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.infoContent);
        }];
        [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(self.infoContent);
            make.height.mas_equalTo(1.f);
        }];
        [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoContent.mas_bottom);
            make.bottom.left.right.equalTo(self.view);
        }];
    }
    // layout sub views
    [self _layout_InfoContent];
}

- (void)_layout_InfoContent {
    self.emojiLable = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:60.f];
        label.textAlignment = NSTextAlignmentCenter;
        label.adjustsFontSizeToFitWidth = YES;
        label;
    });
    self.emojiCode = ({
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = UIColor.lightGrayColor;
        label.font = [UIFont systemFontOfSize:17.f];
        label;
    });
    self.emojiStatus = ({
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 1;
        label.textColor = UIColor.lightGrayColor;
        label.font = [UIFont systemFontOfSize:17.f];
        label;
    });
    self.emojiVersion = ({
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 1;
        label.textColor = UIColor.lightGrayColor;
        label.font = [UIFont systemFontOfSize:17.f];
        label;
    });
    self.emojiDescription = ({
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = UIColor.lightGrayColor;
        label.font = [UIFont systemFontOfSize:17.f];
        label;
    });
    [self.infoContent addSubview:self.emojiLable];
    [self.infoContent addSubview:self.emojiCode];
    [self.infoContent addSubview:self.emojiStatus];
    [self.infoContent addSubview:self.emojiVersion];
    [self.infoContent addSubview:self.emojiDescription];
    {
        [self.emojiLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.infoContent);
            make.left.equalTo(self.infoContent).inset(10.f);
            make.width.mas_equalTo(100.f);
            make.height.mas_equalTo(100.f);
        }];
        [self.emojiCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoContent).inset(20.f);
            make.left.equalTo(self.emojiLable.mas_right).offset(10.f);
            make.right.equalTo(self.infoContent).inset(15.f);
        }];
        [self.emojiStatus mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emojiCode.mas_bottom).offset(15.f);
            make.left.right.equalTo(self.emojiCode);
        }];
        [self.emojiVersion mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emojiStatus.mas_bottom).offset(15.f);
            make.left.right.equalTo(self.emojiCode);
        }];
        [self.emojiDescription mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emojiVersion.mas_bottom).offset(15.f);
            make.left.right.equalTo(self.emojiCode);
        }];
    }
}

- (void)_prepare {
    NSString *mainBundleDirectory = [[NSBundle mainBundle] bundlePath];
    NSString *path = [mainBundleDirectory stringByAppendingFormat:@"/emoji_%@.json", _version];

    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
    
    if (data) {
        _dataSource = [NSArray yy_modelArrayWithClass:HWEmojiToolModel_ListItem.class json:data];
        [self.listView reloadData];
    } else {
        self.maskLabel.hidden = NO;
    }
}

#pragma mark - Actions
- (void)updateInfoWithModel:(HWEmojiToolModel_ListItem *)model {
    self.emojiLable.text = model.emoji;
    self.emojiCode.text = [@"Unicode Number: " stringByAppendingString:model.code];
    self.emojiStatus.text = [@"Status: " stringByAppendingString:model.status];
    self.emojiVersion.text = [@"First Import Version: " stringByAppendingString:model.version];
    self.emojiDescription.text = [@"Description: " stringByAppendingString:model.desc];
}

#pragma mark - CollectionView Delegate & DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth / _lineCount) - 5.f, (ScreenWidth / _lineCount) - 5.f);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.f;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HWEmojiToolCell_ListItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HWCollectionViewCell" forIndexPath:indexPath];
    
    if ([collectionView.indexPathsForSelectedItems.firstObject isEqual:indexPath]) {
        cell.contentView.backgroundColor = [[UIColor alloc] initWithWhite:0.8 alpha:0.5];
    } else {
        cell.contentView.backgroundColor = UIColor.clearColor;
    }
    
    [cell updateWithModel:_dataSource[indexPath.item]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HWEmojiToolCell_ListItem *cell = (HWEmojiToolCell_ListItem *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell) {
        cell.contentView.backgroundColor = [[UIColor alloc] initWithWhite:0.8 alpha:0.5];
    }
    [self updateInfoWithModel:_dataSource[indexPath.item]];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    HWEmojiToolCell_ListItem *cell = (HWEmojiToolCell_ListItem *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell) {
        cell.contentView.backgroundColor = UIColor.clearColor;
    }
}

@end
