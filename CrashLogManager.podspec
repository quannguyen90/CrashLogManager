#
# Be sure to run `pod lib lint CrashLogManager.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "CrashLogManager"
    s.version          = "0.1.2"
    s.summary          = "CrashLogManager."

    s.homepage         = "https://github.com/quannguyen90/CrashLogManager"
    # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
    s.license          = 'MIT'
    s.author           = { "Quan Nguyen Van" => "quannv.tm@gmail.com" }
    s.source           = { :git => "https://github.com/quannguyen90/CrashLogManager.git", :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

    s.platform     = :ios, '7.0'
    s.requires_arc = true

    s.source_files = 'Pod/Classes/CrashLogManager/*.{h,m}'

    s.resource_bundles = {
        'CrashLog' => ['Pod/Assets/*.png']
    }

    s.subspec 'IQParseSDK' do |s1|
        s1.source_files = 'Pod/Classes/CrashLogManager/IQParseSDK/*.{h,m}'
    end

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'MobileCoreServices'
  # s.dependency 'AFNetworking', '~> 2.3'

end
