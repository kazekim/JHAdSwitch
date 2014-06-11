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
   s.subspec 'AdMob' do |ad|
    ad.source_files = 'JHAdSwitch/AdMob'
    ad.dependency 'AdMob', :podspec => 'https://raw.githubusercontent.com/kazekim/Private-Cocoapods/master/podspec/GoogleAdmob.podspec'
    ad.prefix_header_contents = '#define JHADSWITCH_ADMOB 1'
  end
end
