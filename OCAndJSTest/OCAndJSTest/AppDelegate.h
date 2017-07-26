//
//  AppDelegate.h
//  OCAndJSTest
//
//  Created by DQaemoney on 2017/7/21.
//  Copyright © 2017年 developer@aemoney.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

