#
#  Be sure to run `pod spec lint NextGenDataManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name            = 'NextGenDataManager'
  s.version         = '0.0.1'
  s.summary         = 'Manifest.XML parser and full one-to-one mapping of the Manifest and Common Metadata specs to Swift objects'
  s.license         = 'Apache License, Version 2.0'
  s.homepage        = 'https://bitbucket.org/wbdigital/nextgen-data'
  s.author          = { 'Alec Ananian' => 'alec.ananian@warnerbros.com' }

  s.platform        = :ios, '8.0'
  s.libraries       = 'xml2'
  
  s.source          = { :git => 'https://bitbucket.org/wbdigital/nextgen-data.git', :tag => s.version.to_s }
  s.source_files    = 'ios/Source/Base/*.swift', 'ios/Source/*.swift'
  
  s.preserve_path   = 'ios/Source/libxml/module.modulemap'
  s.xcconfig        = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2',
                        'SWIFT_INCLUDE_PATHS' => '$(SRCROOT)/NextGenDataManager/ios/Source/libxml'
                      }

end