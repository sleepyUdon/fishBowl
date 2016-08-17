
import UIKit
import Material
import OAuthSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
    var accountAccess: Bool? = true
    static var token:String?
    var dataManager : DataManager?
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: .Slide)

        dataManager = DataManager()
        createViewControllerStack()
        
        self.window!.tintColor = MaterialColor.green.accent4

        return true

    }
    
    private func createViewControllerStack() {
    let eventsViewController = EventsViewController ()
    let contactsViewController = ContactsViewController ()
    let navigationController: AppNavigationController = AppNavigationController(rootViewController: eventsViewController)
    let statusBarController: StatusBarController = StatusBarController(rootViewController: navigationController)
    let navigationDrawerController: AppNavigationDrawerController = AppNavigationDrawerController (rootViewController: statusBarController, leftViewController: contactsViewController)
    
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window!.rootViewController = navigationDrawerController
    
    window!.makeKeyAndVisible()
    }
	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
    

    
    @available(iOS 9.0, *)
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        if (url.host == "CardBowlTest") {
            OAuthSwift.handleOpenURL(url)
      
        }
        
        self.window?.rootViewController = nil
        createViewControllerStack()

        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.window?.endEditing(true)
    }
    
}

