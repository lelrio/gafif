import UIKit

class LogController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
       @IBOutlet weak var emailTF: UITextField!
       @IBOutlet weak var passwordTF: UITextField!
       @IBOutlet weak var nicknameTF: UITextField!
       @IBOutlet weak var validationBTN: UIButton!
       @IBOutlet weak var viewHidden: UIView!
       @IBOutlet weak var imageHidden: DesignableImageView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           setupUI()
           // Observation de l’état d’authentification de l’utilisateur
           FireAuth().auth.addStateDidChangeListener { (auth, user) in
               if user != nil {
                   self.performSegue(withIdentifier: "segueToMain", sender: nil)
                   self.emailTF.text = ""
                   self.passwordTF.text = ""
                   self.nicknameTF.text = ""
                   self.segmentedControl.selectedSegmentIndex = 0
                   self.passwordTF.isSecureTextEntry = true
               }
           }
       }
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
       }
       @IBAction func ValidateBtnDidPressed(_ sender: Any) {
           guard let email = emailTF.text, email != "" else {
               presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné d’e-mail !")
               return
           }
           guard let password = passwordTF.text, password != "" else {
               presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de mot de passe !")
               return
           }
           if segmentedControl.selectedSegmentIndex == 0 {
               FireAuth().signIn(email: email, password: password) { (error, uid) in
                   if let error = error {
                       self.presentAlert(title: "Erreur", message: error)
                   }
               }
           } else {
               guard let nickname = nicknameTF.text, nickname != "" else {
                   presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de pseudo !")
                   return
               }
               FireAuth().signUp(email: email, password: password, nickname: nickname) { (error, uid) in
                   if let error = error {
                       self.presentAlert(title: "Erreur", message: error)
                   }
                   if let uid = uid {
                       let data: [String: Any] = ["uid": uid, "nickname": nickname]
                       FireDB().addUser(uid, data: data)
                   }
               }
           }
       }
       
       @IBAction func segmentedChanged(_ sender: Any) {
           setupUI()
       }
       
       func setupUI() {
           let isConnexionSegment = segmentedControl.selectedSegmentIndex == 0
           let title = isConnexionSegment ? "Se connecter" : "S'inscrire"
           validationBTN.setTitle(title, for: .normal)
           nicknameTF.isHidden = isConnexionSegment
           viewHidden.isHidden = isConnexionSegment
           //imageHidden.isHidden = isConnexionSegment
           self.passwordTF.isSecureTextEntry = true
       }
       
    @IBAction func backButton(_ sender: Any) {
           navigationController?.popViewController(animated: true)
    }
    
    @IBAction func unwindToLog(segue: UIStoryboardSegue) { }
}
