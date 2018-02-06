#
# Be sure to run `pod lib lint YYCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YYCategoryKit'
  s.version          = '0.0.2'
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
  
  s.public_header_files = 'YYCategory/Classes/YYCategoryHeader.h'
  s.source_files = 'YYCategory/Classes/YYCategoryHeader.h'
  
  s.subspec 'NSBundle' do |ss|
      ss.source_files = 'YYCategory/Classes/NSBundle/*.{h,m}'
  end
  s.subspec 'NSDictionary' do |ss|
      ss.source_files = 'YYCategory/Classes/NSDictionary/*.{h,m}'
  end
  s.subspec 'NSObject' do |ss|
      ss.source_files = 'YYCategory/Classes/NSObject/*.{h,m}'
  end
  s.subspec 'UIApplication' do |ss|
      ss.source_files = 'YYCategory/Classes/UIApplication/*.{h,m}'
  end
  s.subspec 'UIBarButtonItem' do |ss|
      ss.source_files = 'YYCategory/Classes/UIBarButtonItem/*.{h,m}'
  end
  s.subspec 'UIControl' do |ss|
      ss.source_files = 'YYCategory/Classes/UIControl/*.{h,m}'
  end
  s.subspec 'UIView' do |ss|
      ss.source_files = 'YYCategory/Classes/UIView/*.{h,m}'
  end
  s.subspec 'UIAlertController' do |ss|
     ss.source_files = 'YYCategory/Classes/UIAlertController/*.{h,m}'
  end
  
  #s.subspec '<#name#>' do |ss|
  #   <#content#>
  #end
  
  # s.resource_bundles = {
  #   'YYCategory' => ['YYCategory/Assets/*.png']
  # }

  s.frameworks = 'UIKit', 'Foundation'
  
end
