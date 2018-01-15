#
# Be sure to run `pod lib lint YYCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYCategory'
  s.version          = '0.0.1'
  s.summary          = 'A short description of YYCategory.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yuanyuan100/YYCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yuanyuan100' => '469092943@qq.com' }
  s.source           = { :git => 'https://github.com/yuanyuan100/YYCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  #s.source_files = 'YYCategory/Classes/**/*.{h,m}'

  s.subspec 'NSBundle' do |ss|
      ss.source_files = 'YYCategory/Classes/NSBundle/*.{h,m}'
      ss.frameworks = 'Foundation'
  end
  s.subspec 'NSDictionary' do |ss|
      ss.source_files = 'YYCategory/Classes/NSDictionary/*.{h,m}'
      ss.frameworks = 'Foundation'
  end
  s.subspec 'NSObject' do |ss|
      ss.source_files = 'YYCategory/Classes/NSObject/*.{h,m}'
      ss.frameworks = 'Foundation'
  end
  s.subspec 'UIApplication' do |ss|
      ss.source_files = 'YYCategory/Classes/UIApplication/*.{h,m}'
      ss.frameworks = 'UIKit'
  end
  s.subspec 'UIBarButtonItem' do |ss|
      ss.source_files = 'YYCategory/Classes/UIBarButtonItem/*.{h,m}'
      ss.frameworks = 'UIKit'
  end
  s.subspec 'UIControl' do |ss|
      ss.source_files = 'YYCategory/Classes/UIControl/*.{h,m}'
      ss.frameworks = 'UIKit'
  end
  s.subspec 'UIView' do |ss|
      ss.source_files = 'YYCategory/Classes/UIView/*.{h,m}'
      ss.frameworks = 'UIKit'
  end
  #s.subspec '<#name#>' do |ss|
  #   <#content#>
  #end
  
  # s.resource_bundles = {
  #   'YYCategory' => ['YYCategory/Assets/*.png']
  # }

  #s.public_header_files = 'Pod/Classes/**/*.h'
  # s.dependency 'AFNetworking', '~> 2.3'
end
