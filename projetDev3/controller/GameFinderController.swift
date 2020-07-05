import UIKit

class GameFinderController: UIViewController {

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var firstChoiceImage: UIImageView!
    @IBOutlet weak var firstChoiceText: UILabel!
    @IBOutlet weak var secondChoiceImage: UIImageView!
    @IBOutlet weak var secondChoiceText: UILabel!
    @IBOutlet weak var thirdChoiceImage: UIImageView!
    @IBOutlet weak var thirdChoiceText: UILabel!
    @IBOutlet weak var fourthChoiceImage: UIImageView!
    @IBOutlet weak var fourthChoiceText: UILabel!
    @IBOutlet weak var fifthChoiceImage: UIImageView!
    @IBOutlet weak var fifthChoiceText: UILabel!
    
    var choice = Choice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false;
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        // Do any additional setup after loading the view.
    }
    
    private func showPoster() {
        
        switch choice.state {
        case .ongoing:
            self.questionTitle.text = choice.currentQuestion.questionTitle
               
          
            
            
        case .over:
            print("over")

        }
           
    }

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
