Pod::Spec.new do |s|
  s.name = "Google-AdMob-Ads-SDK"
  s.version = "6.9.2"
  s.summary = "Google AdMob Ads SDK."
  s.description = "The Google AdMob Ads SDK allows developers to easily incorporate mobile-friendly text and image banners as well as rich, full-screen web apps known as interstitials."
  s.homepage = "https://developers.google.com/mobile-ads-sdk/docs/"

  s.license = {
    :type => 'Copyright',
    :text => <<-LICENSE
Copyright 2009 - 2014 Google, Inc. All rights reserved.
LICENSE
  }
  s.author = 'Google Inc.'
  s.source = { :http => "http://dl.google.com/googleadmobadssdk/googlemobileadssdkios.zip" }
  s.platform = :ios

  s.source_files = 'GoogleMobileAdsSdkiOS-6.9.2/*.h'
  s.preserve_paths = 'GoogleMobileAdsSdkiOS-6.9.2'

  s.framework = %w{AVFoundation AudioToolbox CoreTelephony MessageUI SystemConfiguration CoreGraphics AdSupport}
  s.library = 'GoogleAdMobAds'
  s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/Google-AdMob-Ads-SDK/GoogleMobileAdsSdkiOS-6.9.2"' }
end
