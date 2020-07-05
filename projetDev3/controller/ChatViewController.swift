import UIKit


class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
            navigationController?.isNavigationBarHidden = true;
       }
}
