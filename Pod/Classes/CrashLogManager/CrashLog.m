//
//  CrashLog.m
//  Timberwise_ios
//
//  Created by Nguyen Dung on 10/17/14.
//  Copyright (c) 2014 Nguyen Tien Dung. All rights reserved.
//

#import "CrashLog.h"
#import "IQ_Parse.h"
#import "IQPFHTTPService.h"
static CrashLog *Share;
@implementation CrashLog

+(id)ShareManager{
    if(!Share){
        Share = [[CrashLog alloc]init];
        [[IQPFHTTPService service] setLogEnabled:NO];
        [IQ_Parse setApplicationId:@"nsHHAL4TG5kQgTNBA33uSb48gRTdxKDGZDlpXS6Q" restAPIKey:@"mtzA1W6NJYvjz5Qh7GqPRn0COABokodWNQvF3m6B"];
    }
    return Share;
}
+(id)ShareManagerWithApplicationId:(NSString *)applicationID restAPIKey:(NSString *)restAPIKey{
    if(!Share){
        Share = [[CrashLog alloc]init];
        [[IQPFHTTPService service] setLogEnabled:NO];
        [IQ_Parse setApplicationId:applicationID restAPIKey:restAPIKey];
    }
    return Share;
}
-(void)QuitApplication{
    [NSThread exit];
}
-(void)StoreCrashLogWith:(NSString *)classname crashLog:(NSString *)crashMessage{
    NSString *DBname = [NSString stringWithFormat:@"CrashReport_%@",[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]];
    IQ_PFObject *objectCRASH = [IQ_PFObject objectWithClassName:DBname];
    [objectCRASH setObject:[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]forKey:@"AppName"];
    [objectCRASH setObject:classname forKey:@"ClassName"];
    [objectCRASH setObject:[NSString stringWithFormat:@"%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]] forKey:@"VersionApp"];
    [objectCRASH setObject:crashMessage forKey:@"CrashMessage"];
    [objectCRASH setObject:[NSBundle mainBundle].infoDictionary[@"CFBundleVersion"] forKey:@"BuildVersion"];
    [objectCRASH setObject:[[UIDevice currentDevice] name] forKey:@"deviceName"];
    [objectCRASH setObject:[[UIDevice currentDevice] systemVersion] forKey:@"Ver_ios"];
    
    
    [objectCRASH saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
#ifdef DEBUG
        NSLog(@"%@",crashMessage);
#endif
        [Share QuitApplication];
    }];
    
    
}
-(void)GetCrashLog{
    NSString *DBname = [NSString stringWithFormat:@"CrashReport_%@",[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]];
    IQ_PFQuery *query = [IQ_PFQuery queryWithClassName:DBname];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        
        for (IQ_PFObject *object in objects)
        {
            NSLog(@"%@",[object objectForKey:@"CrashMessage"]);
        }
        
    }];
}
-(void)GetCrashLogWithVersionApp:(NSString *)version{
    
    
    NSString *DBname = [NSString stringWithFormat:@"CrashReport_%@",[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]];
    IQ_PFQuery *query = [IQ_PFQuery queryWithClassName:DBname];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (IQ_PFObject *object in objects)
        {
            if([version isEqualToString:[object objectForKey:@"VersionApp"]]){
                NSLog(@"%@ %@",[object objectForKey:@"ClassName"],[object objectForKey:@"CrashMessage"]);
            }
        }
    }];
}
-(void)GetCrashLogWithBuildVersion:(NSString *)version{
    
    
    NSString *DBname = [NSString stringWithFormat:@"CrashReport_%@",[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]];
    IQ_PFQuery *query = [IQ_PFQuery queryWithClassName:DBname];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (IQ_PFObject *object in objects)
        {
            if([version isEqualToString:[object objectForKey:@"BuildVersion"]]){
                NSLog(@"%@ %@",[object objectForKey:@"ClassName"],[object objectForKey:@"CrashMessage"]);
            }
        }
    }];
}
-(void)GetCrashLogWithIosVersion:(NSString *)version{
    
    
    NSString *DBname = [NSString stringWithFormat:@"CrashReport_%@",[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]];
    IQ_PFQuery *query = [IQ_PFQuery queryWithClassName:DBname];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (IQ_PFObject *object in objects)
        {
            if([version isEqualToString:[object objectForKey:@"Ver_ios"]]){
                NSLog(@"%@ %@",[object objectForKey:@"ClassName"],[object objectForKey:@"CrashMessage"]);
            }
        }
    }];
}
-(void)GetCrashLogWithDeviceName:(NSString *)version{
    
    
    NSString *DBname = [NSString stringWithFormat:@"CrashReport_%@",[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]];
    IQ_PFQuery *query = [IQ_PFQuery queryWithClassName:DBname];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (IQ_PFObject *object in objects)
        {
            if([version isEqualToString:[object objectForKey:@"deviceName"]]){
                NSLog(@"%@ %@",[object objectForKey:@"ClassName"],[object objectForKey:@"CrashMessage"]);
            }
        }
    }];
}
-(void)GetCrashLogWithAppName:(NSString *)appname{
    
    NSString *DBname = [NSString stringWithFormat:@"CrashReport_%@",[NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"]];
    IQ_PFQuery *query = [IQ_PFQuery queryWithClassName:DBname];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        for (IQ_PFObject *object in objects)
        {
            if([appname isEqualToString:[object objectForKey:@"AppName"]]){
                NSLog(@"%@ %@",[object objectForKey:@"ClassName"],[object objectForKey:@"CrashMessage"]);
            }
        }
    }];
}
@end
