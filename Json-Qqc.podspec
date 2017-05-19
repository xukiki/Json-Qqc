Pod::Spec.new do |s|

  s.license      = "MIT"
  s.author       = { "qqc" => "20599378@qq.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc  = true

  s.name         = "Json-Qqc"
  s.version      = "1.0.70"
  s.summary      = "Json-Qqc"
  s.homepage     = "https://github.com/xukiki/Json-Qqc"
  s.source       = { :git => "https://github.com/xukiki/Json-Qqc.git", :tag => "#{s.version}" }
  
  s.source_files  = ["Json-Qqc/*.{h,m}"]
  s.dependency  = "QqcBaseModel"

end
