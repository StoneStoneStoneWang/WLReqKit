//
//  ViewController.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2018/12/6.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        WLURLSessionClient.default.setHost("https://www.jiutouzhu.com/api")
        
        LoginClient.default.onLogin(phone: "18612598269", secret: "123456", success: { (user) in
            
            print(user.id)
            
        }) {
            
            
        }
    }


}

