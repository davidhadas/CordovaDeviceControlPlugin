/********* CDVCDeviceControl.h Cordova Plugin Header *******/
#import <Cordova/CDV.h>

@interface CDVDeviceControl : CDVPlugin

-(void)clear: (CDVInvokedUrlCommand*)command;

- (void)displayDimensions:(CDVInvokedUrlCommand*)command;

@property (nonatomic, strong) CDVInvokedUrlCommand* command;

@end
