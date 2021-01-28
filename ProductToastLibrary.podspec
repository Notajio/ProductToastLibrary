Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "ProductToastLibrary"
s.summary = "Display toasts according to our product specifications."
s.requires_arc = true

# 2
s.version = "0.1.1"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4
s.author = { "Benjamin N" => "nardin.ben@gmail.com" }

# 5
s.homepage = "https://github.com/Notajio/PTLPodSpecs"

# 6
s.source = { :git => "https://github.com/Notajio/ProductToastLibrary.git",
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"
s.dependency 'SwiftMessages', '~> 9.0'
s.dependency 'AFNetworking', '~> 4.0'

# 8
s.source_files = "ProductToastLibrary/**/*.{swift}"

# 9
s.resources = "ProductToastLibrary/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5.0"

end
