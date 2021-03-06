//
//  MQTTFrameworkTests.m
//  MQTTFrameworkTests
//
//  Created by Christoph Krey on 21.01.16.
//  Copyright © 2016-2017 Christoph Krey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MQTTFramework.h"

@interface MQTTFrameworkTests : XCTestCase
@property (strong, nonatomic) MCMQTTSession *session;
@end

@implementation MQTTFrameworkTests

- (void)setUp {
    [super setUp];
    self.session = [[MCMQTTSession alloc] init];
    [self.session connectAndWaitTimeout:30];
}

- (void)tearDown {
    [self.session closeAndWait:30];
    [super tearDown];
}

- (void)testFramework {
    [self.session subscribeAndWaitToTopic:@"$SYS"
                                  atLevel:MQTTQosLevelAtMostOnce
                                  timeout:30];
}

@end
