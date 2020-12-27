//
//  UIView+CustomConstraintLayout.swift
//  Unit3_PersonalityQuiz
//
//  Created by Yumi Machino on 2020/12/24.
//

import Foundation
import UIKit

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

// UIview, label, button ok
extension UIView {
    // if there is an outer view -> match subview to the outer view, argument is optional(default value is zero here)
    func matchParent(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superTopAnchor, constant: padding.top).isActive = true
        }
        if let superBottomAnchor = superview?.bottomAnchor {
            self.bottomAnchor.constraint(equalTo: superBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func questionLabelConstraint() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            self.topAnchor.constraint(equalTo: superTopAnchor, constant: 100).isActive = true
        }
        if let superWidthAnchor = superview?.widthAnchor {
            self.widthAnchor.constraint(equalTo: superWidthAnchor, multiplier: 0.8).isActive = true
        }
        if let superHeightAnchor = superview?.heightAnchor {
            self.heightAnchor.constraint(equalTo: superHeightAnchor, multiplier: 0.2).isActive = true
        }
        if let superCenterXAnchor = superview?.centerXAnchor {
            self.centerXAnchor.constraint(equalTo: superCenterXAnchor).isActive = true
        }
    }
    
    func singleViewButtonConstraint(){
        translatesAutoresizingMaskIntoConstraints = false
        if let superCenterXAnchor = superview?.centerXAnchor {
            self.centerXAnchor.constraint(equalTo: superCenterXAnchor).isActive = true
        }
        if let superWidthAnchor = superview?.widthAnchor {
            self.widthAnchor.constraint(equalTo: superWidthAnchor, multiplier: 0.8).isActive = true
        }
    }
    
    func singleStackViewConstraint(label: UILabel){
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        
        if let superLeadingnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingnchor, constant: 20).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTrailingAnchor, constant: -20).isActive = true
        }
        if let superHeightAnchor = superview?.heightAnchor {
            self.heightAnchor.constraint(equalTo: superHeightAnchor, multiplier: 0.4).isActive = true
        }
        if let superCenterXAnchor = superview?.centerXAnchor {
            self.centerXAnchor.constraint(equalTo: superCenterXAnchor).isActive = true
        }
    }
    
    func lbSwitchPairConstraint(){
        translatesAutoresizingMaskIntoConstraints = false
        if let superLeadingAnchor = superview?.leadingAnchor {
            self.leadingAnchor.constraint(equalTo: superLeadingAnchor).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            self.trailingAnchor.constraint(equalTo: superTrailingAnchor).isActive = true
        }
    }

    
    
}
