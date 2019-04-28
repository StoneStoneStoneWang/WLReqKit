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
    
    fileprivate var manager: NetworkReachabilityManager =  NetworkReachabilityManager()!
    
    public enum NetWorkStatus {
        case notReachable
        
        case wwan
        
        case ethernetOrWiFi
        
        case unknown
    }
}
extension CurrentNetClient {
    
    public func startListen(handler: @escaping (NetWorkStatus) -> ()) {
        
        manager.startListening()
        
        switch manager.networkReachabilityStatus {
        case .notReachable:
            
            handler(.notReachable)
        case .reachable(.ethernetOrWiFi):
            
            handler(.ethernetOrWiFi)
        case .reachable(.wwan):
            
            handler(.wwan)
        case .unknown:
            
            handler(.unknown)
        }
    }
    
    public func stopListen() {
        
        manager.stopListening()
    }
}
