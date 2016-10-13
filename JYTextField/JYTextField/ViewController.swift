//
//  ViewController.swift
//  JYTextField
//
//  Created by Jinyong on 2016/10/14.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textfield: JYTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func swichChanged(_ sender: UISwitch) {
        
        textfield.isSecureTextEntry = sender.isOn
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textfield.resignFirstResponder()
    }

}

