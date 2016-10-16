//
//  ViewController.swift
//  使用UIActivityViewController显示分享选项
//
//  Created by Jinyong on 2016/10/16.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var textField: UITextField!
    var buttonShare: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButtonShare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func createTextField() {
        textField = UITextField(frame: CGRect(x: 20, y: 35, width: 280, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text to share..."
        textField.delegate = self
        
        view.addSubview(textField)
    }
    
    func createButtonShare() {
        buttonShare = UIButton(frame: CGRect(x: 20, y: 80, width: 280, height: 44))
        buttonShare.backgroundColor = UIColor.blue
        buttonShare.setTitle("share", for: .normal)
        buttonShare.addTarget(self, action: #selector(self.handleShare(sender:)), for: .touchUpInside)
        
        view.addSubview(buttonShare)
    }
    
    func handleShare(sender: UIButton) {
        // 需要先确定文本框中有内容可分享，如果没有，则简单的显示一个警告视图告诉用户为什么不能分享文本框的内容。
        if textField.text!.isEmpty {
            let message = "这里没有所要分享的内容"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        let activityController = UIActivityViewController(activityItems: [textField.text!], applicationActivities: nil)
        
        self.present(activityController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

