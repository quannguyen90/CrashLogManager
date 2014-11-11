//
//  CrashLog.h
//  Timberwise_ios
//
//  Created by Nguyen Dung on 10/17/14.
//  Copyright (c) 2014 Nguyen Tien Dung. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CrashLog : NSObject

+(id)ShareManager;
+(id)ShareManagerWithApplicationId:(NSString *)applicationID restAPIKey:(NSString *)restAPIKey;

-(void)StoreCrashLogWith:(NSString *)classname crashLog:(NSString *)crashMessage;
-(void)GetCrashLog;
-(void)GetCrashLogWithVersionApp:(NSString *)version;
-(void)GetCrashLogWithBuildVersion:(NSString *)version;
-(void)GetCrashLogWithDeviceName:(NSString *)version;
-(void)GetCrashLogWithIosVersion:(NSString *)version;
-(void)GetCrashLogWithAppName:(NSString *)appname;
@end
