import UIKit

class Choice {
    private var currentIndex = 0
    private let questions: [Question] = [
        Question(questionTitle: "Quelle plateforme ?" , answers:
            [Answer(imgAnswer: "ps4", textAnswer: "playstation 4", tag:"playstation 4" ),
             Answer(imgAnswer: "xbox", textAnswer: "xbox",tag:"xbox" ),
             Answer(imgAnswer: "computer", textAnswer: "computer",tag:"computer" ),
             Answer(imgAnswer: "switch", textAnswer: "switch",tag:"nitendo switch" ),
             Answer(imgAnswer: "mobile", textAnswer: "mobile",tag:"mobile" )]),
        
        Question(questionTitle: "Jeu récent ou ancien ?" , answers:
                  [Answer(imgAnswer: "manette", textAnswer: "Récent", tag:"new" ),
                   Answer(imgAnswer: "gameboy", textAnswer: "Ancien",tag:"old" )]),
        
        Question(questionTitle: "Que désirez vous expérimentez ?" , answers:
            [Answer(imgAnswer: "action", textAnswer: "Action", tag:"action" ),
             Answer(imgAnswer: "aventure", textAnswer: "aventure",tag:"aventure" ),
             Answer(imgAnswer: "strategy", textAnswer: "stratégie",tag:"strategy" ),
             Answer(imgAnswer: "sport", textAnswer: "sport",tag:"sport" ),
             Answer(imgAnswer: "simulation", textAnswer: "simulation de vie",tag:"simulation" )]),
        
        Question(questionTitle: "Jouer en solo ou en équipe ?" , answers:
                        [Answer(imgAnswer: "solo", textAnswer: "Solo", tag:"solo" ),
                         Answer(imgAnswer: "multiplayer", textAnswer: "équipe",tag:"multiplayer" )]),
        
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
    
    private func goToNextQuestion(){
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
