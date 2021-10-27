//
//  HWEmojiToolModel_ListItem.h
//  _idx_AppUniversal_library_03751F71_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HWEmojiToolModel_ListItem : NSObject
@property (nonatomic, strong) NSString *emoji;      // emoji
@property (nonatomic, strong) NSString *code;       // Unicode 编码
@property (nonatomic, strong) NSString *status;     // 状态 - 是否废弃
@property (nonatomic, strong) NSString *version;    // 加入版本
@property (nonatomic, strong) NSString *desc;       // 描述
@end

NS_ASSUME_NONNULL_END
