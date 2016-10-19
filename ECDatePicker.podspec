#
# Be sure to run `pod lib lint ECDatePicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ECDatePicker'
  s.version          = '1.0.0'
  s.summary          = 'ECDatePicker是一个轻量级的DatePicker.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    ECDatePIcker是一个轻量级的DatePicker,支持时间、日期、时间日期选择.
                       DESC

  s.homepage         = 'https://github.com/cike534222598/ECDatePicker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jame' => 'cike534222598@qq.com' }
  s.source           = { :git => 'https://github.com/cike534222598/ECDatePicker.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'ECDatePicker/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ECDatePicker' => ['ECDatePicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
