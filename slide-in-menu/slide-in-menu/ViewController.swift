//
//  ViewController.swift
//  slide-in-menu
//
//  Created by siroratt suntronsuk on 25/10/2562 BE.
//  Copyright © 2562 siroratt suntronsuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let launcher = SettingsLauncher()
    @IBAction func buttonDidTap(_ sender: Any) {
        slideUpMenu()
    }
    
    func slideUpMenu() {
        launcher.showSettings()
    }
    
    
    
}

