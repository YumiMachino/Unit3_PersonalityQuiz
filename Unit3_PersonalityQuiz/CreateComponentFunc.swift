//
//  CreateComponentFunc.swift
//  Unit3_PersonalityQuiz
//
//  Created by Yumi Machino on 2020/12/26.
//

import UIKit
import Foundation


func createEmoji(emoji: String) -> UILabel {
    let emojiLabel = UILabel()
    emojiLabel.font = .systemFont(ofSize: 40.0)
    emojiLabel.textAlignment = .center
    emojiLabel.translatesAutoresizingMaskIntoConstraints = false
    emojiLabel.text = "\(emoji)"
    return emojiLabel
}

func createQuestionLabel(question: String) -> UILabel{
    let qlabel = UILabel()
    qlabel.font = .systemFont(ofSize: 20.0)
    qlabel.textAlignment = .center
    qlabel.translatesAutoresizingMaskIntoConstraints = false
    qlabel.text = "\(question)"
    qlabel.numberOfLines = 0     // unlimited number of lines
    qlabel.lineBreakMode = .byWordWrapping  // for multiple lines
    qlabel.backgroundColor = .white
    return qlabel
}

func createButton(answer: String) -> UIButton {
    let btn = UIButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.setTitle("\(answer)", for: .normal)
    btn.setTitleColor(.systemBlue, for: .normal)
    btn.backgroundColor = .lightGray
    return btn
}


func createStack(label: UILabel, onOffSwitch: UISwitch)-> UIStackView{
    let stackView = UIStackView(arrangedSubviews: [label, onOffSwitch])
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}

func createLabel(answer: String) -> UILabel{
    let lb = UILabel()
    lb.font = .systemFont(ofSize: 18.0)
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.text = "\(answer)"
    lb.textAlignment = .center
    return lb
}
