//
//    ____                _           _ _           ____  ____  _  __
//   |  _ \ _ __ _____  _(_)_ __ ___ (_) |_ _   _  / ___||  _ \| |/ /
//   | |_) | '__/ _ \ \/ / | '_ ` _ \| | __| | | | \___ \| | | | ' /
//   |  __/| | | (_) >  <| | | | | | | | |_| |_| |  ___) | |_| | . \
//   |_|   |_|  \___/_/\_\_|_| |_| |_|_|\__|\__, | |____/|____/|_|\_\
//                                          |___/
//
//   Copyright © 2017 Estimote. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Defines logger level.
 */
typedef NS_ENUM(NSUInteger, EPXLogLevel) {
    /* Mute all logs. */
    EPXLogLevelNone = 0,
    
    /* Log errors only. */
    EPXLogLevelError = 1,
    
    /* Log errors and warnings. */
    EPXLogLevelWarning = 2,
    
    /* Log errors, warnings and regular messages. */
    EPXLogLevelInfo = 3,
};

/**
 Used to customize Proximity Observer behaviour.
 */
@interface EPXProximityObserverConfiguration : NSObject

/**
 Default Proximity Observer configuration.
 */
@property (nonatomic, strong, readonly, class) EPXProximityObserverConfiguration *defaultConfiguration;

/**
 Logger level. Defines which logs generated by Estimote Proximity SDK are printed to the Xcode's console.
 */
@property (nonatomic, assign, readwrite) EPXLogLevel logLevel;

@end
