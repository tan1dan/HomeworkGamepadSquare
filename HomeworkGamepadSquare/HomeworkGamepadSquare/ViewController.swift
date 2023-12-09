//
//  ViewController.swift
//  HomeworkGamepad
//
//  Created by Иван Знак on 19/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let customView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //Constraints customView
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.widthAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
        
        customView.buttonUpClosure = {
            print("Button Up was Tapped")
        }
        customView.buttonRightClosure = {
            print("Button Right was Tapped")
        }
        customView.buttonLeftClosure = {
            print("Button Left was Tapped")
        }
        customView.buttonDownClosure = {
            print("Button Down was Tapped")
        }
        print("Hello")
    }


}

