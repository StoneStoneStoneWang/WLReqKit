//
//  WLBaseReqFunc.swift
//  WLReqKitDemo
//
//  Created by three stone 王 on 2019/1/3.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import WLToolsKit

// MARK: onSendReq
public func onSendReq<T : WLObserverReq>(_ req: T) -> Observable<[String:Any]> {
    
    return Observable<[String:Any]>.create({ (observer) -> Disposable in
        
        request(URL(string: req.host + req.reqName)!, method: req.method, parameters: req.params, encoding: URLEncoding.default, headers: req.headers).responseJSON { (response) in
            
            switch response.result {
                
            case let .success(result):
                
                observer.onNext(result as! [String : Any])
                
                observer.onCompleted()
                
            case let .failure(error):
                
                observer.onError(error)
            }
        }
        
        return Disposables.create { }
    })
}
// MARK: WLUploadStatus
public enum WLUploadStatus {
    
    case begin
    
    case uploading(_ percent: CGFloat)
    
    case succ(_ result: [String: Any])
    
    case error(_ error: String)
}

// MARK: uploadImage
public func uploadImage<T : WLObserverReq>(_ req: T,img: UIImage ,filename: String) -> Observable<WLUploadStatus> {
    
    return Observable<WLUploadStatus>.create({ (observer) -> Disposable in
        
        upload(multipartFormData: { (form) in
            
            observer.onNext(WLUploadStatus.begin)
            
            let data = UIImage.compressImage(img, maxLength: 50 * 1024)
            
            form.append(data, withName: "file", fileName: UIImage.wl_imagePath(data: data, imageName: filename), mimeType: "image/png")
            
        }, to: URL(string: req.host + req.reqName)!, method: req.method, headers: req.headers, encodingCompletion: { (result) in
            
            switch result{
            case let .success(request: upload, streamingFromDisk: _, streamFileURL: _):
                
                upload.uploadProgress(closure: { (p) in
                    
                    observer.onNext(WLUploadStatus.uploading(CGFloat(p.completedUnitCount) / CGFloat(p.totalUnitCount)))
                })
                
                upload.responseJSON(completionHandler: { (response) in
                    
                    observer.onNext(WLUploadStatus.succ(response.value! as! [String : Any]))
                    
                    observer.onCompleted()
                })
                
            case let .failure(error):
                
                observer.onError(error)
            }
        })
        
        return Disposables.create { }
    })
}
// MARK: uploadVideo
public func uploadVideo<T : WLObserverReq>(_ req: T ,data: Data,filename: String) -> Observable<WLUploadStatus> {
    
    return Observable<WLUploadStatus>.create({ (observer) -> Disposable in
        
        upload(multipartFormData: { (form) in
            
            observer.onNext(WLUploadStatus.begin)
            
            form.append("file".data(using: .utf8)!, withName: "name")
            
            form.append(data, withName: "file", fileName: filename, mimeType: "video/mp4")
            
        }, to: URL(string: req.host + req.reqName)!, method: req.method, headers: req.headers, encodingCompletion: { (result) in
            
            switch result{
            case let .success(request: upload, streamingFromDisk: _, streamFileURL: _):
                
                upload.uploadProgress(closure: { (p) in
                    
                    observer.onNext(WLUploadStatus.uploading(CGFloat(p.completedUnitCount) / CGFloat(p.totalUnitCount)))
                })
                
                upload.responseJSON(completionHandler: { (response) in
                    
                    observer.onNext(WLUploadStatus.succ(response.value! as! [String : Any]))
                    
                    observer.onCompleted()
                })
                
            case let .failure(error):
                
                observer.onError(error)
            }
        })
        
        return Disposables.create { }
    })
}
