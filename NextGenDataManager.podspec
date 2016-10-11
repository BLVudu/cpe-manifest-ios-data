Pod::Spec.new do |s|

  s.name            = 'NextGenDataManager'
  s.version         = '2.1.0'
  s.summary         = 'Manifest.XML parser and full one-to-one mapping of the Manifest and Common Metadata specs to Swift objects'
  s.license         = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.homepage        = 'https://github.com/warnerbros/cpe-manifest-ios-data'
  s.author          = { 'Alec Ananian' => 'alec.ananian@warnerbros.com' }

  s.platform        = :ios, '8.0'
  s.libraries       = 'xml2'
  
  s.source          = { :git => 'https://github.com/warnerbros/cpe-manifest-ios-data.git', :tag => s.version.to_s }
  s.source_files    = 'Source/**/*.swift', 'Source/*.swift'
  
  s.preserve_path   = 'Source/libxml/module.modulemap'
  s.pod_target_xcconfig = { 
    'HEADER_SEARCH_PATHS' => '/usr/include/libxml2', 
    'SWIFT_INCLUDE_PATHS' => '~/Documents/Source/cpe-manifest-ios-data/Source/libxml',
    'SWIFT_VERSION' => '3.0' 
  }

end
