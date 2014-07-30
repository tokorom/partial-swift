Pod::Spec.new do |s|
  s.name         = "partial-swift"
  s.version      = "0.1.0"
  s.summary      = "partial application (currying) for Swift"
  s.homepage     = "https://github.com/tokorom/partial-swift"
  s.license      = "MIT"
  s.author       = { "tokorom" => "tokorom@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/tokorom/partial-swift.git", :tag => "0.1.0" }
  s.source_files = "partial-swift/*"
  s.requires_arc = true
end
