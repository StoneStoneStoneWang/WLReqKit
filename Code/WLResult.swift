//
//  WLResult.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2018/12/14.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation

public enum WLResult {
    case begin(message: String)
    case ok(message: String)
    case failed(message: String)
    case empty
}

extension WLResult {
    
    var description: String {
        switch self {
        case let .ok(message):
            return message
        case let .failed(message):
            return message
        case let .begin(message):
            return message
        default:
            return ""
        }
    }
}
