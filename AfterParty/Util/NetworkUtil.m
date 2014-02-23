//
//  NetworkUtil.m
//  AfterParty
//
//  Created by kozyty on 2014/02/22.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "NetworkUtil.h"

@implementation NetworkUtil

+ (NSString *)userAgent
{
    NSString *appName = [[NSBundle mainBundle] infoDictionary][(NSString *)kCFBundleNameKey];
    NSString *version = [[NSBundle mainBundle] infoDictionary][(NSString *)kCFBundleVersionKey];
    NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
    NSString *model = [[UIDevice currentDevice] model];
//    NSString *platform = [NetworkUtil platform];
//    NSString *userAgent = [NSString stringWithFormat:@"%@/%@ %@/%@ %@", appName, version, platform, sysVersion, model];
    NSString *userAgent = [NSString stringWithFormat:@"%@/%@ %@ %@", appName, version, sysVersion, model];
    return userAgent;
}

//+ (NSString *)platform
//{
//    size_t size;
//    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
//    char *machine = malloc(size);
//    sysctlbyname("hw.machine", machine, &size, NULL, 0);
//    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
//    free(machine);
//    return platform;
//}

@end
