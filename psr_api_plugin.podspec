#
# Be sure to run `pod lib lint psr_api_plugin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'psr_api_plugin'
  s.swift_version = "5.2.4"
  s.version          = '1.2.0'

  s.summary          = 'psr_api_plugin is a cocoapods that extends the UIImageView class'

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
  "SKImageExtension is a cocoapods that extends the UIImageView class with a convinence method for circling an image view with specified border color and width"
                         DESC

  s.homepage         = 'https://github.com/mhdcamara/psr_api_plugin'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mhdcamara' => 'camara.mouhamed@paydunya.com' }
  s.source           = { :git => 'https://github.com/mhdcamara/psr_api_plugin.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'psr_api_plugin/Classes/**/*'
  
  # s.resource_bundles = {
  #   'psr_api_plugin' => ['psr_api_plugin/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
   s.dependency 'Alamofire', '~> 4.8.2'
end
