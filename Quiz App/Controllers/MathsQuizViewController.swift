//
//  MathsQuizViewController.swift
//  Quiz App
//
//  Created by GOTTIMUKKALA RAMESH on 07/12/24.
//

import UIKit

class MathsQuizViewController: UIViewController {
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionAView: UIView!
    @IBOutlet weak var optionALabel: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionBView: UIView!
    @IBOutlet weak var optionBLabel: UILabel!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionCView: UIView!
    @IBOutlet weak var optionCLabel: UILabel!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionDView: UIView!
    @IBOutlet weak var optionDLabel: UILabel!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var score = 0
    var currentQuestion = 0
    var questions = QuestionModel.mathQuestions
    var selectAnswer = Int()
    var updateScore = Int()
    var time: Timer?
    var timeRemaining = 10
    var isQuizSubmitted = false
    var result = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionAView.layer.borderWidth = 1
        optionAView.layer.borderColor = UIColor.gray.cgColor
        optionAView.layer.cornerRadius = 20
        optionALabel.layer.borderWidth = 1
        optionALabel.layer.borderColor = UIColor.gray.cgColor
        optionALabel.layer.cornerRadius = optionALabel.frame.size.width / 2
        
        optionBView.layer.borderWidth = 1
        optionBView.layer.borderColor = UIColor.gray.cgColor
        optionBView.layer.cornerRadius = 20
        optionBLabel.layer.borderWidth = 1
        optionBLabel.layer.borderColor = UIColor.gray.cgColor
        optionBLabel.layer.cornerRadius = optionALabel.frame.size.width / 2
        
        optionCView.layer.borderWidth = 1
        optionCView.layer.borderColor = UIColor.gray.cgColor
        optionCView.layer.cornerRadius = 20
        optionCLabel.layer.borderWidth = 1
        optionCLabel.layer.borderColor = UIColor.gray.cgColor
        optionCLabel.layer.cornerRadius = optionALabel.frame.size.width / 2
        
        optionDView.layer.borderWidth = 1
        optionDView.layer.borderColor = UIColor.gray.cgColor
        optionDView.layer.cornerRadius = 20
        optionDLabel.layer.borderWidth = 1
        optionDLabel.layer.borderColor = UIColor.gray.cgColor
        optionDLabel.layer.cornerRadius = optionALabel.frame.size.width / 2
        
        submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 10
        submitButton.layer.borderColor = UIColor.white.cgColor
        submitButton.isHidden = true
        
        // Do any additional setup after loading the view.
        
        startTimer()
        updateQuestion()
        
    }
    
    
    @IBAction func option(_ sender: UIButton) {
        
        if sender.tag == selectAnswer {
            score += 1
            result = score
            print("Score is : \(score)")
        }else {
            print(" Correct Answer: \(selectAnswer)")
            
        }
        moveToNextQuestion()
        if currentQuestion == questions.count {
            time?.invalidate()
            isQuizSubmitted = true
            resultView()
            submitButton.isHidden = false
        }
       
    }
    
    
    @IBAction func submitButtonCLicked(_ sender: Any) {
        
//        print("Quiz is submitted!")
//        isQuizSubmitted = true
//        time?.invalidate()
//        resultView()
        _ = TaskTableViewController()
        navigationController?.popViewController(animated: true)
    
    }
    
    func updateQuestion() {
        
        guard !isQuizSubmitted else {
            alert(title: "Oop's Quiz is Submitted", message: "Please Retry or try Again..")
            return
        }
        
        guard currentQuestion < questions.count else {
            time?.invalidate()
            return
        }
        let question = questions[currentQuestion]
        
        questionLabel.text = question.question
        optionA.setTitle(question.options[0], for: .normal)
        optionB.setTitle(question.options[1], for: .normal)
        optionC.setTitle(question.options[2], for: .normal)
        optionD.setTitle(question.options[3], for: .normal)
        selectAnswer = question.correctOption
        
        resetTimer()
    }
    
    func startTimer() {
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func resetTimer() {
        time?.invalidate()
        timeRemaining = 10
        timeLabel.text = "Time Remaning: \(timeRemaining)"
        startTimer()
    }
    
    @objc func updateTimer() {
        
        if timeRemaining >= 0 {
            timeLabel.text = "Time Remaning: \(timeRemaining)"
            timeRemaining -= 1
        }else {
            moveToNextQuestion()
        }
        
    }
    
    func moveToNextQuestion() {
        currentQuestion += 1
        updateQuestion()
    }
    
    func resultView()  {
        
        let resultView = UIViewController()
        resultView.view.backgroundColor = UIColor.systemGreen
        resultView.modalPresentationStyle = .automatic
        
        let lable = UILabel()
        lable.text = "Your Score !!"
        lable.textColor = .black
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        let scorelable = UILabel()
        scorelable.text = "\(result)/\(currentQuestion)"
        scorelable.textColor = .black
        scorelable.textAlignment = .center
        scorelable.translatesAutoresizingMaskIntoConstraints = false
        
        resultView.view.addSubview(lable)
        resultView.view.addSubview(scorelable)
        
        NSLayoutConstraint.activate([
            lable.centerXAnchor.constraint(equalTo: resultView.view.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: resultView.view.centerYAnchor),
            lable.widthAnchor.constraint(equalToConstant: 150),
            lable.heightAnchor.constraint(equalToConstant: 50),
            
            scorelable.centerXAnchor.constraint(equalTo: resultView.view.centerXAnchor),
            scorelable.centerYAnchor.constraint(equalTo: lable.bottomAnchor, constant: 10),
            scorelable.widthAnchor.constraint(equalToConstant: 100),
            scorelable.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        present(resultView, animated: true)
    }
    
   
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
