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
