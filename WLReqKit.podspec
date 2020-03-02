Pod::Spec.new do |spec|
  
  spec.name         = "WLReqKit"
  spec.version      = "0.1.8"
  spec.summary      = "A Lib For req."
  spec.description  = <<-DESC
  面向协议的Alamofire、RxSwift封装
  DESC
  
  spec.homepage     = "https://github.com/StoneStoneStoneWang/WLReqKit"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
  spec.platform     = :ios, "10.0"
  spec.ios.deployment_target = "10.0"
  
  spec.swift_version = '5.0'
  
  spec.frameworks = 'UIKit', 'Foundation'
  
  spec.source = { :git => "https://github.com/StoneStoneStoneWang/WLReqKit.git", :tag => "#{spec.version}" }
  
  spec.source_files = "Code/**/*.{swift}"
  
  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  spec.static_framework = true
  
  spec.subspec 'RXReq' do |req|
    
    req.source_files = "Code/RXReq/*.{swift}"
    req.dependency 'Alamofire'
  end
  
  spec.subspec 'Error' do |error|
    
    error.source_files = "Code/Error/*.{swift}"
    error.dependency 'Alamofire'
    error.dependency 'Alamofire'
    error.dependency 'ObjectMapper'
  end
  
  spec.subspec 'Func' do |func|
    
    func.source_files = "Code/Func/*.{swift}"
    func.dependency 'Alamofire'
    func.dependency 'RxSwift'
    func.dependency 'WLReqKit/RXReq'
    func.dependency 'WLReqKit/Error'
    func.dependency 'WLToolsKit/Image'
  end
  
end


