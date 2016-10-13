//
//  JYTextField.swift
//  JYTextField
//
//  Created by Jinyong on 2016/10/14.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class JYTextField: UITextField {
    private var password: String = "" // 缓存密码
    private var beginEditingObserver: AnyObject!
    private var endEditingObserver: AnyObject!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        // 监听文本框的输入状态
        beginEditingObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil, queue: nil, using: { (note) in
            
            // 当监听到文本框开始准备输入时，如果密码是隐藏，先将缓存密码还原，再进行输入。
            if self == note.object as! JYTextField && self.isSecureTextEntry {
                self.text = ""
                self.insertText(self.password)
            }
        })
        
        endEditingObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidEndEditing, object: nil, queue: nil, using: { (note) in
            
            // 完成输入时，对输入的密码进行缓存。
            if self == note.object as! JYTextField {
                self.password = self.text!
            }
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(beginEditingObserver)
        NotificationCenter.default.removeObserver(endEditingObserver)
    }
    
    // 重写此方法，实现对文本框进行二次监听。
    override var isSecureTextEntry: Bool{
        get {
            return super.isSecureTextEntry
        }
        set{
            self.resignFirstResponder()
            super.isSecureTextEntry = newValue
            self.becomeFirstResponder()
        }
    }
}
