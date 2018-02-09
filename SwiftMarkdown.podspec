Pod::Spec.new do |s|

  s.name         = "SwiftMarkdown"
  s.version      = "0.0.2"
  s.summary      = "Library for formatting markdown in swift"
  s.description  = "SwiftMarkdown is library for parsing and formatting strings with markdown tags"
  s.author       = { "Vinicius Rodrigues" => "vinicius.a.ro@gmail.com" }
  s.platform     = :ios
  s.homepage     = "https://github.com/viniciusaro/SwiftMarkdown.git"
  s.source       = { :git => "https://github.com/viniciusaro/SwiftMarkdown.git", :tag => "#{s.version}" }
  s.social_media_url = 'https://twitter.com/vinizzera'

  s.source_files  = ["SwiftMarkdown/SwiftMarkdown/Classes/**/*.{h,m,swift}"]
  s.license       = { :type => 'MIT', :file => 'LICENSE' }

  s.static_framework = true

  s.ios.deployment_target = '9.3'
  
end
