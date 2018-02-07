Pod::Spec.new do |s|

  s.name         = "SwiftMarkdown"
  s.version      = "0.0.1"
  s.summary      = "Library for formatting markdown in swift"
  s.description  = "SwiftMarkdown is library for parsing and formatting strings with markdown tags"
  s.author       = { "Vinicius Rodrigues" => "vinicius.a.ro@gmail.com" }
  s.platform     = :ios
  s.homepage     = "https://github.com/viniciusaro/SwiftMarkdown.git"
  s.source       = { :git => "git@github.com:viniciusaro/SwiftMarkdown.git", :tag => "#{s.version}" }

  s.source_files  = ["SwiftMarkdown/SwiftMarkdown/Classes/**/*.{h,m,swift}"]
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.static_framework = true
  
end
