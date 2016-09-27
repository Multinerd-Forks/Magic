Pod::Spec.new do |s|
  s.name         = "Magic"
  s.version      = "1.0.0"
  s.summary      = "Some useful Swift extensions."
  s.homepage     = "https://github.com/SwiftyMagic/Magic"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "broccoliii" => "broccoliii.me@gmail.com" }
  s.source       = { :git => "https://github.com/SwiftyMagic/Magic.git", :tag => "1.0.0" }
  s.source_files = 'Magic/Magic/*.{h,swift}'
  s.frameworks   = 'Foundation'
  s.requires_arc = true
end
