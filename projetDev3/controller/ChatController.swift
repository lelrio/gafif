import UIKit

class ChatController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false;
        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }
}
