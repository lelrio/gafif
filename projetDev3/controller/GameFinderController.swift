import UIKit

class GameFinderController: UIViewController {

    @IBOutlet weak var questionTitle: UILabel!


//    @IBOutlet weak var image: UIImageView!
//    
//
//    @IBOutlet var collectionOfLabels:[UILabel]!
    
    var choice = Choice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false;
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        // Do any additional setup after loading the view.
        
        self.showPoster()
        
        
    }
    
    private func showPoster() {
        switch choice.state {
        case .ongoing:
            
            
             self.questionTitle.text = choice.currentQuestion.questionTitle
             
//             for answer in (0...choice.currentQuestion.answers.count - 1){
//                for label in collectionOfLabels{
//                    self.collectionOfLabels[answer].text = choice.currentQuestion.answers[answer].textAnswer
//                }
//
//                self.image.image = choice.currentQuestion.answers[answer].imgAnswer
//
//             }
             
        case .over:
            print("over")

        }
           
    }

    @IBAction func makeChoice(_ sender: UIButton) {
        self.showPoster()
        
        choice.goToNextQuestion()
        
        print("u clicked")
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
