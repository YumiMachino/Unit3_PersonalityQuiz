//
//  SecondViewController.swift
//  Unit3_PersonalityQuiz
//
//  Created by Yumi Machino on 2020/12/23.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - variables
    var questionIndex = 0
    let view1: UIView = UIView()
    let view2: UIView = UIView()
    let view3: UIView = UIView()
    var answersChosen: [Answer] = []
    var slider: UISlider = UISlider()
    var index: Int = 0
    
    let singleView: UIView = SingleAnswerView()
    
//    var  questions: [Question] = [
//        Question(
//            text: "Which food do you like the most?",
//            type: .Single,
//            answers: [
//                Answer(text: "Steak", type: .dog),
//                Answer(text: "Fish", type: .cat),
//                Answer(text: "Carrots", type: .rabbit),
//                Answer(text: "Corn", type: .turtle)
//            ]
//        ),
//        Question(
//            text: "Which activities do you enjoy?",
//            type: .multiple,
//            answers: [
//                Answer(text: "Swimming", type: .turtle),
//                Answer(text: "Sleeping", type: .cat),
//                Answer(text: "Cuddling", type: .rabbit),
//                Answer(text: "Eating", type: .dog)
//            ]
//        ),
//        Question(
//            text: "How much do you enjoy car rides?",
//            type: .ranged,
//            answers: [
//                Answer(text: "I dislike them", type: .cat),
//                Answer(text: "I get a little nervous", type: .rabbit),
//                Answer(text: "I barely notice them", type: .turtle),
//                Answer(text: "I love them", type: .dog)
//            ]
//        )]
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        questionIndex = 0
        index = 0
        updateUI()
    }
    
    // MARK: - Single-Answer View set up
    func setUpView1(){
        let view1 = UIView()
        view.addSubview(view1)
        view1.backgroundColor = .white
        view1.matchParent()

        let question1 = createQuestionLabel(question:questions[0].text)
        view1.addSubview(question1)
        question1.questionLabelConstraint()

        let btn1 = createButton(answer: questions[0].answers[0].text)
        let btn2 = createButton(answer: questions[0].answers[1].text)
        let btn3 = createButton(answer: questions[0].answers[2].text)
        let btn4 = createButton(answer: questions[0].answers[3].text)
        
        btn1.addTarget(self, action: #selector(singleAnswerButtonPressed(_:)), for: .touchUpInside)
        btn1.tag = 1
        btn2.addTarget(self, action: #selector(singleAnswerButtonPressed(_:)), for: .touchUpInside)
        btn2.tag = 2
        btn3.addTarget(self, action: #selector(singleAnswerButtonPressed(_:)), for: .touchUpInside)
        btn3.tag = 3
        btn4.addTarget(self, action: #selector(singleAnswerButtonPressed(_:)), for: .touchUpInside)
        btn4.tag = 4

        let singleStackView = UIStackView(arrangedSubviews: [btn1,btn2,btn3,btn4])
        singleStackView.axis = .vertical
        singleStackView.alignment = .center
        singleStackView.distribution = .fillEqually
        singleStackView.spacing = 20
        singleStackView.translatesAutoresizingMaskIntoConstraints = false

        btn1.singleViewButtonConstraint()
        btn2.singleViewButtonConstraint()
        btn3.singleViewButtonConstraint()
        btn4.singleViewButtonConstraint()

        view1.addSubview(singleStackView)
        singleStackView.singleStackViewConstraint(label: question1)
    }
    
    @objc
    func singleAnswerButtonPressed(_ sender: UIButton){
        let currentAnswers = questions[questionIndex].answers                   //options for answers
        switch sender.tag {
        case 1:
            answersChosen.append(currentAnswers[0])                             //0th of current answers array
        case 2:
            answersChosen.append(currentAnswers[1])
        case 3:
            answersChosen.append(currentAnswers[2])
        case 4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
       nextQuestion()
    }
    
    
    // MARK: - Multiple-Answer View set up
    func setUpView2(){
        let view2 = UIView()
        view.addSubview(view2)
        view2.backgroundColor = .white
        view2.matchParent()
        
        let question2 = createQuestionLabel(question: questions[1].text)
        view2.addSubview(question2)
        question2.questionLabelConstraint()
        
        let stack1lb = createLabel(answer:questions[1].answers[0].text)
        let stack1Switch = UISwitch()
        stack1Switch.addTarget(self, action: #selector(multipleAnswerButtonPressed(_:)), for: .valueChanged)
        stack1Switch.setOn(false, animated: true)
        stack1Switch.tag = 1
        let stack1 = createStack(label: stack1lb, onOffSwitch: stack1Switch)
        stack1.backgroundColor = .lightGray
       
        let stack2lb = createLabel(answer:questions[1].answers[1].text)
        let stack2Switch = UISwitch()
        stack2Switch.addTarget(self, action: #selector(multipleAnswerButtonPressed(_:)), for: .valueChanged)
        stack2Switch.setOn(false, animated: true)
        stack2Switch.tag = 2
        let stack2 = createStack(label: stack2lb, onOffSwitch: stack2Switch)
        stack2.backgroundColor = .lightGray
        
        let stack3lb = createLabel(answer:questions[1].answers[2].text)
        let stack3Switch = UISwitch()
        stack3Switch.addTarget(self, action: #selector(multipleAnswerButtonPressed(_:)), for: .valueChanged)
        stack3Switch.setOn(false, animated: true)
        stack3Switch.tag = 3
        let stack3 = createStack(label: stack3lb, onOffSwitch: stack3Switch)
        stack3.backgroundColor = .lightGray
        
        let stack4lb = createLabel(answer:questions[1].answers[3].text)
        let stack4Switch = UISwitch()
        stack4Switch.addTarget(self, action: #selector(multipleAnswerButtonPressed(_:)), for: .valueChanged)
        stack4Switch.setOn(false, animated: true)
        stack4Switch.tag = 4
        let stack4 = createStack(label: stack4lb, onOffSwitch: stack4Switch)
        stack4.backgroundColor = .lightGray
        
        let btn = createButton(answer: "Submit Answer")
        btn.addTarget(self, action: #selector(multipleAnswerSubmitted(_:)), for: .touchUpInside)
        
        let multipleAnswerStack = UIStackView(arrangedSubviews: [stack1,stack2,stack3,stack4,btn])
        multipleAnswerStack.axis = .vertical
        multipleAnswerStack.alignment = .center
        multipleAnswerStack.distribution = .fillEqually
        multipleAnswerStack.spacing = 20
        multipleAnswerStack.translatesAutoresizingMaskIntoConstraints = false
        view2.addSubview(multipleAnswerStack)
        stack1.lbSwitchPairConstraint()
        stack2.lbSwitchPairConstraint()
        stack3.lbSwitchPairConstraint()
        stack4.lbSwitchPairConstraint()
        btn.lbSwitchPairConstraint()
        multipleAnswerStack.singleStackViewConstraint(label: question2)
    }
    
    @objc
    func multipleAnswerButtonPressed(_ sender: UISwitch!){
        let currentAnswers = questions[questionIndex].answers
        
        if sender.isOn && sender.tag == 1{
            answersChosen.append(currentAnswers[0])
        }
        if sender.isOn && sender.tag == 2{
          answersChosen.append(currentAnswers[1])
        }
        if sender.isOn && sender.tag == 3{
          answersChosen.append(currentAnswers[2])
        }
        if sender.isOn && sender.tag == 4{
          answersChosen.append(currentAnswers[3])
        }
    }
    
    @objc
    func multipleAnswerSubmitted(_ sender: UIButton) {
        nextQuestion()
    }
    
    
    // MARK: - Slider-Answer View set up
    func setUpView3(){
        let view3 = UIView()
        view.addSubview(view3)
        view3.backgroundColor = .white
        view3.matchParent()

        let question3 = createQuestionLabel(question: questions[2].text)
        view3.addSubview(question3)
        question3.questionLabelConstraint()

        let lb1 = createLabel(answer: "dislike")
        let lb2 = createLabel(answer: "love")
        let stack = UIStackView(arrangedSubviews: [lb1,lb2])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 20
        view3.addSubview(stack)

        let slider = UISlider()
        slider.addTarget(self, action: #selector(rangedAnswerButtonPressed(_:)), for: .valueChanged)
        let btn = createButton(answer: "Submit Answer")
        btn.addTarget(self, action: #selector(rangedAnswerSubmitted(_:)), for: .touchUpInside)
        
        let sliderStack = UIStackView(arrangedSubviews: [slider, stack, btn])
        sliderStack.axis = .vertical
        sliderStack.translatesAutoresizingMaskIntoConstraints = false
        sliderStack.distribution = .fillEqually
        sliderStack.spacing = 20
        view3.addSubview(sliderStack)
        sliderStack.singleStackViewConstraint(label: question3)
    }

    @objc
    func rangedAnswerButtonPressed(_ sender: UISlider) {
        let currentAnswers = questions[questionIndex].answers
        index = Int(round(sender.value * Float(currentAnswers.count - 1)))
    }
    
    @objc
    func rangedAnswerSubmitted(_ sender : UIButton) {
        let currentAnswers = questions[questionIndex].answers
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }

    
    // MARK: - UI Update
    func updateUI(){
        navigationItem.title = "Question #\(questionIndex + 1)"

        switch questionIndex {
        case 0:
            setUpView1()
        case 1:
            view1.isHidden = true
            setUpView2()
        case 2:
            view1.isHidden = true
            view2.isHidden = true
            setUpView3()
        default:
            break
        }
    
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        }else {
            let resultVC = ResultsViewController(responses: answersChosen)
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
}
