//
//  WLURLSessionClient.swift
//  ReqKit
//
//  Created by three stone 王 on 2017/12/21.
//  Copyright © 2017年 three stone 王. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

open class WLURLSessionClient {
    
    static let `default`: WLURLSessionClient = WLURLSessionClient()
    
    private init() { }
    
    public var host: String = ""
    
    public func setHost(_ host: String) {
        
        self.host = host
    }
}

extension WLURLSessionClient: WLClient {
    
    public func onSendReq<T>(_ req: T) -> Observable<Any?> where T : WLBaseReq {
        
        return Observable<Any?>.create({ (observer) -> Disposable in
            
            request(URL(string: WLURLSessionClient.default.host + req.reqName)!, method: req.method, parameters: req.params, encoding: URLEncoding.default, headers: req.headers).responseJSON { (response) in
                
                debugPrint(response)
                
                switch response.result {
                    
                case let .success(value):
                    
                    observer.onNext(value)
                    
                    observer.onCompleted()
                    
                case let .failure(error):
                    
                    observer.onError(WLBaseError.HTTPFailed(error))
                }
            }
            
            return Disposables.create {
                
                
            }
        })
    }
    
    
    public func onSendReq<T>(_ req: T, success: @escaping (T.Resp) -> (), failure: @escaping (Error) -> ()) where T : WLBaseReq  {
        
        request(URL(string: host + req.reqName)!, method: req.method, parameters: req.params, encoding: URLEncoding.default, headers: req.headers).responseJSON { (response) in
            
            if response.result.isSuccess {
                
                do {
                    
                    let data = try JSONSerialization.jsonObject(with: response.data!, options: .mutableLeaves)
                    
                    success(T.parse(data: data))
                    
                } catch {
                    
                    failure(WLBaseError.MapperError("WLBaseReq 不是json"))
                }

            } else {
                
                failure(WLBaseError.HTTPFailed(response.result.error!))
            }
        }
    }
}
