class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # navigation = UINavigationController.alloc.initWithRootViewController(timeline)

    container_controller = ContainerController.alloc.init
    @window.rootViewController = container_controller
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    true
  end
end
