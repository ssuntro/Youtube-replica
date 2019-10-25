//
//  ViewController.swift
//  slide-in-menu
//
//  Created by siroratt suntronsuk on 25/10/2562 BE.
//  Copyright © 2562 siroratt suntronsuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let blackView = UIView()
    @IBAction func buttonDidTap(_ sender: Any) {
        slideUpMenu()
    }
    
    func slideUpMenu() {
//        UIApplication.shared.keyWindow
//        prove the keywindow behavior in iPadOs that support multiple scene
        
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            keyWindow.addSubview(blackView)
            blackView.frame = keyWindow.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
            }
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        }
        
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    
}

