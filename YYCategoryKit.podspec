#
# Be sure to run `pod lib lint YYCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYCategoryKit'
  s.version          = '0.0.9'
  s.summary          = '自己积累的分类方法'

  s.description      = <<-DESC
    自己积累的分类方法,便于快速开发
                          DESC

  s.homepage         = 'https://github.com/yuanyuan100/YYCategory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yuanyuan100' => '469092943@qq.com' }
  s.source           = { :git => 'https://github.com/yuanyuan100/YYCategory.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  
  s.public_header_files = 'YYCategoryKit/Classes/**/*.h'
  s.source_files = 'YYCategoryKit/Classes/**/*.{h,m}'
  
  s.frameworks = 'UIKit', 'Foundation'
  
end
