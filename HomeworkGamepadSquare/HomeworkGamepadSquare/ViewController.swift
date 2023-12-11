//
//  ViewController.swift
//  HomeworkGamepad
//
//  Created by Иван Знак on 19/11/2023.
//

import UIKit

class ViewController: UIViewController {
    let customView = View()
    let customButton = UIButton(type: .system)
    let movingView = UIView()
    let step: CGFloat = 6
    var status = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        startParameters()
        
        customView.buttonUpClosure = {
            if self.movingView.frame.minY - self.step >= self.view.safeAreaLayoutGuide.layoutFrame.minY {
                UIView.animate(withDuration: 0.3){
                    self.movingView.frame.origin.y -= CGFloat(self.step)
                }
            } else {
                self.stopGame()
            }
        }
        
        customView.buttonRightClosure = {
            if (self.movingView.frame.maxX + self.step <= self.view.frame.maxX) && (self.movingView.frame.intersects(self.customView.frame) == false){
                UIView.animate(withDuration: 0.3){
                    self.movingView.frame.origin.x += CGFloat(self.step)
                }
            } else {
                self.stopGame()
            }
        }
        
        customView.buttonLeftClosure = {
            if (self.movingView.frame.minX - self.step >= self.view.frame.minX) && (self.movingView.frame.intersects(self.customView.frame) == false){
                UIView.animate(withDuration: 0.3){
                    self.movingView.frame.origin.x -= CGFloat(self.step)
                }
            } else {
                self.stopGame()
            }
            
        }
        customView.buttonDownClosure = {
            if (self.movingView.frame.maxY + self.step <= self.view.safeAreaLayoutGuide.layoutFrame.maxY) && (self.movingView.frame.intersects(self.customView.frame) == false) {
                UIView.animate(withDuration: 0.3){
                    self.movingView.frame.origin.y += CGFloat(self.step)
                }
            } else {
                self.stopGame()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        UIView.animate(withDuration: 3) {
        //            self.redView.center = self.view.center
        //        } completion: { _ in
        //            UIView.animate(withDuration: 3) {
        //                self.redView.center = originalPoint
        //            }
        //        }
        
    }
    
    private func stopGame(){
        movingView.removeFromSuperview()
        customView.removeFromSuperview()
        view.addSubview(customButton)
        customButton.setTitle("Start again", for: .normal)
        customButton.backgroundColor = .systemBlue
        customButton.layer.cornerRadius = 10
        customButton.tintColor = .white
        customButton.addTarget(self, action: #selector(self.startParameters), for: .touchUpInside)
        customButton.contentVerticalAlignment = .fill
        customButton.contentHorizontalAlignment = .fill
        customButton.titleLabel?.textAlignment = .center
        customButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customButton.heightAnchor.constraint(equalToConstant: 100),
            customButton.widthAnchor.constraint(equalTo: customButton.heightAnchor, multiplier: 1.0),
//            customButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            customButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
        ])
    }
    
    @objc func startParameters(){
        movingView.frame = CGRect(x: view.frame.midX - 50, y: view.frame.minY + 200, width: 100, height: 100)
        movingView.backgroundColor = .red
        view.addSubview(movingView)
        view.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //Constraints customView
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.widthAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 1),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
        ])
        customButton.removeFromSuperview()
    }
}

