/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
	return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
	%log; // Write a message about this call, including its class, name and arguments, to the system log.

	%orig; // Call through to the original function with its original arguments.
	%orig(nil); // Call through to the original function with a custom argument.

	// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
	%log;
	id awesome = %orig;
	[awesome doSomethingElse];

	return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end
*/

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

