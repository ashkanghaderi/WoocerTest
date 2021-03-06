
import UIKit
import Domain

class MainNavigationController: UINavigationController {
  //MARK: - Initialization
  
  init() {
    super.init(rootViewController: UIViewController())
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
  }
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setNavigationBarHidden(true, animated: false)
  }
}
