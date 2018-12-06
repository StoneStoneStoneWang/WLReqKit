//
//  LoginClient.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2018/12/6.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

public class LoginClient: NSObject {
    
    static let `default`: LoginClient = LoginClient()
}

protocol LoginRequest: WLBaseReq {
    
    
}
extension LoginRequest {
    
    mutating func onLogin(phone: String,secret: String,success: @escaping (Resp) -> (),failure: @escaping () -> ()) {
        
        params.updateValue(secret, forKey: "password")
        
        params.updateValue(phone, forKey: "username")
        
        params.updateValue("iphone", forKey: "device_type")
        
        WLURLSessionClient.default.onSendReq(self, success: success) { (error) in
            
            failure()
        }
    }
}
extension LoginClient {
    
    func onLogin(phone: String,secret: String ,success: @escaping (UserBean) -> (),failure: @escaping () -> ())  {
        
        var req = LoginReq()
        
        req.onLogin(phone: phone, secret: secret, success: success, failure: failure)
    }
}
open class BaseBean: Mappable {
    public required init?(map: Map) {
        
        
    }
    
    public func mapping(map: Map) {
        
        data <- map["data"]
    }
    
    var data: Any!
}

open class DataBean: Mappable {
    
    public required init?(map: Map) {
        
        
    }
    
    public func mapping(map: Map) {
        
        user <- map["user"]
    }
    
    var user: UserBean!
}

struct LoginReq: LoginRequest {
    static func parse(data: Any) -> UserBean {
        
        let base = BaseBean(JSON: data as! [String :Any])
        
        let data = DataBean(JSON: base!.data as! [String :Any])
        
        return data!.user
    }
    
    var method: HTTPMethod {
        
        return .post
    }
    
    var reqName: String {
        
        return "/user/public/login?"
    }
    var headers: Dictionary<String, String> {
        return [:]
    }
    var params: Dictionary<String, Any> = [:]
    
    typealias Resp = UserBean
}

public class UserBean: Mappable {
    public required init?(map: Map) {
        
    }
    public func mapping(map: Map) {
        
        user_nickname    <- map["user_nickname"]
        
        id  <- map["id"]
    }
    
    var id: String = ""
    
    var user_nickname: String = ""
}
