//
//  SignleAnswerView.swift
//  Unit3_PersonalityQuiz
//
//  Created by Takayuki Yamaguchi on 2020-12-27.
//

import UIKit

class SignleAnswerView: UIView {
    
//    var mainView : UIView!{
//        didSet{
//            setUpView1()
//            mainView.addSubview(self)
//            self.matchParent()
//        }
//    }

//     MARK: - Single-Answer View set up
//    init(mainView: UIView) {
//        super.init(frame: .zero)
//        setUpView1()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
    var btn1 : UIButton!
    var btn2 : UIButton!
    var btn3 : UIButton!
    var btn4 : UIButton!

    
    func setUpView1() {
        self.backgroundColor = .white
//        self.matchParent()

        let question1 = createQuestionLabel(question:questions[0].text)
        self.addSubview(question1)
        question1.questionLabelConstraint()

        btn1 = createButton(answer: questions[0].answers[0].text)
        btn2 = createButton(answer: questions[0].answers[1].text)
        btn3 = createButton(answer: questions[0].answers[2].text)
        btn4 = createButton(answer: questions[0].answers[3].text)
        


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

        self.addSubview(singleStackView)
        singleStackView.singleStackViewConstraint(label: question1)
    }
    

    

}
