import UIKit
import SafariServices

class ResultController:  UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func Btn_DBZ(_ sender: Any) {
      showSafariVC(for: "https://www.instant-gaming.com/fr/rechercher/?q=dragon+ball+z")
    }
    
    @IBAction func Btn_WOW(_ sender: Any) {
         showSafariVC(for: "https://www.instant-gaming.com/fr/rechercher/?query=world%20of%20warcraft")
    }
    
    @IBAction func Btn_Battlerite(_ sender: Any) {
        showSafariVC(for: "https://www.g2a.com/search?query=battlerite")
    }
    @IBAction func Btn_LOL(_ sender: Any) {
        showSafariVC(for: "https://signup.euw.leagueoflegends.com/fr/signup/redownload")
    }
    func showSafariVC(for url: String){
        guard let url = URL(string: url) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
}

