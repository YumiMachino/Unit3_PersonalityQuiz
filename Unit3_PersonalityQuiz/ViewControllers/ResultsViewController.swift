//
//  ResultViewController.swift
//  Unit3_PersonalityQuiz
//
//  Created by Yumi Machino on 2020/12/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - variables
    var responses:[Answer] = []                             // Array of Answer (answerChosen)
    let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Georgia", size: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0     // unlimited number of lines
        label.lineBreakMode = .byWordWrapping  // for multiple lines
        return label
    }()
    
    let resultTxt: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Georgia", size: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0     // unlimited number of lines
        label.lineBreakMode = .byWordWrapping  // for multiple lines
        return label
    }()
    
    // MARK: - initialization
    init(responses: [Answer]){
    self.responses = responses
        self.resultLabel.text = "aaaa"
    super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [resultLabel,resultTxt])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        self.navigationItem.title = "Result"
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped(_:)))
        self.navigationItem.rightBarButtonItem = doneBtn
        
        calculatePersonalityResult()
    }
    
    @objc
    func doneTapped(_ sender: UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }

    func calculatePersonalityResult() {
        // responses = answerChosen
        
        // one return value of a dictionary as [answer.type: numberCount]
        let frequencyOfAnswers = responses.reduce(into: [:])  {
            (counts, answer) in counts [answer.type, default: 0] += 1
        }
        
        // sort by numberCount, return as an array of a key/pair (Key: type, value: numberCount)
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        // the first element of sorted array is the largest value, return its key
        let mostCommonAnswer = frequentAnswerSorted.first!.key
        
        resultLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultTxt.text = mostCommonAnswer.definition
    }
}
