#
# Be sure to run `pod lib lint Voltron.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Voltron"
  s.version          = "0.1.0"
  s.summary          = "UICollectionViewCell meets UIViewController"
  s.description      = <<-DESC
                       When UICollectionViewCell simply won't cut it, try Voltron,
                       a simple subclass of UICollectionView allowing to use
                       view controllers instead of cells.
                       DESC
  s.homepage         = "https://github.com/zats/Voltron"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Sash Zats" => "sash@zats.io" }
  s.source           = { :git => "https://github.com/zats/Voltron", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/zats'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'Voltron' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end
