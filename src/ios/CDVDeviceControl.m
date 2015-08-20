/********* CDVDeviceControl.m Cordova Plugin Implementation *******/

#import "CDVDeviceControl.h"
#import <Cordova/CDV.h>


@implementation CDVDeviceControl
/*
- (void)displayDimensions:(CDVInvokedUrlCommand*)command
{
    NSLog(@"ACTION_CLEAR start");
    CDVPluginResult* pluginResult = nil;
    
    @try {
        NSLog(@"ACTION_CLEAR mid");
        NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:0 diskPath:nil];
        [NSURLCache setSharedURLCache:sharedCache];
        [sharedCache release];
        NSLog(@"ACTION_CLEAR mid end");
    
           

        // [[NSURLCache sharedURLCache] removeAllCachedResponses];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    @catch (NSException *exception) {
        NSLog(@"ACTION_CLEAR catch error");
        NSLog(@"ACTION_CLEAR: %@", exception.name);
        NSLog(@"ACTION_CLEAR: %@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }        
    NSLog(@"ACTION_CLEAR end");
}
*/
- (void)displayDimensions:(CDVInvokedUrlCommand*)command
{
    NSLog(@"ACTION_DISPLAY_DIMENSIONS start");
    CDVPluginResult* pluginResult = nil;
    
    @try {
        // do something
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGFloat screenScale = [[UIScreen mainScreen] scale];
        NSNumber *dim_s, *dim_l;
        NSString *orientation;
        CGFloat physicalWidth = screenBounds.size.width * scale;
        CGFloat physicalHeight = screenBounds.size.height * scale;
        
        if (screenBounds.size.width>screenBounds.size.height) {
            orientation = @"wide";
            dim_s = @(physicalHeight);
            dim_l = @(physicalHeight);
        } else {
            orientation = @"tall";
            dim_s = @(physicalHeight);
            dim_l = @(physicalHeight);
        }
        NSDictionary *dict = @{
                           @"type" : @"ACTION_DISPLAY_DIMENSIONS",
                           @"dim_s" : dim_s,
                           @"dim_l" : dim_l,
                           @"orientation" : orientation
                       };
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];

    }
    @catch (NSException *exception) {
        NSLog(@"ACTION_DISPLAY_DIMENSIONS caout error");
        NSLog(@"ACTION_DISPLAY_DIMENSIONS: %@", exception.name);
        NSLog(@"ACTION_DISPLAY_DIMENSIONS: %@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    NSLog(@"ACTION_DISPLAY_DIMENSIONS end");
}

@end