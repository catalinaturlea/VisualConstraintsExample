#
# Be sure to run `pod lib lint VisualConstraints.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "VisualConstraints"
  s.version          = "1.0.0"
  s.summary          = "Small library for making it easy to programmatically add constraints"
  s.description      = <<-DESC
                       The Pod provides methods to easily add and debug constraints programmatically. It includes methods for the most commonly used layouting of UI elements. The Pod also includes methods to ease the use of scrollviews and autolayout.

                       DESC
  s.homepage         = "https://github.com/catalinaturlea/visualConstraints"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Catalina Turlea" => "catalina.turlea@gmail.com" }
s.source           = { :git => "https://github.com/catalinaturlea/visualConstraints.git", :tag => s.version, :commit => "e14c0608687eba8b3a8aaf23aa30f6f7d2a3a25" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*'
  s.resource_bundles = {
    'VisualConstraints' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'CocoaLumberjack'
end
