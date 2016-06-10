//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISShoppingCart.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISShoppingCart *cart = [[FISShoppingCart alloc]init];
    cart.items = [[NSMutableArray alloc]init];
    FISItem *item = [[FISItem alloc]init];
    
    [cart addItem:item];
    return YES;
}

@end
