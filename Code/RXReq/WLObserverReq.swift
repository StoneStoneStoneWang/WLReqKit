//
//  WLObserverReq.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2018/12/14.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import Alamofire

public protocol WLObserverReq {
    /*
     reqName 请求接口名 如 app/user/v1/login
     */
    var reqName: String { get }
    /*
     params 请求 参数
     */
    var params: Dictionary<String,Any> { get }
    /*
     params 请求头
     */
    var headers: Dictionary<String,String> { get }
    
    var method: HTTPMethod { get }
    
    var host: String { get }
}
