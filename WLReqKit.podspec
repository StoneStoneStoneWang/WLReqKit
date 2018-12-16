Pod::Spec.new do |s|

s.name         = "WLReqKit"
s.version      = "0.0.8"
s.summary      = "A Lib For req."
s.description  = <<-DESC
面向协议的Alamofire、RxSwift封装
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/WLReqKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.swift_version = '4.2'

s.frameworks = 'UIKit', 'Foundation'

s.source = { :git => "https://github.com/StoneStoneStoneWang/WLReqKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{swift}"

s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

s.static_framework = true

s.dependency 'Alamofire'

s.dependency 'RxSwift'

s.dependency 'RxCocoa'

s.dependency 'ObjectMapper'

end


