//
//  ViewController.swift
//  textAnimation
//
//  Created by Jimmy Ko on 2019-08-28.
//  Copyright © 2019 Jimmy Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var animateTitle: UILabel!
    @IBOutlet weak var animateDescription: UILabel!
    
    var shouldFadeIn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateTitle.numberOfLines = 2
        animateDescription.numberOfLines = 20
        
        animateTitle.alpha = 0
        animateDescription.alpha = 0
        
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)

    
    }
    
    @objc func runTimedCode() {
//        if shouldFadeIn {
            fadeIn()
//        } else {
            fadeOut()
//        }
//        shouldFadeIn = !shouldFadeIn
    }
    
    func fadeOut() {
        print("fading out")
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, delay: 3.0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.animateTitle.transform = CGAffineTransform.identity
                self.animateTitle.alpha = 0
            }) { (Bool) in
                UIView.animate(withDuration: 1.0, delay: 0.25, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    self.animateDescription.transform = CGAffineTransform.identity
                    self.animateDescription.alpha = 0
                })
            }
        }
    }
    
    func fadeIn() {
        print("fading in")

        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, delay: 0.25, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.animateTitle.transform = CGAffineTransform.init(translationX: 20, y: 0)
                self.animateTitle.alpha = 1
            }) { (Bool) in
                 UIView.animate(withDuration: 1.0, delay: 0.25, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                    self.animateDescription.transform = CGAffineTransform.init(translationX: 0, y: -20)
                    self.animateDescription.alpha = 1
                 })
            }
        }
    }
}
