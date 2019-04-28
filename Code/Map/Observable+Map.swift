//
//  Observable+Map.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2018/12/6.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

public enum WLRxObjectMapperError: Error {
    case parsingError
}

//扩展Observable：增加模型映射方法
extension Observable where Element:Any {
    
    //将JSON数据转成对象
    public func mapObject< T>(type:T.Type) -> Observable<T> where T:Mappable {
        let mapper = Mapper<T>()
        
        return self.map { (element) -> T in
            guard let parsedElement = mapper.map(JSONObject: element) else {
                throw WLRxObjectMapperError.parsingError
            }
            
            return parsedElement
        }
    }
    
    //将JSON数据转成数组
    public func mapArray< T>(type:T.Type) -> Observable<[T]> where T:Mappable {
        let mapper = Mapper<T>()
        
        return self.map { (element) -> [T] in
            guard let parsedArray = mapper.mapArray(JSONObject: element) else {
                throw WLRxObjectMapperError.parsingError
            }
            
            return parsedArray
        }
    }
}
