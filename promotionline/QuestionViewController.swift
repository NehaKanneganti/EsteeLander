//
//  QuestionViewController.swift
//  promotionline
//
//  Created by Neha Kanneganti on 7/20/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!

    
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    var questions: [Question] = [
            Question(text: "Which of these best describes your pores?",
                     type: .single,
                     answers: [
                        Answer(text: "Large and visible all over.", type: .pores),
                        Answer(text: "They are visible in some parts.", type: .pores),
                        Answer(text: "Small, not easily noticed", type: .nopores),
                        Answer(text: "No pores at all", type: .nopores)
                        
                ]),
            Question(text: "How would you describe the shine of your skin?",
                     type: .single,
                     answers: [
                        Answer(text: "Bright like a diamond", type: .nodull),
                        Answer(text: "Dull everywhere", type: .dull),
                        Answer(text: "Some parts are dull", type: .dull),
                        Answer(text: "More oily than dull", type: .pores)
                ]),
            Question(text: "How does it feel to touch your skin?",
                     type: .single,
                     answers: [
                        Answer(text: "Oily and Pores", type: .pores),
                        Answer(text: "Saggy and Loss of Firmness", type: .firmness),
                        Answer(text: "Wrinkles and Fine Lines", type: .lines),
                        Answer(text: "Dull and Dry", type: .dull)
                ]),
            Question(text: "How visible are wrinkles on your skin?",
                     type: .single,
                     answers: [
                        Answer(text: "They ae visible", type: .lines),
                        Answer(text: "They ae visible in some areas", type: .lines),
                        Answer(text: "Not wrinkles, but I have more pores", type: .pores),
                        Answer(text: "They are not visible", type: .nolines),
                       
                ]),
            Question(text: "How firm is your skin?",
                     type: .single,
                     answers: [
                        Answer(text: "It is firm", type: .nofirmness),
                        Answer(text: "It is somewhat firm", type: .nofirmness),
                        Answer(text: "It is sagging", type: .firmness),
                        Answer(text: "It's firm but it is dull", type: .dull),

                      
                ]),
            Question(text: "What do you struggle the most with?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Lines and Wrinkles", type: .lines),
                        Answer(text: "Loss of Firmness", type: .firmness),
                        Answer(text: "Pores and Oily Skin", type: .pores),
                        Answer(text: "Dull, Tired-Looking Skin", type: .dull)
                ]),
        ]
    var questionIndex = 0
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    
    func updateUI() {
           
           singleStackView.isHidden = true
           multipleStackView.isHidden = true
           
           navigationItem.title = "Question #\(questionIndex+1)"
           
           let currentQuestion = questions[questionIndex]
            let currentAnswers = currentQuestion.answers
            let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
           
           switch currentQuestion.type {
           case .single:
               updateSingleStack(using: currentAnswers)
           case .multiple:
               updateMultipleStack(using: currentAnswers)
              }
    func updateSingleStack(using answers: [Answer]) {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            multipleStackView.isHidden = false
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false

            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
            
        }
        
  
}
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
                
                switch sender {
                case singleButton1:
                    answersChosen.append(currentAnswers[0])
                case singleButton2:
                    answersChosen.append(currentAnswers[1])
                case singleButton3:
                    answersChosen.append(currentAnswers[2])
                case singleButton4:
                    answersChosen.append(currentAnswers[3])
                default:
                    break
                }
        
        nextQuestion()
            
        }
        
  
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
                
                if  multiSwitch1.isOn {
                    answersChosen.append(currentAnswers[0])
                }
                if  multiSwitch2.isOn {
                    answersChosen.append(currentAnswers[1])
                }
                if  multiSwitch3.isOn {
                    answersChosen.append(currentAnswers[2])
                }
                if  multiSwitch4.isOn {
                    answersChosen.append(currentAnswers[3])
                }
                
                nextQuestion()
            }
        
    
    
    
    func nextQuestion() {
            questionIndex += 1
            
            if questionIndex < questions.count {
                updateUI()
            } else {
                performSegue(withIdentifier: "ResultsSegue", sender: nil)
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ResultsSegue" {
                let resultsViewController = segue.destination as! ResultsViewController
                resultsViewController.responses = answersChosen
            }
        }
        

}

