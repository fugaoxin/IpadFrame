//
//  dataCenter.m
//  danli
//
//  Created by qianfeng on 15-6-12.
//  Copyright (c) 2015年 j. All rights reserved.
//

#import "dataCenter.h"

@implementation dataCenter

+(dataCenter *)shareDataCenter
{
    static dataCenter * dc=nil;
    
    if (dc==nil) {
        
        dc=[[super alloc] init];
    }
    
    return dc;
}

@end
