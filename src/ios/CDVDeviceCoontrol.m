/********* CDVDeviceControl.m Cordova Plugin Implementation *******/

#import "CDVDeviceControl.h"
#import <Cordova/CDV.h>

@implementation CDVDeviceControl

- (void)echo:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSLog(@"ACTION_DISPLAY_DIMENSIONS start");
    NSMutableDictionary dict = @{};
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    NSNumber dim_s = screenBounds.size.width * screenScale;
    NSNumber dim_l = screenBounds.size.height * screenScale;


    if (screenBounds.size.width>screenBounds.size.height) {
        dim_s = screenBounds.size.height * screenScale;
        dim_l = screenBounds.size.width * screenScale;
        orientation = "wide";
    } else {
        dim_s = screenBounds.size.width * screenScale;
        dim_l = screenBounds.size.height * screenScale;
        orientation = "tall";
    }

    [dict setObject:@"ACTION_DISPLAY_DIMENSIONS" forKey:@"type"];
    [dict setObject:dim_s forKey:@"dim_s"];
    [dict setObject:dim_l forKey:@"dim_l"];
    [dict setObject:orientation forKey:@"orientation"];
    [dict setObject:screenBounds forKey:@"metrics"];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    NSLog(@"ACTION_DISPLAY_DIMENSIONS end");
}

@end