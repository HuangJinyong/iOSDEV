//
//  ViewController.swift
//  富文本demo1
//
//  Created by Jinyong on 2016/10/15.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label = UILabel()
        label.backgroundColor = UIColor.clear
        label.attributedText = attributedText()
        label.sizeToFit()
        label.center = CGPoint(x: view.center.x, y: 100)
        
        view.addSubview(label)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func attributedText() -> NSAttributedString {
        let string = "iOS SDK"
        let result = NSMutableAttributedString(string: string)
        
        let attributedsForFirstWord = [NSFontAttributeName: UIFont.systemFont(ofSize: 60),
                                       NSForegroundColorAttributeName: UIColor.red,
                                       NSBackgroundColorAttributeName: UIColor.black]
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.darkGray
        shadow.shadowOffset = CGSize(width: 4, height: 4)
        
        let attributedsForSecondWord = [NSFontAttributeName: UIFont.systemFont(ofSize: 60),
                                        NSForegroundColorAttributeName: UIColor.white,
                                        NSBackgroundColorAttributeName: UIColor.red,
                                        NSShadowAttributeName: shadow]
        
        // 在整个字符串中查找”iOS“并且设置它的属性”
        result.setAttributes(attributedsForFirstWord, range: (string as NSString).range(of: "iOS"))
        
        // 对“SDK”做同样的操作
        result.setAttributes(attributedsForSecondWord, range: (string as NSString).range(of: "SDK"))
        
        return NSAttributedString(attributedString: result)
    }
    
}

