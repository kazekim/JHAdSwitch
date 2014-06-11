Pod::Spec.new do |s|
    s.name         = "JHAdSwitch"
    s.version      = "1.0.0"
    s.summary      = "Custom UIView for switch between iAd and Admob"
    s.homepage     = "https://github.com/kazekim/JHAdSwitch/"
    s.license      = { :type => 'MIT', :text => 'The JHAdSwitch source code is copyright 2014 Jirawat Harnsiriwatanakit and is licensed under the terms of the MIT license.' }
    s.author       = { "Jirawat Harnsiriwatanakit" => "jirawat.h@kazekim.com" }
    s.platform     = :ios, '6.0'
    s.source       = { :git => "https://github.com/kazekim/JHAdSwitch.git" }
    s.source_files = 'Classes', 'JHAdView/*'
    s.framework    = 'iAd'
    s.requires_arc = true

  ### Subspecs
  s.subspec 'Google-AdMob-Ads-SDK' do |gaa|
    gaa.source_files = 'GoogleMobileAdsSdkiOS-6.9.2/*.h'
    gaa.source = { :http => "http://dl.google.com/googleadmobadssdk/googlemobileadssdkios.zip" }
    gaa.source_files = 'GoogleMobileAdsSdkiOS-6.9.2/*.h'
    gaa.preserve_paths = 'GoogleMobileAdsSdkiOS-6.9.2'
  end
end
