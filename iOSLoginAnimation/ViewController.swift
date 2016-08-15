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
    @IBOutlet var logo: UIImageView!
    @IBOutlet var dot: UIImageView!
    @IBOutlet var userName: UITextField!
    
    @IBOutlet var password: UITextField!
    @IBOutlet var loginBtn: UIButton!
    
    let spinner = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    let warningMessage = UIImageView.init(image: UIImage.init(named: "Warning"))
    var loginPosition = CGPointZero;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Login";
        self.buble1.transform = CGAffineTransformMakeScale(0, 0)
        self.buble2.transform = CGAffineTransformMakeScale(0, 0)
        self.buble3.transform = CGAffineTransformMakeScale(0, 0)
        self.buble4.transform = CGAffineTransformMakeScale(0, 0)
        self.buble5.transform = CGAffineTransformMakeScale(0, 0)
        
        //logo
        self.logo.center.x -= self.view.bounds.width
        self.dot.center.x -= self.view.bounds.width/2
        
        let paddingViewForUsername = UIView.init(frame: CGRectMake(0, 0, 44, self.userName.frame.height))
        self.userName.leftView = paddingViewForUsername
        self.userName.leftViewMode = .Always
        
        let paddingViewForPassword = UIView(frame: CGRectMake(0,0,44,self.password.frame.height))
        self.password.leftView = paddingViewForPassword
        self.password.leftViewMode = .Always
        
        let userImageView = UIImageView.init(image: UIImage.init(named: "User"))
        userImageView.frame.origin = CGPoint.init(x: 13, y: 10)
        self.userName.addSubview(userImageView)
        
        let passwordImageView = UIImageView.init(image: UIImage.init(named: "Key"))
        passwordImageView.frame.origin = CGPoint.init(x: 12, y: 9)
        self.password.addSubview(passwordImageView)
        
        self.userName.center.x -= self.view.bounds.width
        self.password.center.x -= self.view.bounds.width
        
        self.loginPosition = self.loginBtn.center
        self.loginBtn.center.x -= self.view.bounds.width
        
        
        self.view.addSubview(self.warningMessage)
        self.warningMessage.hidden = true
        self.warningMessage.center = self.loginPosition
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //同一组动画 usingSpringWithDamping 要一样,数字越小速度越快  options的选项为空的话不能写nil了 只能[]
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
        
        //logo 动画
        UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
            self.logo.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(5, delay: 1, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: [], animations: { 
            self.dot.center.x += self.view.bounds.width/2
            }, completion: nil)
        
        //userName password
        UIView.animateWithDuration(0.4, delay: 0.6, options: .CurveEaseOut, animations: { 
            self.userName.center.x += self.view.bounds.width
            }, completion: nil)
        UIView.animateWithDuration(0.4, delay: 0.7, options: .CurveEaseOut, animations: { 
            self.password.center.x += self.view.bounds.width
            }, completion: nil)
        
        //loginBtn 
        UIView.animateWithDuration(0.5, delay: 0.8, options: .CurveEaseOut, animations: { 
            self.loginBtn.center.x += self.view.bounds.width
            }, completion: nil)
        
    }
    @IBAction func login(sender: AnyObject) {
        
        self.loginBtn.addSubview(self.spinner)
        self.spinner.frame.origin = CGPointMake(8, 8)
        self.spinner.startAnimating()
        
        UIView.transitionWithView(self.warningMessage, duration: 0.3, options: .TransitionFlipFromTop, animations: { 
            self.warningMessage.hidden = true
            }, completion: nil)
        
       UIView.animateWithDuration(0.3, animations: { 
        
        self.loginBtn.center = self.loginPosition;
        
        }, completion: { _ in
            
            
            self.loginBtn.center.x -= 30
            
            UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: { 
                
                    self.loginBtn.center.x += 30
                
                }, completion: { (Bool) in
                    
                    UIView.animateWithDuration(0.3, animations: { 
                        
                        self.loginBtn.center.y += 90
                        self.spinner.removeFromSuperview()
                        
                        }, completion: { (Bool) in
                            
                            UIView.transitionWithView(self.warningMessage, duration: 0.3, options: [.TransitionFlipFromTop, .CurveEaseOut], animations: {
                                
                                    self.warningMessage.hidden = false
                                
                                }, completion: nil)
                    })
            })
            
       })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

