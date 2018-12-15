//
//  WLClient.swift
//  ReqKit
//
//  Created by three stone 王 on 2017/12/21.
//  Copyright © 2017年 three stone 王. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public protocol WLClient {
    
    var host: String { get }
    
    func onSendReq<T: WLBaseReq>(_ req: T,success: @escaping (T.Resp) -> (),failure: @escaping (Error) -> ())
    
    func onSendReq<T : WLBaseReq>(_ req: T) -> Observable<[String:Any]>
}

