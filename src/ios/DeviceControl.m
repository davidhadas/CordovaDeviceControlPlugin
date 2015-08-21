/********* DeviceControl.m Cordova Plugin Implementation *******/

#import "DeviceControl.h"
#import <Cordova/CDV.h>
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation DeviceControl

- (void)pluginInitialize 	
{
        NSLog(@"ACTION_INIT ");
        NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:4*1024*1024 diskCapacity:32*1024*1024 diskPath:@"nsurlcache"];
        [NSURLCache setSharedURLCache:sharedCache];
        NSLog(@"ACTION_INIT end");
}

- (void)clear:(CDVInvokedUrlCommand*)command
{
    NSLog(@"ACTION_CLEAR start");
    CDVPluginResult* pluginResult = nil;
    
    @try {
        NSLog(@"ACTION_CLEAR mid");
        NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:0 diskPath:nil];
        [NSURLCache setSharedURLCache:sharedCache];
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
- (void)displayDimensions:(CDVInvokedUrlCommand*)command
{
    NSLog(@"ACTION_DISPLAY_DIMENSIONS start");
    CDVPluginResult* pluginResult = nil;
    
    @try {
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *model = malloc(size);
        sysctlbyname("hw.machine", model, &size, NULL, 0);
        NSString *sDeviceModel = [NSString stringWithCString:model encoding:NSUTF8StringEncoding];
        free(model); 

        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGFloat screenScale = [[UIScreen mainScreen] scale];
        NSNumber *dim_s, *dim_l;
        NSString *orientation;
        CGFloat physicalWidth = screenBounds.size.width * screenScale;
        CGFloat physicalHeight = screenBounds.size.height * screenScale;
        
        if (screenBounds.size.width>screenBounds.size.height) {
            orientation = @"wide";
            dim_s = @(physicalHeight);
            dim_l = @(physicalWidth);
        } else {
            orientation = @"tall";
            dim_s = @(physicalWidth);
            dim_l = @(physicalHeight);
        }
        /*
        NSDictionary *dict = @{
                           @"type" : @"ACTION_DISPLAY_DIMENSIONS",
                           @"dim_s" : dim_s,
                           @"dim_l" : dim_l,
                           @"orientation" : orientation
                       };
        */
        NSDictionary *dict = @{
                           @"type" : @"ACTION_DISPLAY_DIMENSIONS",
                           @"orientation" : orientation,
                           @"model" : sDeviceModel
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
