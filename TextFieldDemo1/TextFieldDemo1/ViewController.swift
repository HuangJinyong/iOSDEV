//
//  ViewController.swift
//  TextFieldDemo1
//
//  Created by Jinyong on 2016/10/15.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var textField: UITextField!
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        textField = UITextField(frame: CGRect(x: 38, y: 30, width: 220, height: 31))
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "Enter your text here..."
        view.addSubview(textField)
        
        label = UILabel(frame: CGRect(x: 38, y: 61, width: 220, height: 31))
        view.addSubview(label)
        calculateAndDispalyTextFieldLengthWithText(text: textField.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // 计算文本框的字母个数并在标签中显示
    func calculateAndDispalyTextFieldLengthWithText(text: String) {
        var characterOrCharacters = "Character"
        
        if text.characters.count != 1 {
            characterOrCharacters += "s"
        }
        
        let stringLength = text.characters.count
        label.text = "\(stringLength) \(characterOrCharacters)"
    }
    
    // 通过代理方法，接受文本框发送来的委托信息。当文本框中文字变化时就调用这个方法
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var wholeText = ""

        if let text = textField.text {
            wholeText = (text as NSString).replacingCharacters(in: range, with: string)
            
        }
        
        calculateAndDispalyTextFieldLengthWithText(text: wholeText)
        
        return true
    }
    
}

