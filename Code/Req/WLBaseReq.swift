//
//  WLBaseReq.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2019/1/3.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import Alamofire

public protocol WLBaseReq {
    /*
     reqName 请求接口名 如 app/user/v1/login
     */
    var reqName: String { get }
    /*
     params 请求 参数
     */
    var params: Dictionary<String,Any> { set get }
    /*
     params 请求头
     */
    var headers: Dictionary<String,String> { get }
    /*
     params 返回数据 统一格式
     */
    associatedtype Resp
    /*
     解析数据 并返回的类型
     */
    static func parse(data: Any) -> Resp
    
    var method: HTTPMethod { get }
}

// 17710470351@163.com Dizhubi0351
