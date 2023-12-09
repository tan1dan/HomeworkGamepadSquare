//
//  View.swift
//  HomeworkGamepad
//
//  Created by Иван Знак on 19/11/2023.
//

import UIKit

class View: UIView {
    
    @IBOutlet weak var buttonUp: UIButton!
    @IBOutlet weak var buttonRight: UIButton!
    @IBOutlet weak var buttonDown: UIButton!
    @IBOutlet weak var buttonLeft: UIButton!
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
        
    }
    
    private func commonInit(){
        let xib = UINib(nibName: "View", bundle: nil)
        let view = xib.instantiate(withOwner: self).first as! UIView
        
        view.frame = self.bounds
        addSubview(view)
        buttonUp.setTitle("Up", for: .normal)
        buttonDown.setTitle("Down", for: .normal)
        buttonLeft.setTitle("Left", for: .normal)
        buttonRight.setTitle("Right", for: .normal)
        buttonUp.addTarget(self, action: #selector(actionUp) , for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(actionLeft) , for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(actionRight) , for: .touchUpInside)
        buttonDown.addTarget(self, action: #selector(actionDown) , for: .touchUpInside)
        
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
