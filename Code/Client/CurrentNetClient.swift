//
//  CurrentNetState.swift
//  Platform
//
//  Created by three stone 王 on 2018/1/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import Alamofire

public struct CurrentNetClient {
    
    public static let `default`: CurrentNetClient = CurrentNetClient()
    
    private init() { }
    
    fileprivate var manager: NetworkReachabilityManager =  NetworkReachabilityManager.default!
    
    public enum NetWorkStatus {
        case notReachable
        
        case wwan
        
        case ethernetOrWiFi
        
        case cellular
        
        case unknown
    }
}
extension CurrentNetClient {
    
    public func startListen(handler: @escaping (NetWorkStatus) -> ()) {
        
        manager.startListening { (status) in
            
            
            switch status {
            case .notReachable:
                
                handler(.notReachable)
            case .reachable(let aTYpe):
                
                
                switch aTYpe {
                    
                case .ethernetOrWiFi: handler(.ethernetOrWiFi)
                case .cellular: handler(.cellular)
                }
                
            case .unknown:
                
                handler(.unknown)
            }
        }
    }
    
    public func stopListen() {
        
        manager.stopListening()
    }
}
