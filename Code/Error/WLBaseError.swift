//
//  WLBaseError.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2018/12/14.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation

public enum WLBaseError: Error {
    
    case HTTPFailed(_ error: Error)
    
    case MapperError(_ msg: String)
    
    case ServerResponseError(_ msg: String)
}

extension WLBaseError {
    
    public var description: (String,Error?) {
        
        switch self {
        case let .HTTPFailed(e):
            
            return (e.localizedDescription,e)
        case let .MapperError(msg):
            
            return (msg ,nil)
        case let .ServerResponseError(msg):
            
            return (msg ,nil)
        }
    }
}
