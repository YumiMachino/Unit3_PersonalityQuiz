//
//  ViewController.swift
//  Unit3_PersonalityQuiz
//
//  Created by Yumi Machino on 2020/12/23.
//

import UIKit

class IntroductionViewController: UIViewController {
    

    let quizTheme: UILabel = {
       let lb = UILabel()
        lb.text = "Which Animal Are You?"
        lb.font = UIFont(name:"Georgia", size: 30.0)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let startBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Begin Personality Quiz", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15.0)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        let startView = UIStackView(arrangedSubviews: [quizTheme,startBtn])
        startView.axis = .vertical
        startView.alignment = .center
        startView.distribution = .fill
        startView.spacing = 5
        startView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(startView)
        startBtn.addTarget(self, action: #selector(startBtnTapped(_:)), for: .touchUpInside)
        startView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        startView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        
        let dogEmoji = createEmoji(emoji: "🐶")
        let catEmoji = createEmoji(emoji: "🐱")
        let rabbitEmoji = createEmoji(emoji: "🐰")
        let turtleEmoji = createEmoji(emoji: "🐢")
     
        view.addSubview(dogEmoji)
        view.addSubview(catEmoji)
        view.addSubview(rabbitEmoji)
        view.addSubview(turtleEmoji)
        
        dogEmoji.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        dogEmoji.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        catEmoji.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        catEmoji.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        rabbitEmoji.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        rabbitEmoji.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        turtleEmoji.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        turtleEmoji.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
    
    @objc
    func startBtnTapped(_ sender: UIButton){
        let quizVC = QuestionViewController()
        navigationController?.pushViewController(quizVC, animated: true)
    }


}

