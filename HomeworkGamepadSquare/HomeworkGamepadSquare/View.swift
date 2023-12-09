//
//  View.swift
//  HomeworkGamepad
//
//  Created by Иван Знак on 19/11/2023.
//

import UIKit

class View: UIView {
    
    let buttonUp = UIButton(type: .system)
    let buttonDown = UIButton(type: .system)
    let buttonRight = UIButton(type: .system)
    let buttonLeft = UIButton(type: .system)
    var buttonsArray:[UIView]?
    
    var buttonUpClosure: (() -> ())?
    var buttonRightClosure: (() -> ())?
    var buttonLeftClosure: (() -> ())?
    var buttonDownClosure: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       commonInit()
    }
    private func commonInit(){
        buttonsArray = [buttonUp, buttonDown, buttonLeft, buttonRight]
        addSubviews(views: buttonsArray)
        
//        buttonUp.setTitle("Up", for: .normal)
        buttonUp.setImage(.init(systemName: "arrowshape.up.fill"), for: .normal)
        buttonUp.contentHorizontalAlignment = .fill
        buttonUp.contentVerticalAlignment = .fill
//        buttonDown.setTitle("Down", for: .normal)
        buttonDown.setImage(.init(systemName: "arrowshape.down.fill"), for: .normal)
        buttonDown.contentHorizontalAlignment = .fill
        buttonDown.contentVerticalAlignment = .fill
//        buttonLeft.setTitle("Left", for: .normal)
        buttonLeft.setImage(.init(systemName: "arrowshape.left.fill"), for: .normal)
        buttonLeft.contentHorizontalAlignment = .fill
        buttonLeft.contentVerticalAlignment = .fill
//        buttonRight.setTitle("Right", for: .normal)
        buttonRight.setImage(.init(systemName: "arrowshape.right.fill"), for: .normal)
        buttonRight.contentHorizontalAlignment = .fill
        buttonRight.contentVerticalAlignment = .fill
        
        buttonUp.titleLabel?.textAlignment = .center
        buttonUp.addTarget(self, action: #selector(actionUp) , for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(actionLeft) , for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(actionRight) , for: .touchUpInside)
        buttonDown.addTarget(self, action: #selector(actionDown) , for: .touchUpInside)
        NSLayoutConstraint.activate([
            //ButtonUp
            buttonUp.centerXAnchor.constraint(equalTo: buttonUp.centerXAnchor),
            buttonUp.bottomAnchor.constraint(equalTo: buttonRight.topAnchor),
            buttonUp.heightAnchor.constraint(equalTo: buttonUp.widthAnchor, multiplier: 1),
            buttonUp.topAnchor.constraint(equalTo: topAnchor),
            buttonUp.heightAnchor.constraint(equalTo: buttonRight.heightAnchor),
            buttonUp.widthAnchor.constraint(equalTo: buttonRight.widthAnchor),
            
            //ButtonDown
            buttonDown.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonDown.topAnchor.constraint(equalTo: buttonLeft.bottomAnchor),
            buttonDown.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonDown.heightAnchor.constraint(equalTo: buttonDown.widthAnchor, multiplier: 1),
            buttonDown.heightAnchor.constraint(equalTo: buttonLeft.heightAnchor),
            buttonDown.widthAnchor.constraint(equalTo: buttonLeft.widthAnchor),
            
            //ButtonRight
            buttonRight.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonRight.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonRight.leadingAnchor.constraint(equalTo: buttonLeft.trailingAnchor, constant: 30),
            buttonRight.heightAnchor.constraint(equalTo: buttonRight.widthAnchor, multiplier: 1),
            buttonRight.leadingAnchor.constraint(equalTo: buttonUp.trailingAnchor),
            buttonRight.heightAnchor.constraint(equalTo: buttonDown.heightAnchor),
            buttonRight.widthAnchor.constraint(equalTo: buttonDown.widthAnchor),
//            buttonRight.topAnchor.constraint(equalTo: buttonUp.bottomAnchor),
//            buttonRight.bottomAnchor.constraint(equalTo: buttonDown.topAnchor),
            
            //ButtonLeft
            
            buttonLeft.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonLeft.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonLeft.heightAnchor.constraint(equalTo: buttonLeft.widthAnchor, multiplier: 1),
            buttonLeft.trailingAnchor.constraint(equalTo: buttonDown.leadingAnchor),
            buttonLeft.heightAnchor.constraint(equalTo: buttonUp.heightAnchor),
            buttonLeft.widthAnchor.constraint(equalTo: buttonUp.widthAnchor),
//            buttonLeft.topAnchor.constraint(equalTo: buttonUp.bottomAnchor),
//            buttonLeft.bottomAnchor.constraint(equalTo: buttonDown.topAnchor),
        ])
    }
    
    
    
    
    @objc func actionUp(){
        buttonUpClosure?()
    }
    @objc func actionLeft(){
        buttonLeftClosure?()
    }
    @objc func actionRight(){
        buttonRightClosure?()
    }
    @objc func actionDown(){
        buttonDownClosure?()
    }
}
extension UIView {
    func addSubviews(views: [UIView]?){
        for view in views ?? []{
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}
