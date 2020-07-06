import UIKit

class Choice {
    private var currentIndex = 0
    private let questions: [Question] = [
        Question(questionTitle: "Quelle plateforme ?" ,answers:
            [Answer(imgAnswer: UIImage(named: "ps4")!, textAnswer: "playstation 4", tag:"playstation 4" ),
             Answer(imgAnswer: UIImage(named: "xbox")!, textAnswer: "xbox",tag:"xbox" ),
             Answer(imgAnswer: UIImage(named: "computer")!, textAnswer: "computer",tag:"computer" ),
             Answer(imgAnswer: UIImage(named: "switch")!, textAnswer: "switch",tag:"nitendo switch" ),
             Answer(imgAnswer: UIImage(named: "mobile")!, textAnswer: "mobile",tag:"mobile" )]),
        
        Question(questionTitle: "Jeu récent ou ancien ?" , answers:
                  [Answer(imgAnswer: UIImage(named: "manette")!, textAnswer: "Récent", tag:"new" ),
                   Answer(imgAnswer: UIImage(named: "gameboy")!, textAnswer: "Ancien",tag:"old" )]),
        
        Question(questionTitle: "Que désirez vous expérimentez ?" , answers:
            [Answer(imgAnswer: UIImage(named: "action")!, textAnswer: "Action", tag:"action" ),
             Answer(imgAnswer: UIImage(named: "aventure")!, textAnswer: "aventure",tag:"aventure" ),
             Answer(imgAnswer: UIImage(named: "strategy")!, textAnswer: "stratégie",tag:"strategy" ),
             Answer(imgAnswer: UIImage(named: "sport")!, textAnswer: "sport",tag:"sport" ),
             Answer(imgAnswer: UIImage(named: "simulation")!, textAnswer: "simulation de vie",tag:"simulation" )]),
        
        Question(questionTitle: "Jouer en solo ou en équipe ?" , answers:
                        [Answer(imgAnswer: UIImage(named: "solo")!, textAnswer: "Solo", tag:"solo" ),
                         Answer(imgAnswer: UIImage(named: "multiplayer")!, textAnswer: "équipe",tag:"multiplayer" )]),
        
    ]
   
    private var tags:[String] = []
    
    var responses =  [Response]()
    
    enum State{
        case ongoing, over
    }
    
    var state: State = .ongoing
    
    var currentQuestion: Question{
        return questions[currentIndex]
    }
    
    private func finish(){
        state = .over
        
        print(responses)
        
        print("finished")
    }
    
    public func goToNextQuestion(){
        currentIndex < questions.count - 1 ?currentIndex += 1 : finish()
    }
    
    
    func setResponse(_ response:Response){
        // je dois faire le system de point ici
        responses.append(response)
        
        goToNextQuestion()
    }
    
    enum Response {
        
        case left, right
        
    }
}
