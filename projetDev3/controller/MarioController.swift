import UIKit

class MarioController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.isNavigationBarHidden = true;
    }
    
    @IBAction func unwindToResult(segue: UIStoryboardSegue) {}
}
