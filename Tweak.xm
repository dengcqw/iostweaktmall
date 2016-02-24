
#import "NSLogger/NSLogger.h"

%hook TMAppDelegate
- (BOOL)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
    LoggerSetViewerHost(NULL, (CFStringRef)@"10.59.92.217", (UInt32)50000);
    //LoggerSetupBonjour(NULL, NULL, (CFStringRef)@"tmall");

    return %orig;
}

%end


%hook TMWebViewController

- (void)viewDidLoad {
    %orig;
    NSLog(@"TMWebViewController viewDidLoad");
}

- (BOOL)checkJSCall:(id)arg1 {
    NSLog(@"TMWebViewController checkJSCall: %@", arg1);
    //NSLog(@"TMWebViewController checkJSCall: %@", [NSThread callStackSymbols]);
    BOOL ret = %orig;
    NSLog(@"TMWebViewController checkJSCall: ret %@", @(ret));
    return ret;
}

- (BOOL)checkJSCallWV:(id)arg1 {
    NSLog(@"TMWebViewController checkJSCallWV: %@", arg1);
    //NSLog(@"TMWebViewController checkJSCallWV: %@", [NSThread callStackSymbols]);
    BOOL ret = %orig;
    NSLog(@"TMWebViewController checkJSCallWV: ret %@", @(ret));
    return ret;
}

- (id)initWithURL:(id)arg1 {
    NSLog(@"TMWebViewController initWithURL: %@", arg1);
    return %orig;
}

%end

