//
//  HWEmojiToolModel_ListItem.m
//  _idx_AppUniversal_library_03751F71_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/13.
//

#import "HWEmojiToolModel_ListItem.h"

@implementation HWEmojiToolModel_ListItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"emoji"   : @"Emoji",
        @"code"    : @"Code",
        @"status"  : @"Status",
        @"version" : @"Version",
        @"desc"    : @"Description",
    };
}

@end
