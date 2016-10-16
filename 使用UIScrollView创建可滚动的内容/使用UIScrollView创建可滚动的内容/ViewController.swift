//
//  ViewController.swift
//  使用UIScrollView创建可滚动的内容
//
//  Created by Jinyong on 2016/10/16.
//  Copyright © 2016年 Jinyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let image = UIImage(named: "img")
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: image)
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        
        view.addSubview(scrollView)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 当用户滚动或拖动时触发
        scrollView.alpha = 0.5
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 当滚动结束时触发
        scrollView.alpha = 1
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // 当完成拖拽时触发
        scrollView.alpha = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

