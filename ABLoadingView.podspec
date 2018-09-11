#
# Be sure to run `pod lib lint ABLoadingView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ABLoadingView'
  s.version          = '0.1.0'
  s.summary          = 'Simple Loading view screen with customisation'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a library that uses a singleton to create a loading view screen that can be customisable
                       DESC

  s.homepage         = 'https://github.com/andreasbagias/ABLoadingView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andreasbagias' => 'andreasbagias@gmail.com' }
  s.source           = { :git => 'https://github.com/andreasbagias/ABLoadingView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.1'
  s.source_files = 'ABLoadingView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ABLoadingView' => ['ABLoadingView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
