//
//  ViewController.swift
//  iOSLoginAnimation
//
//  Created by fu on 16/7/18.
//  Copyright © 2016年 fhc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buble5: UIImageView!
    @IBOutlet var buble4: UIImageView!
    @IBOutlet var buble3: UIImageView!
    @IBOutlet var buble2: UIImageView!
    @IBOutlet var buble1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buble1.transform = CGAffineTransformMakeScale(0, 0)
        self.buble2.transform = CGAffineTransformMakeScale(0, 0)
        self.buble3.transform = CGAffineTransformMakeScale(0, 0)
        self.buble4.transform = CGAffineTransformMakeScale(0, 0)
        self.buble5.transform = CGAffineTransformMakeScale(0, 0)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //同一组动画 usingSpringWithDamping 要一样  options的选项为空的话不能写nil了 只能[]
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options:[], animations: {
            
            self.buble1.transform = CGAffineTransformMakeScale(1, 1)
            self.buble4.transform = CGAffineTransformMakeScale(1, 1)
            
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options:[], animations: {
            
            
            self.buble2.transform = CGAffineTransformMakeScale(1, 1)
            self.buble3.transform = CGAffineTransformMakeScale(1, 1)
            
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options:[], animations: {
            
            self.buble5.transform = CGAffineTransformMakeScale(1, 1)
            
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

