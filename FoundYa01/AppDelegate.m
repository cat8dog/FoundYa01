#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "Pin.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Pin registerSubclass];
    [Parse setApplicationId:@"NPNgyV4EoyrDmvl7fTRgYxn4Kh9XOkBeMTYKwyfw" clientKey:@"QW2wazJRsIEg388a062frvEvyokUjB0xXrBD4La8"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [FBSDKLoginButton class];
    PFUser *user = [PFUser user];
    [user setObject:@"" forKey:@"userName"];
    [user setObject:@"" forKey:@"passWord"];
    [user saveInBackground];
    
    [PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            sourceApplication:(NSString *)sourceApplication
            annotation:(id)annotation {
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
