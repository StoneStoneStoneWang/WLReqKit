# WLReqKit

## 原方式的请求
func onSendReq<T: WLBaseReq>(_ req: T,success: @escaping (T.Resp) -> (),failure: @escaping (Error) -> ())
## rx方式的请求
func onSendReq<T : WLBaseReq>(_ req: T) -> Observable<Any?>
