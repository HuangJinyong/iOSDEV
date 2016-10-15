//
//  ViewController.swift
//  警告视图和操作列表Demo1
//
//  Created by Jinyong on 2016/10/15.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var controller: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert()
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.present(controller!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // 最简单的警告视图
    func alert() {
        controller = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        controller?.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "xxxxxxxx"
        })

        let action = UIAlertAction(title: "Next", style: .default) { (action) in
            if let textFields = self.controller?.textFields {
                let userName = textFields[0].text
                print(userName)
            }
        }
        
        
        controller?.addAction(action)
    }
    
    // 最简单的操作列表
    func actionSheet() {
        controller = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)

        let actionCancel = UIAlertAction(title: "完成", style: .cancel) { (action) in
            /* do something*/
        }
        
        let actionDestructive = UIAlertAction(title: "删除", style: .destructive) { (action) in
            /* do something*/
        }
        
        controller?.addAction(actionCancel)
        controller?.addAction(actionDestructive)

    }
}

