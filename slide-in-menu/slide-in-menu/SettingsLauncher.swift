//
//  SettingsLauncher.swift
//  slide-in-menu
//
//  Created by siroratt suntronsuk on 29/10/2562 BE.
//  Copyright © 2562 siroratt suntronsuk. All rights reserved.
//


import UIKit
class SettingsLauncher: NSObject {
    let blackView = UIView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    func showSettings() {
//        UIApplication.shared.keyWindow
//        prove the keywindow behavior in iPadOs that support multiple scene
        
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            keyWindow.addSubview(blackView)
            keyWindow.addSubview(collectionView)
            
            collectionView.frame = CGRect(x: 0, y: keyWindow.frame.height, width: keyWindow.frame.width, height: 200)
            blackView.frame = keyWindow.frame
            blackView.alpha = 0
            
            let height: CGFloat = 200
            let y = keyWindow.frame.height - height
//            UIView.animate(withDuration: 0.5) {
//                self.blackView.alpha = 1
//                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
//            }
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        }
    }
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
                self.collectionView.frame = CGRect(x: 0, y: keyWindow.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
    }
}
